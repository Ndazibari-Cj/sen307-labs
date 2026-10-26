NAME: NDAZIBARI CHARLES JOSHUA.
MATRIC NO: VUG/SEN/24/12074.
COURSE CODE: VUA-SEN307 DATABASE SYSTEMS.

This lab designs a database for a university course-registration system. It covers Students, Courses, Lecturers, Departments and Enrolments. The work has two parts:

Normalizing an unnormalized registration sheet step by step, from 1NF to 2NF to 3NF.
Modelling the final 3NF schema as an EER diagram in MySQL Workbench.

Normalization summary

1NF: Split multi-valued cells so each student–course pair has its own row, with the composite key (matric_no, course_code).
2NF: Removed partial dependencies by moving student and course details into their own tables.
3NF: Removed transitive dependencies by moving department details into a Department table linked by a foreign key.

