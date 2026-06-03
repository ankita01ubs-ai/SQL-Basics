Use Functions;

SELECT * FROM student_performance;

-- Question 1 : Create a ranking of students based on score (highest first)
SELECT
    student_id,
    name,
    score,
    RANK() OVER (ORDER BY score DESC) AS rank_position
FROM student_performance;

-- Question 2 : Show each student's score and the previous student’s score (based on score order).
SELECT
    student_id,
    name,
    score,
    LAG(score) OVER (ORDER BY score DESC) AS previous_score
FROM student_performance;

-- Question 3 : Convert all student names to uppercase and extract the month name from join_date.
SELECT
    UPPER(name) AS name_uppercase,
    MONTHNAME(join_date) AS join_month
FROM student_performance;

-- Question 4 : Show each student's name and the next student’s attendance (ordered by attendance).
SELECT
   name,
    attendance,
    LEAD(attendance) OVER (ORDER BY attendance DESC) AS next_student_attendance
FROM student_performance;

-- Question 5 : Assign students into 4 performance groups using NTILE().
SELECT
   name,
    score,
    NTILE(4) OVER (ORDER BY score DESC) AS performance_group
FROM student_performance;


-- Question 6 : For each course, assign a row number based on attendance (highest first).
SELECT name, attendance, course,
ROW_NUMBER() OVER(PARTITION BY course
ORDER BY attendance DESC) AS course_rank
FROM student_performance;

-- Question 7 : Calculate the number of days each student has been enrolled (from join_date to today).
SELECT
    name,
    join_date,
    DATEDIFF('2025-01-01', join_date) AS days_enrolled
FROM student_performance;

-- Question 8 : Format join_date as “Month Year” (e.g., “June 2023”).
SELECT
   name,
    join_date,
    DATE_FORMAT(join_date, '%M %Y') AS formatted_join_date
FROM student_performance;

-- Question 9 : Replace the city ‘Mumbai’ with ‘MUM’ for display purposes.
SELECT
   name, city,
    REPLACE(city, 'Mumbai', 'MUM') AS clean_city
FROM student_performance;

-- Question 10 : For each course, find the highest score using FIRST_VALUE().
SELECT
   name,
    course,
    score,
    FIRST_VALUE(score) OVER (
        PARTITION BY course
        ORDER BY score DESC
    ) AS highest_score_in_course
FROM student_performance;