SET search_path TO lab_tracker_group_24;

-- Term 
INSERT INTO term(term_year, 
				 term_season, 
				 term_start_date, 
				 term_end_date)
VALUES
(2025, 'Winter', '2025-01-06', '2025-04-11'),
(2025, 'Spring/Summer', '2025-04-28', '2025-08-08'),
(2025, 'Fall', '2025-09-02', '2025-12-12'),
(2026, 'Winter', '2026-01-05', '2026-04-10'),
(2026, 'Spring/Summer', '2026-04-27', '2026-08-07');

-- Set 
INSERT INTO set (set_letter,
				 set_term) 
VALUES
('A', '202530'),
('B', '202530'),
('C', '202530'),
('D', '202530'),
('E', '202530'),
('F', '202530');

-- Course 
INSERT INTO course (course_code, 
					course_title, 
					course_credits) 
VALUES
('COMP2714', 'Relational Database Systems', 3),
('COMP1510', 'Programming Methods', 4),
('COMP1537', 'Web Development 1', 3),
('COMP2510', 'Procedural Programming', 4),
('COMP2522', 'Object Oriented Programming 1', 4);

-- Instructor (to prevent null column in Section)
INSERT INTO instructor(instructor_fname, 
					   instructor_lname)
VALUES
('Maryam', 'Khezrzadeh'),
('Bruce', 'Link'),
('Aaron', 'Ferguson'),
('Hesam', 'Alizadeh'),
('Jason', 'Wilder');


-- Section
INSERT INTO section (section_crn, 
                     section_term, 
                     section_type, 
                     section_datetime, 
                     section_duration, 
                     section_location, 
                     section_course_code, 
                     section_instructor_id)
VALUES
('L01', '202530', 'Lab', '2025-09-08 09:30', interval '1 hour 50 minutes', 'BBY-SW01-3460', 'COMP2714', 1),
('L02', '202530', 'Lab', '2025-09-08 13:30', interval '1 hour 50 minutes', 'BBY-SW01-3465', 'COMP2714', 1),
('L03', '202530', 'Lab', '2025-09-09 18:30', interval '1 hour 50 minutes', 'BBY-SW03-2605', 'COMP2714', 1),
('L04', '202530', 'Lab', '2025-09-10 09:30', interval '1 hour 50 minutes', 'BBY-SE12-101', 'COMP2714', 1),
('L05', '202530', 'Lab', '2025-09-10 13:30', interval '1 hour 50 minutes', 'DTC-310', 'COMP2714', 1),
('L06', '202530', 'Lab', '2025-09-11 18:30', interval '1 hour 50 minutes', 'DTC-318', 'COMP2714', 1),
('L07', '202530', 'Lab', '2025-09-12 08:30', interval '1 hour 50 minutes', 'BBY-SW05-1850', 'COMP1510', 2),
('L08', '202530', 'Lab', '2025-09-12 12:30', interval '1 hour 50 minutes', 'BBY-NE01-404', 'COMP1537', 3),
('L09', '202610', 'Lab', '2026-01-12 10:30', interval '1 hour 50 minutes', 'BBY-SE12-302', 'COMP2510', 4),
('L10', '202610', 'Lab', '2026-01-13 14:30', interval '1 hour 50 minutes', 'BBY-SW03-4725', 'COMP2522', 5);

-- Lab section 
INSERT INTO lab_section (lsection_crn, 
						 lsection_set_id) 
VALUES 
('L01', 1), 
('L02', 2), 
('L03', 3), 
('L04', 4), 
('L05', 5), 
('L06', 6),
('L07', 1), 
('L08', 2), 
('L09', 3), 
('L10', 4);

-- Session
INSERT INTO session (session_crn, 
					 session_date) 
VALUES
('L01', '2025-09-08'),
('L01', '2025-09-15'),
('L01', '2025-09-22'),
('L02', '2025-09-08'),
('L02', '2025-09-15'),
('L02', '2025-09-22'),
('L03', '2025-09-09'),
('L03', '2025-09-16'),
('L03', '2025-09-23'),
('L04', '2025-09-10'),
('L04', '2025-09-17'),
('L04', '2025-09-24'),
('L05', '2025-09-10'),
('L05', '2025-09-17'),
('L05', '2025-09-24'),
('L06', '2025-09-11'),
('L06', '2025-09-18'),
('L06', '2025-09-25'),
('L07', '2025-09-12'), 
('L07', '2025-09-19'), 
('L07', '2025-09-26'),
('L08', '2025-09-12'), 
('L08', '2025-09-19'), 
('L08', '2025-09-26'),
('L09', '2026-01-12'), 
('L09', '2026-01-19'), 
('L09', '2026-01-26'),
('L10', '2026-01-13'),
('L10', '2026-01-20'), 
('L10', '2026-01-27');


