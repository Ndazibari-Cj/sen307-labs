-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins 
-- Name: NDAZIBARI CHARLES JOSHUA 
-- Matric: VUG/SEN/24/12074 


USE sen307_12074;

-- Task 1: Students in one department, sorted A-Z
-- Explanation: We connect Student to Department using their matching ID (dept_id), 
-- filter down to just Software Engineering students, and use ORDER BY to sort 
-- their names alphabetically from A to Z.
SELECT s.matric_no, s.full_name, d.dept_name 
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

-- Task 2: Courses with their lecturers (INNER JOIN)
-- Explanation: Courses and lecturers don't connect directly, so we chain INNER JOINs 
-- through the CourseAllocation bridge table. Courses with two lecturers naturally show up twice.
SELECT c.course_code, c.course_title, l.full_name AS lecturer_name, d.dept_name 
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
INNER JOIN Department d ON c.dept_id = d.dept_id
ORDER BY c.course_code ASC;

-- Task 3: Students and their courses (LEFT JOIN)
-- Explanation: Using a LEFT JOIN starting from the Student table ensures that every 
-- single student is listed, even those with zero courses (who will just show NULL).
SELECT s.matric_no, s.full_name, c.course_title 
FROM Student s 
LEFT JOIN Enrolment e ON s.student_id = e.student_id 
LEFT JOIN Course c ON e.course_id = c.course_id 
ORDER BY s.full_name;

-- Task 3b: Showing only students with no courses (Zero enrolments)
SELECT s.matric_no, s.full_name, c.course_title 
FROM Student s 
LEFT JOIN Enrolment e ON s.student_id = e.student_id 
LEFT JOIN Course c ON e.course_id = c.course_id 
WHERE c.course_title IS NULL
ORDER BY s.full_name;

-- Task 4: Filtering with AND / OR / IN / BETWEEN
-- Explanation: We combine multiple rules using parentheses: filtering for female students 
-- in Software Engineering or Computer Science who were born between 2004 and 2005.
SELECT matric_no, full_name, gender, date_of_birth, dept_id 
FROM Student 
WHERE gender = 'F' 
  AND dept_id IN (1, 2) 
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY date_of_birth ASC;

-- Task 5: Paginating enrolments with LIMIT and OFFSET
-- Explanation: We split the data into chunks of 10. ORDER BY is mandatory with LIMIT/OFFSET 
-- so the database always returns the rows in a consistent, predictable order.

-- Page 1 (Rows 1–10):
SELECT enrolment_id, student_id, course_id 
FROM Enrolment 
ORDER BY enrolment_id 
LIMIT 10 OFFSET 0;

-- Page 2 (Rows 11–20):
SELECT enrolment_id, student_id, course_id 
FROM Enrolment 
ORDER BY enrolment_id 
LIMIT 10 OFFSET 10;

-- Challenge (Optional): Task 3 rewritten using RIGHT JOIN
-- Explanation: This gives the exact same result by flipping the table order. 
-- However, standard LEFT JOINs are much easier to read because our brains naturally 
-- like starting with the main subject (Student) and looking outward to their courses.
SELECT s.matric_no, s.full_name, c.course_title 
FROM Enrolment e
RIGHT JOIN Student s ON e.student_id = s.student_id
LEFT JOIN Course c ON e.course_id = c.course_id 
ORDER BY s.full_name;