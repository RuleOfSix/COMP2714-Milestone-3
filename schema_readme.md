# Modelling decisions
- There's no LAB_ASSIGNMENTS table; lab assignment information is stored in the lab session table
    - There's a 1:1 correspondence in any case so no information is lost by doing this
    - This is in line with how the model was made and described in previous milestones
- Wherever a day, start_time, and end_time is used, our schema tends to use a timestamp and duration to encode the same information
    - This is just to keep things closer to our previous model

# Primary key choices

- The COURSE, STUDENT, SECTION, and USER_T tables have single-attribute natural keys that are used as their primary keys
- The INSTRUCTOR, SET, TA, and CHANGE_LOG tables use automatically generated surrogate keys
    - INSTRUCTOR, TA, and CHANGE_LOG lack natural keys
    - SET has a natural key in the form (set_letter, set_term), but being composite makes it unwieldy, especially as SET is referenced frequently by other tables
- The TERM table uses term_code as its primary key, as it is a single-attribute natural key
    - term_code also encodes the semantic identity of the term, and is human-understandable
    - term_code is actually generated from term_year and term_season in order to prevent integrity errors where a term's key does not match the other data in its row
- The LAB_SECTION table represents a specialization of the SECTION table, and so it uses the same primary key as the SECTION table
    - Thus the foreign key and primary key constraints can together enforce a 1:1 relationship
- The SESSION table has a composite primary key with two components: a date, and a CRN which is a foreign key referencing SECTION
    - A session is uniquely identified by its date and the section it is a part of, so this forms a natural key
    - While this increases the overhead of referring to SESSION, it also gives other tables direct access to the session date if they do so
- The LAB_SESSION table is a specialization of the SESSION table, so it uses the same primary key as the SESSION table
    - In addition to the foreign key constraint linking LAB_SESSION to SESSION, there is a constraint on lsession_crn that it must be a valid foreign key referencing LAB_SECTION; this ensures the intended relationship that LAB_SESSIONs are related to LAB_SECTIONS in the same way that SESSIONS are related to SECTIONs without any unintended situations where a LAB_SESSION is related to a non-lab SECTION.
- The two enrollment tables (ENROLL AND SET_ENROLL) are pure associative entities, so they have compound primary keys made up of two foreign keys
    - The reason for including two enrollment tables is to model the common reality of entire sets being enrolled at a time into course sections, while individual students still occassionally need to be individually enrolled in courses. This design decision was made back in milestone 1, and though it now creates complications, we believe it was worth it (see note at the end about constraints).
- The STUDENT_LAB_SESSION_PROGRESS table uses a compound primary key with three parts:
    - progress_student_id, which semantically encodes the student whose lab progress this record is for
        - this is a foreign key referencing the student table
    - progress_lab_crn and progress_lab_date, which together semantically encode the lab this record is storing the progress for
        - they form a compound foreign key referencing the LAB_SESSION table
    - Since STUDENT_LAB_SESSION_PROGRESS is essentially an associative entity, this is a natural key to use

# Constraints and Referential Actions

- There are many constraints that check whether a certain value is within a valid range. In general, these constraints cast a WIDE net over what may be considered a 'reasonable' value for that attribute, so as to not accidentally make real-world outlying data invalid. 
- Similarly, UNIQUE constraints are only ever used where it should be impossible and/or invalid for a set of attribute values to repeat within a table. In particular, text fields like titles and names are not mandated to be unique even if they typically will be.
- TERM has two constraints that ensure that the start and end dates for a term must actually be within the year of that term
- SET has a UNIQUE constraint on (set_letter, set_term), because those attributes form a candidate key for the SET table
    - Set also mandates that SET_LETTER must be from A to F
    - While not a constraint, SET generates the campus from the set letter to ensure data integrity and reduce redundancy
- Student emails are required to be unique
- SECTION has a lot of constraints:
    - There are cascading updates and deletes on the FK reference to COURSE because it is reasonable to want to delete a course, but there should never be sections without courses to belong to
    - (section_term, section_datetime, section_instructor_id) must be UNIQUE because an instructor cannot be in two places at once
    - (section_term, section_datetime, section_location) must be UNIQUE because two sections cannot be in the same room at once
        - section_location is an optional field because of online courses, but since UNIQUE constraints consider NULLs to not be equal this does what we want (namely, it allows multiple online courses at the same time)
    - There are CHECK constraints ensuring that a section starts after school starts and does not last more than 8 hours
- LAB_SECTION has cascading deletes and updates in its FK reference to SECTION because it represents the same entity as SECTION does
    - The same is true of LAB_SESSION and SESSION
- SESSION has cascading deletes and updates in its FK reference to section because it is reasonable to want to delete a section but there should never be sessions that do not belong to any section
- LAB_SESSION has several constraints:
    - There are cascading deletes and updates in its reference to SESSION because it semantically represents the same entity as SESSION
    - the CRN and lab number have to be UNIQUE because (lsession_crn, lsession_lab_num) is a candidate key for LAB_SESSION
    - The due date for the lab assignment must be on or after the day of the lab itself
- The enrollment tables have cascading updating and deletes as you would expect for purely associative entities
    - EXCEPTION: there is no cascading delete behavior for the reference to SET in SET_ENROLL because it is not expected for deleting a set to be something that should ever need to happen; if it happens by mistake, we want that mistake to get caught. If someone does want to delete an entire set for some unexpected reason, it wouldn't be overly difficult to manually delete the associated records. This is true wherever SET is referenced.
- STUDENT_LAB_SESSION_PROGRESS has a few constraints: 
    - There's cascading update/delete behavior for both of the foreign keys that make up the primary key of this table
        - If a student is being wiped from the database, so should their lab progress
        - If a lab no longer exists in the database, we shouldn't be tracking progress for it
    - There are two constraints ensuring that a student can't resubmit a lab before they submit it for the first time
- USER_T has a UNIQUE constraint on user emails and a CHECK constraint ensuring the role is one of a specific list of roles
- There's cascading update and delete behavior for the reference from CHANGE_LOG to STUDENT_LAB_SESSION_PROGRESS
    - If we're not keeping track of a progress record there's no reason to track the changes made to it anymore

# Final Note on Constraints

Because of how our model was initially structures, there are a LOT of constraints that make sense from a business logic perspective that are not represented in the above list of constraints (for instance, no constraint enforces that only the SECTIONs with a section_type of 'Lab' have associated LAB_SECTION tables). This is because CHECK constraints are not meant to enforce cross-table constraints, and we have refrained from using TRIGGERs to enforce constraints so as to only use content being taught in the course. 

# References
PostgreSQL documentation pages on date\time types, date\time functions, constraints, generated attributes, and enum types:
- https://www.postgresql.org/docs/current/datatype-datetime.html
- https://www.postgresql.org/docs/current/functions-datetime.html
- https://www.postgresql.org/docs/current/ddl-constraints.html
- https://www.postgresql.org/docs/current/ddl-generated-columns.html
- https://www.postgresql.org/docs/current/datatype-enum.html