-- Lab session
INSERT INTO lab_session (lsession_crn, 
						lsession_date, 
						lsession_lab_num, 
						lsession_assignment_title, 
						lsession_duedate) 
VALUES 
('L01', '2025-09-08', 1, 'Lab 1', '2025-09-14 23:59:00'),
('L01', '2025-09-15', 2, 'Lab 2', '2025-09-21 23:59:00'),
('L01', '2025-09-22', 3, 'Lab 3', '2025-09-28 23:59:00'),
('L02', '2025-09-08', 1, 'Lab 1', '2025-09-14 23:59:00'),
('L02', '2025-09-15', 2, 'Lab 2', '2025-09-21 23:59:00'),
('L02', '2025-09-22', 3, 'Lab 3', '2025-09-28 23:59:00'),
('L03', '2025-09-09', 1, 'Lab 1', '2025-09-14 23:59:00'),
('L03', '2025-09-16', 2, 'Lab 2', '2025-09-21 23:59:00'),
('L03', '2025-09-23', 3, 'Lab 3', '2025-09-28 23:59:00'),
('L04', '2025-09-10', 1, 'Lab 1', '2025-09-14 23:59:00'),
('L04', '2025-09-17', 2, 'Lab 2', '2025-09-21 23:59:00'),
('L04', '2025-09-24', 3, 'Lab 3', '2025-09-28 23:59:00'),
('L05', '2025-09-10', 1, 'Lab 1', '2025-09-15 09:00:00'),
('L05', '2025-09-17', 2, 'Lab 2', '2025-09-22 09:00:00'),
('L05', '2025-09-24', 3, 'Lab 3', '2025-09-29 09:00:00'),
('L06', '2025-09-11', 1, 'Lab 1', '2025-09-15 09:00:00'),
('L06', '2025-09-18', 2, 'Lab 2', '2025-09-22 09:00:00'),
('L06', '2025-09-25', 3, 'Lab 3', '2025-09-29 09:00:00'),
('L07', '2025-09-12', 1, 'Lab 1', '2025-09-18 23:59:00'),
('L07', '2025-09-19', 2, 'Lab 2', '2025-09-25 23:59:00'),
('L08', '2025-09-12', 1, 'Lab 1', '2025-09-18 23:59:00'),
('L08', '2025-09-19', 2, 'Lab 2', '2025-09-25 23:59:00'),
('L09', '2026-01-12', 1, 'Lab 1', '2026-01-18 23:59:00'),
('L09', '2026-01-19', 2, 'Lab 2', '2026-01-25 23:59:00'),
('L10', '2026-01-13', 1, 'Lab 1', '2026-01-19 23:59:00'),
('L10', '2026-01-20', 2, 'Lab 2', '2026-01-26 23:59:00');

-- Lab assignment (Update the assignment_title column)
UPDATE lab_session
SET lsession_assignment_title = 'Environment Setup & Intro SQL'
WHERE lsession_lab_num = 1 AND 
	  lsession_crn IN ('L01', 'L02', 'L03', 'L04', 'L05', 'L06');

UPDATE lab_session
SET lsession_assignment_title = 'Conceptual → Logical Mapping'
WHERE lsession_lab_num = 2 AND 
	  lsession_crn IN ('L01', 'L02', 'L03', 'L04', 'L05', 'L06');

UPDATE lab_session
SET lsession_assignment_title = 'Logical ERD & Constraints'
WHERE lsession_lab_num = 3 AND 
	  lsession_crn IN ('L01', 'L02', 'L03', 'L04', 'L05', 'L06');

-- Student
INSERT INTO student(student_id,
					student_fname,
					student_lname,
					student_email,
					student_set_id)
