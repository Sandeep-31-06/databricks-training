-- SQL Joins Assignment Starter File
-- Compatible with PostgreSQL

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS instructors;

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor_id INT NULL,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert instructors
INSERT INTO instructors VALUES
(1, 'Sarah Connor', 'Databases'),
(2, 'Michael Scott', 'Programming'),
(3, 'Tony Stark', 'Cloud Computing'),
(4, 'Bruce Wayne', 'Cyber Security');

-- Insert students
INSERT INTO students VALUES
(1, 'Alice Johnson', 'alice@email.com'),
(2, 'Bob Smith', 'bob@email.com'),
(3, 'Charlie Brown', 'charlie@email.com'),
(4, 'Diana Prince', 'diana@email.com'),
(5, 'Ethan Hunt', 'ethan@email.com'),
(6, 'Fiona Green', 'fiona@email.com');

-- Insert courses
INSERT INTO courses VALUES
(101, 'SQL Basics', 1),
(102, 'Python Fundamentals', 2),
(103, 'Data Analytics', NULL),
(104, 'Cloud Computing', 3),
(105, 'Machine Learning', NULL),
(106, 'Cyber Security', 4);

-- Insert enrollments
INSERT INTO enrollments VALUES
(1, 1, 101, '2024-01-10'),
(2, 1, 102, '2024-01-12'),
(3, 2, 101, '2024-01-15'),
(4, 3, 104, '2024-01-20'),
(5, 4, 106, '2024-01-25');

-- Notes:
-- Student 5 and 6 are not enrolled in any course.
-- Courses 103 and 105 have no instructor assigned.
-- Courses 103 and 105 also have no enrollments.
-- Instructor 4 teaches one course.

Assignments Questions:

-- 1. Display all students and the courses they are enrolled in.Include students who are not enrolled in any course.

SELECT s.student_name, c.course_name FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id;

-- 2. Find all courses that currently have no students enrolled.

SELECT c.course_id, c.course_name FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- 3. Display all instructors and the courses they teach,including instructors who are not assigned to any course.

SELECT i.instructor_name, c.course_name FROM instructors i
LEFT JOIN courses c
ON i.instructor_id = c.instructor_id;

-- 4. Find all courses that do not have an instructor assigned.

SELECT * FROM courses
WHERE instructor_id IS NULL;

-- 5. Display all students and enrollment information using a RIGHT JOIN.

SELECT s.student_name, e.enrollment_id, e.course_id, e.enrollment_date FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;

-- 6. Find students who are not enrolled in any course.

SELECT s.student_id, s.student_name FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 7. Use a FULL OUTER JOIN to display all students and enrollments, including unmatched rows from both tables.

SELECT s.student_name, e.enrollment_id, e.course_id, e.enrollment_date FROM students s
FULL OUTER JOIN enrollments e
ON s.student_id = e.student_id;

-- 8. Find all courses that have never appeared in the enrollments table.

SELECT c.course_id, c.course_name FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

-- 9. Display all instructors and courses using a FULL OUTER JOIN and identify unmatched rows.

SELECT i.instructor_name, c.course_name FROM instructors i
FULL OUTER JOIN courses c
ON i.instructor_id = c.instructor_id;

-- 10. Create a report showing:student name, course name, and instructor name.Include rows even if course or instructor information is missing.

SELECT s.student_name,c.course_name,i.instructor_name FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id
LEFT JOIN instructors i
ON c.instructor_id = i.instructor_id;

-- List every student and every course,even if there is no enrollment relationship between them.

SELECT s.student_name, c.course_name
FROM students s
CROSS JOIN courses c;
