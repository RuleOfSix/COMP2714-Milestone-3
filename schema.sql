DROP SCHEMA IF EXISTS lab_tracker_group_24 CASCADE;
CREATE SCHEMA lab_tracker_group_24;
SET search_path TO lab_tracker_group_24;

CREATE TYPE term_season AS ENUM ('Spring/Summer', 'Fall', 'Winter');
CREATE TYPE section_type AS ENUM ('Lecture', 'Lab');
CREATE TYPE campus as ENUM ('Burnaby', 'Downtown');
CREATE TYPE enroll_status AS ENUM ('Enrolled', 'Withdrawn', 'Audit', 'Dropped');
CREATE TYPE progress_field AS ENUM (
	'attendance',
	'prepared',
	'submitted',
	'submission_time',
	'submission_link',
	'resubmitted',
	'resubmission_time',
	'resubmission_link',
	'self_assessment_score',
	'instructor_score'
);

CREATE TABLE course (
	course_code VARCHAR(10) NOT NULL,
	course_title VARCHAR(100) NOT NULL,
	course_credits INT NOT NULL,
	CONSTRAINT course_code_pk PRIMARY KEY (course_code),
	CONSTRAINT course_title_unique UNIQUE (course_title),
	CONSTRAINT course_credits_in_range CHECK (course_credits > -1 AND course_credits < 20)
);

CREATE TABLE instructor (
	instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
	instructor_fname VARCHAR(50) NOT NULL,
	instructor_lname VARCHAR(50) NOT NUll,
	CONSTRAINT instructor_id_pk PRIMARY KEY (instructor_id)
);


CREATE TABLE term (
	term_code VARCHAR(10) GENERATED ALWAYS AS (
		term_year::text || (
			CASE
				WHEN term_season = 'Winter' THEN '10'
				WHEN term_season = 'Spring/Summer' THEN '20'
				WHEN term_season = 'Fall' THEN '30'
			END)
	) STORED,
	term_year INT NOT NULL,
	term_season term_season NOT NULL,
	term_start_date date NOT NULL,
	term_end_date date NOT NULL,
	CONSTRAINT term_code_pk PRIMARY KEY (term_code),
	CONSTRAINT term_start_in_year CHECK (EXTRACT (YEAR FROM term_start_date) = term_year),
	CONSTRAINT term_end_in_year CHECK (EXTRACT (YEAR FROM term_end_date) = term_year)
);

CREATE TABLE set (
	set_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
	set_letter char(1) NOT NULL,
	set_term VARCHAR(10) NOT NULL,
	set_campus VARCHAR(10) GENERATED ALWAYS AS (
		CASE
			WHEN set_letter <= 'D' THEN 'Burnaby'
			WHEN set_letter >= 'E' THEN 'Downtown'
		END
	) STORED NOT NULL,
	CONSTRAINT set_id_pk PRIMARY KEY (set_id),
	CONSTRAINT set_term_fk_term FOREIGN KEY (set_term) REFERENCES term(term_code),
	CONSTRAINT set_letter_term_unique UNIQUE (set_letter, set_term),
	CONSTRAINT set_letter_a_to_f CHECK (
		set_letter = 'A' OR
		set_letter = 'B' OR
		set_letter = 'C' OR
		set_letter = 'D' OR
		set_letter = 'E' OR
		set_letter = 'F'
	)
);

CREATE TABLE student (
	student_id VARCHAR(10) NOT NULL,
	student_fname VARCHAR(50) NOT NULL,
	student_lname VARCHAR(50) NOT NULL,
	student_set_id INT NOT NULL,
	CONSTRAINT student_id_pk PRIMARY KEY (student_id),
	CONSTRAINT student_set_id_fk_set FOREIGN KEY (student_set_id) REFERENCES set(set_id)
);

CREATE TABLE section (
	section_crn VARCHAR(10) NOT NULL,
	section_term VARCHAR(10) NOT NULL,
	section_type section_type NOT NULL,
	section_datetime timestamp NOT NULL,
	section_duration interval NOT NULL,
	section_location VARCHAR(50),
	section_course_code VARCHAR(10) NOT NULL,
	section_instructor_id INT NOT NULL,
	CONSTRAINT section_crn_pk PRIMARY KEY (section_crn),
	CONSTRAINT section_course_code_fk_course FOREIGN KEY (section_course_code) 
		REFERENCES course(course_code) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT section_instructor_id_fk_instructor FOREIGN KEY (section_instructor_id) REFERENCES instructor(instructor_id),
	CONSTRAINT section_term_fk_term FOREIGN KEY (section_term) REFERENCES term (term_code),
	CONSTRAINT section_crn_type_unique UNIQUE (section_crn, section_type),
	CONSTRAINT section_term_datetime_instructor_unique UNIQUE (section_term, section_datetime, section_instructor_id),
	CONSTRAINT section_term_datetime_location_unique UNIQUE (section_term, section_datetime, section_location),
	CONSTRAINT section_start_at_or_after_8_am CHECK (EXTRACT (HOUR FROM section_datetime) >= 8),
	CONSTRAINT section_duration_within_school_day CHECK (section_duration < INTERVAL '8 hours')
);

