-- SEN307 Database Systems - Week 6 Practical
-- Student: NDAZIBARI CHARLES JOSHUA (VUG/SEN/24/12074)

USE sen307_12074;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Enrolment;
TRUNCATE TABLE CourseAllocation;
TRUNCATE TABLE Student;
TRUNCATE TABLE Lecturer;
TRUNCATE TABLE Course;
TRUNCATE TABLE Department;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Department (dept_name) VALUES 
('Software Engineering'), 
('Computer Science'), 
('Artificial Intelligence'), 
('Data Science'), 
('Cybersecurity'); 

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES 
('SEN307', 'Database Systems', 3, 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')), 
('SEN301', 'Software Architecture', 3, 'Architectural styles, design patterns, microservices and how to structure large software systems.', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')), 
('COS301', 'Operating Systems', 3, 'Processes, threads, CPU scheduling, memory management and file systems.', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')), 
('COS305', 'Computer Networks', 3, 'TCP/IP, routing, switching, LAN and WAN design and network protocols.', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')), 
('AIN301', 'Introduction to Artificial Intelligence', 3, 'Intelligent agents, search algorithms, knowledge representation and reasoning.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')), 
('AIN305', 'Machine Learning', 3, 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')), 
('AIN307', 'Natural Language Processing', 3, 'Text processing, word embeddings, language models, sentiment analysis and chatbots.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')), 
('DTS301', 'Data Visualization and Analytics', 2, 'Exploratory data analysis, charts, dashboards and telling stories with data.', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')), 
('DTS305', 'Big Data Technologies', 3, 'Distributed storage and processing of very large datasets with Hadoop and Spark.', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')), 
('CYB301', 'Network Security', 3, 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')); 

SELECT d.dept_name, COUNT(c.course_id) AS courses 
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id 
GROUP BY d.dept_name; 

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES 
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1), 
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Dr Chinedu Eze', 'c.eze@vua.edu.ng', 2),
('VUA/ST/104', 'Prof Fatima Abdullahi', 'f.abdullahi@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Oluwaseun Adeyemi', 'o.adeyemi@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Hauwa Ibrahim', 'h.ibrahim@vua.edu.ng', 3),
('VUA/ST/107', 'Dr Tunde Bakare', 't.bakare@vua.edu.ng', 4),
('VUA/ST/108', 'Dr Ngozi Nwosu', 'n.nwosu@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Yakubu Danjuma', 'y.danjuma@vua.edu.ng', 5),
('VUA/ST/110', 'Dr Blessing Udo', 'b.udo@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES 
('VUG/SEN/24/12074', 'NDAZIBARI CHARLES JOSHUA', 'F', '2007-08-15', 1),  
('20231235', 'John Musa', 'M', '2004-11-02', 2), 
('20231236', 'Zainab Suleiman', 'F', '2003-08-19', 3), 
('20231237', 'Chiamaka Okafor', 'F', '2006-01-25', 1), 
('20231238', 'Ibrahim Garba', 'M', '2005-07-11', 4), 
('20231239', 'Adebayo Ogunleye', 'M', '2004-04-30', 2), 
('20231240', 'Amina Yusuf', 'F', '2007-02-14', 1), 
('20231241', 'Emeka Nwachukwu', 'M', '2003-12-09', 3), 
('20231242', 'Funmilayo Balogun', 'F', '2005-09-22', 4), 
('20231243', 'Samuel Idoko', 'M', '2006-05-17', 5), 
('20231244', 'Halima Abubakar', 'F', '2004-10-03', 5), 
('20231245', 'Daniel Okonkwo', 'M', '2005-06-28', 1), 
('20231246', 'Kemi Adebisi', 'F', '2003-02-15', 3), 
('20231247', 'Usman Aliyu', 'M', '2006-11-20', 4), 
('20231248', 'Grace Etim', 'F', '2007-04-08', 4), 
('20231249', 'Victor Ojo', 'M', '2004-08-12', 4), 
('20231250', 'Maryam Sani', 'F', '2005-12-01', 1), 
('20231251', 'Peter Audu', 'M', '2003-07-24', 3), 
('20231252', 'Esther Yakubu', 'F', '2006-03-10', 2), 
('20231253', 'David Kalu', 'M', '2005-01-19', 5);

SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;

INSERT INTO Enrolment (student_id, course_id) VALUES 
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1),
(1, 2), (2, 2), (3, 2), (9, 2), (10, 2),
(4, 3), (5, 3), (6, 3), (11, 3), (12, 3),
(7, 4), (8, 4), (9, 4), (13, 4), (14, 4),
(10, 5), (11, 5), (12, 5), (15, 5),
(13, 6), (14, 6), (15, 6), (16, 6),
(16, 7), (17, 7), (18, 7),
(17, 8), (18, 8),
(1, 9), (2, 9),
(3, 10), (4, 10);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES 
(1, 1), (1, 2), 
(2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = 'VUG/SEN/24/12074';

SET SQL_SAFE_UPDATES = 0;
UPDATE Student SET dept_id = 2 WHERE matric_no = 'VUG/SEN/24/12074';
SET SQL_SAFE_UPDATES = 1;

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = 'VUG/SEN/24/12074';

-- PART 4: Referential Integrity
INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id) 
VALUES ('20239999', 'Transfer Student', 
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

-- DELETE FROM Department WHERE dept_name = 'Library and Information Science';

UPDATE Student 
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering') 
WHERE matric_no = '20239999'; 

DELETE FROM Department WHERE dept_name = 'Library and Information Science'; 

SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department 
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer 
UNION ALL SELECT 'Students', COUNT(*) FROM Student 
UNION ALL SELECT 'Courses', COUNT(*) FROM Course 
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment 
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;