VALUES
('A001', 'Ava', 'Nguyen', 'ava.nguyen@my.bcit.ca',1),
('A002', 'Noah', 'Kim', 'noah.kim@my.bcit.ca', 1),
('A003', 'Oliver', 'Singh', 'oliver.singh@my.bcit.ca',1),
('B001', 'Maya', 'Fischer', 'maya.fischer@my.bcit.ca', 2),
('B002', 'Leo', 'Park', 'leo.park@my.bcit.ca', 2),
('B003', 'Zoé', 'Martin', 'zoe.martin@my.bcit.ca', 2),
('C001', 'Sofia', 'Chen', 'sofia.chen@my.bcit.ca', 3),
('C002', 'Arjun', 'Patel', 'arjun.patel@my.bcit.ca', 3),
('C003', 'Liam', 'O’Reilly', 'liam.oreilly@my.bcit.ca', 3),
('D001', 'Layla', 'Haddad', 'layla.haddad@my.bcit.ca', 4),
('D002', 'Ethan', 'Wong', 'ethan.wong@my.bcit.ca', 4),
('D003', 'Nora', 'Iverson', 'nora.iverson@my.bcit.ca', 4),
('E001', 'Diego', 'Alvarez', 'diego.alvarez@my.bcit.ca', 5),
('E002', 'Hana', 'Yamamoto', 'hana.yamamoto@my.bcit.ca', 5),
('E003', 'Farah', 'Rahimi', 'farah.rahimi@my.bcit.ca', 5),
('F001', 'Lucas', 'García', 'lucas.garcia@my.bcit.ca', 6),
('F002', 'Mila', 'Ivanov', 'mila.ivanov@my.bcit.ca', 6),
('F003', 'Zain', 'Abbas', 'zain.abbas@my.bcit.ca', 6);

-- Set enroll 
INSERT INTO set_enroll(senroll_set_id, 
					   senroll_crn)
VALUES
(1, 'L01'),
(2, 'L02'),
(3, 'L03'),
(4, 'L04'),
(5, 'L05'),
(6, 'L06'),
(1, 'L07'),
(2, 'L08'),
(3, 'L09'),
(4, 'L10');

-- Student lab session progresss
INSERT INTO student_lab_session_progress(
			progress_student_id,
			progress_lab_crn,
			progress_lab_date,
			progress_attendance,
			progress_prepared,
			progress_submitted,
			progress_submission_time,
			progress_submission_link,
			progress_resubmitted,
			progress_resubmission_time,
			progress_resubmission_link,
			progress_is_late,
			progress_self_assessment_score,
			progress_instructor_score)
			
VALUES
('A001', 'L01', '2025-09-08', 'Present', TRUE, TRUE, '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A001-L01-L01.pdf',
 TRUE,'2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A001-L01-L01.pdf', FALSE, 8.2, 8.5),
