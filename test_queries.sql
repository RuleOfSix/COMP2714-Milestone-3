--Checks students enrolled in each lab section
SELECT s.student_fname, s.student_lname, e.enroll_crn
FROM lab_tracker_group_24.student s
JOIN lab_tracker_group_24.enroll e
ON s.student_id = e.enroll_student_id;

--Checks lab sessions and topics for a specific section
SELECT lsession_crn, lsession_date, lsession_assignment_title
FROM lab_tracker_group_24.lab_session
WHERE lsession_crn = 'L01';

--Checks Attendance
SELECT progress_student_id, progress_lab_crn, progress_attendance
FROM lab_tracker_group_24.student_lab_session_progress;

--Checks which students submitted their lab work and when
SELECT progress_student_id, progress_submission_time
FROM lab_tracker_group_24.student_lab_session_progress
WHERE progress_submitted = TRUE;

--Counts how many students in each lab section
SELECT enroll_crn,
       COUNT(*) AS student_count
FROM lab_tracker_group_24.enroll
GROUP BY enroll_crn;

--Checks the highest score per lab
SELECT progress_lab_crn,
       MAX(progress_instructor_score) AS highest_score
FROM lab_tracker_group_24.student_lab_session_progress
GROUP BY progress_lab_crn;