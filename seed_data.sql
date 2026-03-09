--Term
INSERT INTO lab_tracker_group_24.term (term_year, 
                                       term_season, 
                                       term_start_date, 
                                       term_end_date)
VALUES
(2025, 'Winter', '2025-01-06', '2025-04-11'),
(2025, 'Spring/Summer', '2025-04-28', '2025-08-08'),
(2025, 'Fall', '2025-09-02', '2025-12-12');

-- Set
INSERT INTO lab_tracker_group_24.set (set_letter, 
                                      set_term)
VALUES
('A','202530'),
('B','202530'),
('C','202530'),
('D','202530'),
('E','202530'),
('F','202530');

--Course
INSERT INTO lab_tracker_group_24.course (course_code, 
                                         course_title, 
                                         course_credits)
VALUES
('COMP2714', 'Relational Database Systems', 3);

--Instructor
INSERT INTO lab_tracker_group_24.instructor (instructor_fname, 
                                             instructor_lname)
VALUES
('Maryam', 'Khezrzadeh');

-- Section 
INSERT INTO lab_tracker_group_24.section (section_crn, 
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
('L06', '202530', 'Lab', '2025-09-11 18:30', interval '1 hour 50 minutes', 'DTC-318', 'COMP2714', 1);

--TA
INSERT INTO lab_tracker_group_24.ta (ta_crn, 
                                     fname, 
                                     lname)
VALUES
('L01', 'Daniel', 'Saavedra'),
('L02', 'Daniel', 'Saavedra'),
('L03', 'Daniel', 'Saavedra'),
('L04', 'Daniel', 'Saavedra'),
('L05', 'Daniel', 'Saavedra'),
('L06', 'Daniel', 'Saavedra');

-- Lab section
INSERT INTO lab_tracker_group_24.lab_section (lsection_crn, 
                                              lsection_set_id)
VALUES
('L01',1),
('L02',2),
('L03',3),
('L04',4),
('L05',5),
('L06',6);

-- Session
INSERT INTO lab_tracker_group_24.session (session_crn, 
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
('L06', '2025-09-25');

--lab session (split up by each session)

-- L01 Lab Sessions
INSERT INTO lab_session (lsession_crn, 
                         lsession_date, 
                         lsession_lab_num, 
                         lsession_assignment_title, 
                         lsession_duedate)
VALUES ('L01', '2025-09-08', 1, 'Environment Setup & Intro SQL', '2025-09-14 23:59');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L01', '2025-09-15', 2, 'Conceptual to Logical Mapping', '2025-09-21 23:59');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L01', '2025-09-22', 3, 'Logical ERD & Constraints', '2025-09-28 23:59');

-- L02 Lab Sessions
INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L02', '2025-09-08', 1, 'Environment Setup & Intro SQL', '2025-09-14 23:59');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L02', '2025-09-15', 2, 'Conceptual to Logical Mapping', '2025-09-21 23:59');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L02', '2025-09-22', 3, 'Logical ERD & Constraints', '2025-09-28 23:59');

-- L03 Lab Sessions
INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L03', '2025-09-09', 1, 'Environment Setup & Intro SQL', '2025-09-14 23:59');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L03', '2025-09-16', 2, 'Conceptual to Logical Mapping', '2025-09-21 23:59');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L03', '2025-09-23', 3, 'Logical ERD & Constraints', '2025-09-28 23:59');

-- L04 Lab Sessions
INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L04', '2025-09-10', 1, 'Environment Setup & Intro SQL', '2025-09-14 23:59');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L04', '2025-09-17', 2, 'Conceptual to Logical Mapping', '2025-09-21 23:59');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L04', '2025-09-24', 3, 'Logical ERD & Constraints', '2025-09-28 23:59');

-- L05 Lab Sessions
INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L05', '2025-09-10', 1, 'Environment Setup & Intro SQL', '2025-09-15 09:00');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L05', '2025-09-17', 2, 'Conceptual to Logical Mapping', '2025-09-22 09:00');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L05', '2025-09-24', 3, 'Logical ERD & Constraints', '2025-09-29 09:00');

-- L06 Lab Sessions
INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L06', '2025-09-11', 1, 'Environment Setup & Intro SQL', '2025-09-15 09:00');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L06', '2025-09-18', 2, 'Conceptual to Logical Mapping', '2025-09-22 09:00');

INSERT INTO lab_session (lsession_crn, lsession_date, lsession_lab_num, lsession_assignment_title, lsession_duedate)
VALUES ('L06', '2025-09-25', 3, 'Logical ERD & Constraints', '2025-09-29 09:00');

-- Users
INSERT INTO user_t (user_id, 
                    user_display_name,
                    user_role, 
                    user_email)
VALUES
('u_instructor','Maryam Khezrzadeh','instructor','mkhezrzadeh@bcit.ca'),
('u_ta1','Daniel Saavedra','ta','dsaavedra@bcit.ca'),
('u_system','Lab Tracker System','system','noreply@labtracker.local');

