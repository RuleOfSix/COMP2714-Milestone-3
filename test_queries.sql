SET search_path TO lab_tracker_group_24;


-- Checks students enrolled in each lab section 
SELECT s.student_fname, s.student_lname, sec.lsection_crn
FROM student s
JOIN lab_section sec ON s.student_set_id = sec.lsection_set_id; 

-- Counts students enrolled in each lab section
SELECT sec.lsection_crn AS lab_section, COUNT(*) AS num_students
FROM student s 
JOIN lab_section sec ON s.student_set_id = sec.lsection_set_id
GROUP BY sec.lsection_crn
ORDER BY sec.lsection_crn; 

-- Counts students per lab section, including empty section
SELECT sec.lsection_crn AS lab_section, COUNT(s.student_id) AS num_students
FROM lab_section sec
LEFT JOIN student s ON s.student_set_id = sec.lsection_set_id
GROUP BY sec.lsection_crn
ORDER BY sec.lsection_crn;

-- Checks lab sessions and topics for a specific section
SELECT lsession_crn, lsession_date, lsession_assignment_title
FROM lab_session
WHERE lsession_crn = 'L01';

-- Checks attendance
SELECT progress_student_id, progress_lab_crn, progress_lab_date, progress_attendance
FROM student_lab_session_progress;

-- Checks the highest score per lab
SELECT progress_lab_crn, MAX(progress_instructor_score) AS highest_score
FROM student_lab_session_progress
GROUP BY progress_lab_crn;

-- Sanitary Checks
-- course_credits CHECK (course_credits > -1 AND course_credits < 20)
-- ERROR:  new row for relation "course" violates check constraint "course_credits_in_range"
-- Failing row contains (COMP9999, Invalid Course, 25).
INSERT INTO course(course_code, course_title, course_credits)
VALUES('COMP9999', 'Invalid Course', 25);