CREATE TABLE lab_section (
	lsection_crn VARCHAR(10) NOT NULL,
	lsection_set_id INT NOT NULL,
	CONSTRAINT lsection_crn_pk PRIMARY KEY (lsection_crn),
	CONSTRAINT lsection_crn_fk_section FOREIGN KEY (lsection_crn) REFERENCES section (section_crn)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT lsection_set_id_fk FOREIGN KEY (lsection_set_id) REFERENCES set (set_id)
);

CREATE TABLE ta (
	ta_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
	ta_crn VARCHAR(10),
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	CONSTRAINT ta_id_pk PRIMARY KEY (ta_id),
	CONSTRAINT ta_crn_fk_lab_section FOREIGN KEY (ta_crn) REFERENCES lab_section (lsection_crn)
);

CREATE TABLE session (
	session_crn VARCHAR(10) NOT NULL,
	session_date date NOT NULL,
	CONSTRAINT session_crn_date_pk PRIMARY KEY (session_crn, session_date),
	CONSTRAINT session_crn_fk_section FOREIGN KEY (session_crn) REFERENCES section(section_crn)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE lab_session (
	lsession_crn VARCHAR(10) NOT NULL,
	lsession_date date NOT NULL,
	lsession_lab_num INT NOT NULL,
	lsession_assignment_title VARCHAR(255),
	lsession_duedate timestamp,
	CONSTRAINT lsession_crn_date_pk PRIMARY KEY (lsession_crn, lsession_date),
	CONSTRAINT lsession_crn_date_fk_session FOREIGN KEY (lsession_crn, lsession_date) 
		REFERENCES session(session_crn, session_date) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT lsession_crn_lab_num_unique UNIQUE (lsession_crn, lsession_lab_num),
	CONSTRAINT lsession_due_at_or_after_lab_date CHECK (EXTRACT (DOY FROM lsession_duedate) >= EXTRACT (DOY FROM lsession_date))
);

CREATE TABLE set_enroll (
	senroll_set_id INT NOT NULL,
	senroll_crn VARCHAR(10) NOT NULL,
	CONSTRAINT senroll_set_id_crn_pk PRIMARY KEY (senroll_set_id, senroll_crn),
	CONSTRAINT senroll_set_id_fk_set FOREIGN KEY (senroll_set_id) REFERENCES set(set_id),
	CONSTRAINT senroll_crn_fk_section FOREIGN KEY (senroll_crn) REFERENCES section(section_crn)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE enroll (
	enroll_student_id VARCHAR(10) NOT NULL,
	enroll_crn VARCHAR(10) NOT NULL,
	CONSTRAINT enroll_student_id_crn_pk PRIMARY KEY (enroll_student_id, enroll_crn),
	CONSTRAINT enroll_student_id_fk_student FOREIGN KEY (enroll_student_id) REFERENCES student(student_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT enroll_crn_fk_section FOREIGN KEY (enroll_crn) REFERENCES section(section_crn)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE student_lab_session_progress (
	progress_student_id VARCHAR(10) NOT NULL,
	progress_lab_crn VARCHAR(10) NOT NULL,
	progress_lab_date date NOT NULL,
	progress_attendance VARCHAR(10),
	progress_prepared BOOLEAN,
	progress_submitted BOOLEAN NOT NULL,
	progress_submission_time timestamp,
	progress_submission_link VARCHAR(255),
	progress_resubmitted BOOLEAN NOT NULL,
	progress_resubmission_time timestamp,
	progress_resubmission_link VARCHAR(255),
	progress_self_assessment_score INT,
	progress_instructor_score INT,
	CONSTRAINT progress_student_id_lab_crn_date_pk PRIMARY KEY (progress_student_id, progress_lab_crn, progress_lab_date),
	CONSTRAINT progress_student_id_fk_student FOREIGN KEY (progress_student_id) REFERENCES student(student_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT progress_crn_datetime_fk_lsession FOREIGN KEY (progress_lab_crn, progress_lab_date) 
		REFERENCES lab_session(lsession_crn, lsession_date) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT progress_must_submit_before_resubmit_1 CHECK (NOT (progress_resubmitted AND NOT progress_submitted)),
	CONSTRAINT progress_must_submit_before_resubmit_2 CHECK (
		progress_resubmission_time IS NULL OR (progress_resubmission_time > progress_submission_time)
	)
);

CREATE TABLE change_log (
	change_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
	change_at timestamp NOT NULL,
	change_by VARCHAR(50) NOT NULL,
	change_field progress_field NOT NULL,
	change_old_value VARCHAR(255) NOT NULL,
	change_new_value VARCHAR(255) NOT NULL,
	change_student_id VARCHAR(10) NOT NULL,
	change_lab_crn VARCHAR(10) NOT NULL,
	change_lab_date date NOT NULL,
	CONSTRAINT change_id_pk PRIMARY KEY (change_id),
	CONSTRAINT change_student_id_lab_crn_date_fk_progress FOREIGN KEY(change_student_id, change_lab_crn, change_lab_date)
		REFERENCES student_lab_session_progress(progress_student_id, progress_lab_crn, progress_lab_date)
		ON UPDATE CASCADE ON DELETE CASCADE
);