--Students
INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('A001','Ava','Nguyen','ava.nguyen@my.bcit.ca',1);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('A002','Noah','Kim','noah.kim@my.bcit.ca',1);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('A003','Oliver','Singh','oliver.singh@my.bcit.ca',1);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('B001','Maya','Fischer','maya.fischer@my.bcit.ca',2);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('B002','Leo','Park','leo.park@my.bcit.ca',2);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('B003','Zoé','Martin','zoe.martin@my.bcit.ca',2);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('C001','Sofia','Chen','sofia.chen@my.bcit.ca',3);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('C002','Arjun','Patel','arjun.patel@my.bcit.ca',3);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('C003','Liam','O''Reilly','liam.oreilly@my.bcit.ca',3);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('D001','Layla','Haddad','layla.haddad@my.bcit.ca',4);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('D002','Ethan','Wong','ethan.wong@my.bcit.ca',4);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('D003','Nora','Iverson','nora.iverson@my.bcit.ca',4);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('E001','Diego','Alvarez','diego.alvarez@my.bcit.ca',5);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('E002','Hana','Yamamoto','hana.yamamoto@my.bcit.ca',5);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('E003','Farah','Rahimi','farah.rahimi@my.bcit.ca',5);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('F001','Marco','Russo','marco.russo@my.bcit.ca',6);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('F002','Amir','Kazemi','amir.kazemi@my.bcit.ca',6);

INSERT INTO student (student_id, student_fname, student_lname, student_email, student_set_id)
VALUES ('F003','Chloe','Dubois','chloe.dubois@my.bcit.ca',6);

--Enroll students
INSERT INTO lab_tracker_group_24.enroll (enroll_student_id,
                                         enroll_crn)
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('A001','L01');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('A002','L01');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('A003','L01');

INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('B001','L02');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('B002','L02');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('B003','L02');

INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('D001','L04');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('D002','L04');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('D003','L04');

INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('E001','L05');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('E002','L05');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('E003','L05');

INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('E001','L05');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('E002','L05');
INSERT INTO enroll (enroll_student_id, enroll_crn) VALUES ('E003','L05');

-- Progress
INSERT INTO lab_tracker_group_24.student_lab_session_progress (
                                                                progress_student_id, progress_lab_crn, progress_lab_date,
                                                                progress_attendance, progress_prepared, progress_submitted,
                                                                progress_submission_time, progress_submission_link,
                                                                progress_resubmitted, progress_resubmission_time,
                                                                progress_resubmission_link, progress_self_assessment_score,
                                                                progress_instructor_score
) VALUES
('A001','L01','2025-09-08','Present', TRUE, TRUE,'2025-09-08 10:45','https://submit.bcit.ca/comp2714/inlab/A001-L01-L01.pdf',
 FALSE,NULL,NULL,8,8),
('A002','L01','2025-09-08','Present', TRUE, TRUE,'2025-09-08 10:50','https://submit.bcit.ca/comp2714/inlab/A002-L01-L01.pdf',
 FALSE,NULL,NULL,7,7),
('A003','L01','2025-09-08','Present', FALSE, TRUE,'2025-09-08 11:00','https://submit.bcit.ca/comp2714/inlab/A003-L01-L01.pdf',
 FALSE,NULL,NULL,9,8),
('B001','L02','2025-09-08','Present', TRUE, TRUE,'2025-09-08 14:45','https://submit.bcit.ca/comp2714/inlab/B001-L02-L01.pdf',
 FALSE,NULL,NULL,8,8),
('B002','L02','2025-09-08','Present', TRUE, FALSE,'2025-09-08 14:50','https://submit.bcit.ca/comp2714/inlab/B002-L02-L01.pdf',
 FALSE,NULL,NULL,0,0),
('C001','L03','2025-09-09','Present', TRUE, TRUE,'2025-09-09 19:45','https://submit.bcit.ca/comp2714/inlab/C001-L03-L01.pdf',
 FALSE,NULL,NULL,9,9),
('C002','L03','2025-09-09','Present', TRUE, FALSE,'2025-09-09 19:50','https://submit.bcit.ca/comp2714/inlab/C002-L03-L01.pdf',
 FALSE,NULL,NULL,0,0);

-- Progress changelog

INSERT INTO lab_tracker_group_24.change_log (
                                             change_at, change_field, change_old_value, change_new_value,
                                             change_reason, change_user_id, change_student_id, change_lab_crn, change_lab_date
) VALUES
('2025-09-08 12:00','submitted','FALSE','TRUE','Student submitted inlab','u_ta1','B002','L02','2025-09-08'),
('2025-09-09 13:00','prepared','FALSE','TRUE','Student updated prepared status','u_instructor','A003','L01','2025-09-08'),
('2025-09-09 14:00','attendance','Absent','Present','Marked present after TA observation','u_ta1','C002','L03','2025-09-09'),
('2025-09-10 10:00','self_assessment_score','0','7','Student added self-assessment','u_instructor','B002','L02','2025-09-08'),
('2025-09-10 10:30','instructor_score','0','8','Instructor graded submission','u_instructor','B002','L02','2025-09-08');