('A001', 'L01', '2025-09-15', 'Present', TRUE, TRUE, '2025-09-15 10:35', 'https://submit.bcit.ca/comp2714/inlab/A001-L01-L02.pdf', 
TRUE, '2025-09-17 11:35', 'https://submit.bcit.ca/comp2714/polished/A001-L01-L02.pdf', FALSE, 6.7, 7.0),
('A002', 'L01', '2025-09-08', 'Present', TRUE, TRUE, '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A002-L01-L01.pdf', 
TRUE, '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A002-L01-L01.pdf', FALSE, 8.2, 8.5),
('A002', 'L01', '2025-09-15', 'Present', TRUE, TRUE, '2025-09-15 10:40', 'https://submit.bcit.ca/comp2714/inlab/A002-L01-L02.pdf', 
FALSE, NULL, NULL, FALSE, NULL, NULL),
('A003', 'L01', '2025-09-08', 'Present', TRUE, TRUE, '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A003-L01-L01.pdf', 
TRUE, '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A003-L01-L01.pdf', FALSE, 8.2, 8.5),
('A003', 'L01', '2025-09-15', 'Present', FALSE, TRUE, '2025-09-15 10:35', 'https://submit.bcit.ca/comp2714/inlab/A003-L01-L02.pdf', 
TRUE, '2025-09-17 11:35', 'https://submit.bcit.ca/comp2714/polished/A003-L01-L02.pdf', FALSE, 6.7, 7.0),
('B001', 'L02', '2025-09-08', 'Present', TRUE, TRUE, '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B001-L02-L01.pdf', 
TRUE, '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B001-L02-L01.pdf', FALSE, 8.2, 8.5),
('B001', 'L02', '2025-09-15', 'Present', TRUE, TRUE, '2025-09-15 14:35', 'https://submit.bcit.ca/comp2714/inlab/B001-L02-L02.pdf', 
TRUE, '2025-09-17 15:35', 'https://submit.bcit.ca/comp2714/polished/B001-L02-L02.pdf', FALSE, 6.7, 7.0),
('B002', 'L02', '2025-09-08', 'Present', TRUE, TRUE, '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B002-L02-L01.pdf', 
TRUE, '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B002-L02-L01.pdf', FALSE, 8.2, 8.5),
('B002', 'L02', '2025-09-15', 'Present', TRUE, TRUE, '2025-09-15 14:40', 'https://submit.bcit.ca/comp2714/inlab/B002-L02-L02.pdf', 
FALSE, NULL, NULL, FALSE, NULL, NULL),
('B003', 'L02', '2025-09-08', 'Present', TRUE, TRUE, '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B003-L02-L01.pdf', 
TRUE, '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B003-L02-L01.pdf', FALSE, 8.2, 8.5),
('B003', 'L02', '2025-09-15', 'Present', FALSE, TRUE, '2025-09-15 14:35', 'https://submit.bcit.ca/comp2714/inlab/B003-L02-L02.pdf', 
TRUE, '2025-09-17 15:35', 'https://submit.bcit.ca/comp2714/polished/B003-L02-L02.pdf', FALSE, 6.7, 7.0),
('C001', 'L03', '2025-09-09', 'Present', TRUE, TRUE, '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C001-L03-L01.pdf', 
TRUE, '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C001-L03-L01.pdf', FALSE, 8.2, 8.5),
('C001', 'L03', '2025-09-16', 'Present', TRUE, TRUE, '2025-09-16 19:35', 'https://submit.bcit.ca/comp2714/inlab/C001-L03-L02.pdf', 
TRUE, '2025-09-18 20:35', 'https://submit.bcit.ca/comp2714/polished/C001-L03-L02.pdf', FALSE, 6.7, 7.0),
('C002', 'L03', '2025-09-09', 'Present', TRUE, TRUE, '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C002-L03-L01.pdf', 
TRUE, '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C002-L03-L01.pdf', FALSE, 8.2, 8.5),
('C002', 'L03', '2025-09-16', 'Present', TRUE, TRUE, '2025-09-16 19:40', 'https://submit.bcit.ca/comp2714/inlab/C002-L03-L02.pdf', 
FALSE, NULL, NULL, FALSE, NULL, NULL),
('C003', 'L03', '2025-09-09', 'Present', TRUE, TRUE, '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C003-L03-L01.pdf', 
TRUE, '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C003-L03-L01.pdf', FALSE, 8.2, 8.5),
('C003', 'L03', '2025-09-16', 'Present', FALSE, TRUE, '2025-09-16 19:35', 'https://submit.bcit.ca/comp2714/inlab/C003-L03-L02.pdf', 
TRUE, '2025-09-18 20:35', 'https://submit.bcit.ca/comp2714/polished/C003-L03-L02.pdf', FALSE, 6.7, 7.0),
('D001', 'L04', '2025-09-10', 'Present', TRUE, TRUE, '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D001-L04-L01.pdf', 
TRUE, '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D001-L04-L01.pdf', FALSE, 8.2, 8.5),
('D001', 'L04', '2025-09-17', 'Present', TRUE, TRUE, '2025-09-17 10:35', 'https://submit.bcit.ca/comp2714/inlab/D001-L04-L02.pdf', 
TRUE, '2025-09-19 11:35', 'https://submit.bcit.ca/comp2714/polished/D001-L04-L02.pdf', FALSE, 6.7, 7.0),
('D002', 'L04', '2025-09-10', 'Present', TRUE, TRUE, '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D002-L04-L01.pdf', 
TRUE, '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D002-L04-L01.pdf', FALSE, 8.2, 8.5),
('D002', 'L04', '2025-09-17', 'Present', TRUE, TRUE, '2025-09-17 10:40', 'https://submit.bcit.ca/comp2714/inlab/D002-L04-L02.pdf', 
FALSE, NULL, NULL, FALSE, NULL, NULL),
('D003', 'L04', '2025-09-10', 'Present', TRUE, TRUE, '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D003-L04-L01.pdf', 
TRUE, '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D003-L04-L01.pdf', FALSE, 8.2, 8.5),
('D003', 'L04', '2025-09-17', 'Present', FALSE, TRUE, '2025-09-17 10:35', 'https://submit.bcit.ca/comp2714/inlab/D003-L04-L02.pdf', 
TRUE, '2025-09-19 11:35', 'https://submit.bcit.ca/comp2714/polished/D003-L04-L02.pdf', FALSE, 6.7, 7.0),
('E001', 'L05', '2025-09-10', 'Present', TRUE, TRUE, '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E001-L05-L01.pdf', 
TRUE, '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E001-L05-L01.pdf', FALSE, 8.2, 8.5),
('E001', 'L05', '2025-09-17', 'Present', TRUE, TRUE, '2025-09-17 14:35', 'https://submit.bcit.ca/comp2714/inlab/E001-L05-L02.pdf', 
TRUE, '2025-09-19 15:35', 'https://submit.bcit.ca/comp2714/polished/E001-L05-L02.pdf', FALSE, 6.7, 7.0),
('E002', 'L05', '2025-09-10', 'Present', TRUE, TRUE, '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E002-L05-L01.pdf', 
TRUE, '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E002-L05-L01.pdf', FALSE, 8.2, 8.5),
('E002', 'L05', '2025-09-17', 'Present', TRUE, TRUE, '2025-09-17 14:40', 'https://submit.bcit.ca/comp2714/inlab/E002-L05-L02.pdf',
FALSE, NULL, NULL, FALSE, NULL, NULL),
('E003', 'L05', '2025-09-10', 'Present', TRUE, TRUE, '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E003-L05-L01.pdf', 
TRUE, '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E003-L05-L01.pdf', FALSE, 8.2, 8.5),
('E003', 'L05', '2025-09-17', 'Present', FALSE, TRUE, '2025-09-17 14:35', 'https://submit.bcit.ca/comp2714/inlab/E003-L05-L02.pdf', 
TRUE, '2025-09-19 15:35', 'https://submit.bcit.ca/comp2714/polished/E003-L05-L02.pdf', FALSE, 6.7, 7.0),
('F001', 'L06', '2025-09-11', 'Present', TRUE, TRUE, '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F001-L06-L01.pdf', 
TRUE, '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F001-L06-L01.pdf', FALSE, 8.2, 8.5),
('F001', 'L06', '2025-09-18', 'Present', TRUE, TRUE, '2025-09-18 19:35', 'https://submit.bcit.ca/comp2714/inlab/F001-L06-L02.pdf', 
TRUE, '2025-09-20 20:35', 'https://submit.bcit.ca/comp2714/polished/F001-L06-L02.pdf', FALSE, 6.7, 7.0),
('F002', 'L06', '2025-09-11', 'Present', TRUE, TRUE, '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F002-L06-L01.pdf', 
TRUE, '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F002-L06-L01.pdf', FALSE, 8.2, 8.5),
('F002', 'L06', '2025-09-18', 'Present', TRUE, TRUE, '2025-09-18 19:40', 'https://submit.bcit.ca/comp2714/inlab/F002-L06-L02.pdf', 
FALSE, NULL, NULL, FALSE, NULL, NULL),
('F003', 'L06', '2025-09-11', 'Present', TRUE, TRUE, '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F003-L06-L01.pdf', 
TRUE, '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F003-L06-L01.pdf', FALSE, 8.2, 8.5),
('F003', 'L06', '2025-09-18', 'Present', FALSE, TRUE, '2025-09-18 19:35', 'https://submit.bcit.ca/comp2714/inlab/F003-L06-L02.pdf', 
TRUE, '2025-09-20 20:35', 'https://submit.bcit.ca/comp2714/polished/F003-L06-L02.pdf', FALSE, 6.7, 7.0);

-- User
INSERT INTO user_t(user_id,
				   user_display_name,
				   user_role,
				   user_email)
VALUES
('u_instructor', 'Maryam Khezrzadeh', 'instructor', 'mkhezrzadeh@bcit.ca'),
('u_ta1', 'Daniel Saavedra', 'ta', 'dsaavedra@bcit.ca'),
('u_system', 'Lab Tracker System', 'system', 'noreply@labtracker.local');


-- Change Log
INSERT INTO change_log(change_at,
					   change_field,
					   change_old_value,
					   change_new_value,
					   change_reason,
					   change_user_id,
					   change_student_id,
					   change_lab_crn,
					   change_lab_date)
VALUES
('2025-09-09 12:10', 'instructor_score', '8.0', '8.5', 
'Regraded after resubmission', 'u_instructor', 'A001', 'L01', '2025-09-08'),
('2025-09-16 20:45', 'submitted', 'In Progress', 'Submitted', 
'Student submitted during lab; TA marked as submitted', 'u_ta1', 'A003', 'L01', '2025-09-15'),
('2025-09-23 23:59:00', 'late', 'False', 'True', 'Auto-flagged after set-specific due time', 
 'u_system', 'B003', 'L02', '2025-09-08');







