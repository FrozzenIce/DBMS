create database lab_workK;

use lab_workK;

-- Part 1: DB setup

-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credit_hour INT
);

-- Create Enrollment Table
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    course_id INT,
    student_id INT,
    FOREIGN KEY (course_id) REFERENCES courses (course_id),
    FOREIGN KEY (student_id) REFERENCES Students (student_id)
);

-- Insert Data into Students
INSERT INTO
    Students (
        student_id,
        name,
        age,
        email,
        phone_number
    )
VALUES (
        1,
        'Alice Smith',
        20,
        'alice@example.com',
        '555-0101'
    ),
    (
        2,
        'Bob Johnson',
        22,
        'bob@example.com',
        '555-0102'
    ),
    (
        3,
        'Charlie Brown',
        19,
        'charlie@example.com',
        '555-0103'
    ),
    (
        4,
        'Diana Prince',
        21,
        'diana@example.com',
        '555-0104'
    ),
    (
        5,
        'Evan Wright',
        23,
        'evan@example.com',
        '555-0105'
    );

-- Insert Data into Courses
INSERT INTO
    courses (course_id, name, credit_hour)
VALUES (
        101,
        'Introduction to Computer Science',
        3
    ),
    (102, 'Data Structures', 4),
    (
        103,
        'Database Management Systems',
        3
    ),
    (104, 'Web Development', 3),
    (
        105,
        'Artificial Intelligence',
        4
    );

-- Insert Data into Enrollment
INSERT INTO
    enrollment (
        enrollment_id,
        course_id,
        student_id
    )
VALUES (1001, 101, 1),
    (1002, 103, 1),
    (1003, 102, 2),
    (1004, 104, 2),
    (1005, 101, 3),
    (1006, 105, 4),
    (1007, 103, 5),
    (1008, 105, 5),
    (1009, 102, 1);

SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollment;

-- Part 2: SQL practice questions

-- Basic Selection and Filtering

-- 1 Retrieve all records and columns from the Students table
SELECT * FROM students;

-- 2 List only name and email of students
SELECT name, email FROM students;

-- 3 Find all students who are strictly older than 20 years
SELECT * FROM students WHERE age > 20;

-- 4 Retrieve the names of students whose name starts with letter 'A'
SELECT * FROM students WHERE name LIKE 'A%';

-- 5 Find all courses that have the word 'Science' anywhere in their name.
SELECT * FROM courses WHERE name LIKE '%Science%';

-- 6 List all students sorted by their age in descending order.
SELECT * FROM students ORDER BY age DESC;

-- 7 Retrieve the details of the student with the exact phone number '555-0103'.
SELECT * FROM students WHERE phone_number = '555-0103';

-- CRUD Operations

-- Part 1: ALTER (Modifying Table Structures)

-- 1 Add a Column: Write a query to add a new column named address (VARCHAR 255) to the Students table.
ALTER Table students ADD COLUMN address VARCHAR(255);

-- 2 Add a Column with Default: Add a new column called is_active (BOOLEAN) to the Students table and set its default value to TRUE (or 1).
ALTER Table students ADD COLUMN is_active BOOLEAN DEFAULT true;

-- 3 Modify a Column Data Type: The phone_number column in the Students table is currently VARCHAR(20). Write a query to increase its size to VARCHAR(50).
ALTER Table students MODIFY COLUMN phone_number VARCHAR(50);

-- 4 Rename a Column: Write a query to rename the column name in the courses table to course_name.
ALTER Table courses RENAME COLUMN name TO course_name;

-- 5 Rename a Column: Write a query to rename the column name in the courses table to course_name.
ALTER Table students DROP COLUMN age;

-- 6 Add a Constraint: Write a query to ensure that the credit_hour in the courses table can never be less than 1 (Add a CHECK constraint).
ALTER Table courses
ADD CONSTRAINT chk_credit_hour CHECK (credit_hour >= 1);

-- Part 2: UPDATE (Modifying Existing Data)

-- 7 Simple Update: Alice Smith (student_id = 1) got a new phone number. Write a query to update her phone_number to '555-9999'.
UPDATE students SET phone_number = '555-9999' WHERE student_id = 1;

-- Re-add age for qn 2
ALTER TABLE students ADD age INT;

UPDATE students SET age = 21 WHERE student_id = 1;

UPDATE students SET age = 18 WHERE student_id = 2;

UPDATE students SET age = 23 WHERE student_id = 3;

UPDATE students SET age = 19 WHERE student_id = 4;

UPDATE students SET age = 20 WHERE student_id = 5;

-- 8 Update Multiple Columns: Bob Johnson (student_id = 2) had a birthday and changed his email. Update his age to 23 and his email to 'bob.j@newemail.com' in a single query.
UPDATE students
SET
    age = 23,
    email = 'bob.j@newmail.com'
WHERE
    student_id = 2;

-- 9 Conditional Update (Math): The university decided to increase the credit hours for all 3-credit courses. Write a query to add 1 to the credit_hour of any course currently worth exactly 3 credits.
UPDATE courses
SET
    credit_hour = credit_hour + 1
WHERE
    credit_hour = 3;

-- 10 Bulk Update with String Function: Write a query to convert all student emails in the Students table to completely lowercase (using the LOWER() function).
UPDATE students SET email = LOWER(email);

-- 11 Update with a Subquery (Advanced): Write a query to update the credit_hour of 'Data Structures' to 5, but only look it up using the course's name, not its course_id.
UPDATE courses
SET
    credit_hour = 5
WHERE
    course_name = 'Data Structures';

-- Part 3: Delete (Removing Data)

-- 12 Simple Delete: Write a query to delete the student named 'Evan Wright' from the Students table. (Thought exercise: What error might you encounter if he is in the enrollment table, and how would you fix it?)
DELETE FROM enrollment as e
WHERE
    student_id = (
        SELECT student_id
        FROM students
        WHERE
            name = 'Evan Wright'
    );

DELETE FROM students WHERE name = 'Evan Wright'

-- 13 Delete with Condition: Write a query to delete any course from the courses table that has fewer than 3 credit_hours.
DELETE FROM courses WHERE credit_hour < 3;

-- 14 Delete Related Records (Handling Foreign Keys): Charlie Brown (student_id = 3) is dropping out of the university. Write the necessary queries to first remove his enrollments from the enrollment table, and then delete his record from the Students table.
DELETE FROM enrollment WHERE student_id = 3;

DELETE FROM students WHERE student_id = 3;

-- 15 Clear a Table: Write a query to delete all records from the enrollment table without deleting the table structure itself.
TRUNCATE Table students;

-- Aggregate Functions

-- 8 Count the total number of students currently in the database.
SELECT COUNT(*) FROM students;

-- 9 Calculate the average age of all students.
SELECT AVG(age) FROM students;

-- 10 Find the maximum credit hours offered by any single course.
SELECT MAX(credit_hour) FROM courses;

-- 11 Find the age of the youngest student in the database.
SELECT MIN(age) FROM students;

-- 12 Calculate the total sum of credit hours for all available courses combined.
SELECT SUM(credit_hour) FROM courses;

-- Grouping Data

-- 13 Count how many students are enrolled in each course. Display the course_id and the total count.
SELECT course_id, COUNT(student_id)
FROM enrollment
GROUP BY
    course_id;

-- 14 Find the total number of courses each student is enrolled in. Display the student_id and the enrollment count.
SELECT student_id, COUNT(course_id)
FROM enrollment
GROUP BY
    student_id;

-- 15 List the course_ids of courses that have more than 2 students enrolled (Use HAVING).
SELECT course_id
FROM enrollment
GROUP BY
    course_id
HAVING
    COUNT(student_id) > 2;

-- 16 Find the student_ids of students who are enrolled in exactly 2 courses.
SELECT student_id
FROM enrollment
GROUP BY
    student_id
HAVING
    COUNT(course_id) = 2;

-- Table Relations and Joins

-- 17 Write a query to display the name of each student alongside the course_ids they are enrolled in.
SELECT s.name, e.course_id
FROM students as s
    JOIN enrollment as e ON e.student_id = s.student_id;

-- 18 Retrieve the names of students and the names of the courses they are enrolled in
SELECT s.name, cs.course_name
FROM
    students AS s
    JOIN enrollment AS e ON s.student_id = e.student_id
    JOIN courses AS cs ON e.course_id = cs.course_id;

-- 19 List all courses and the number of students enrolled in each. Ensure courses with zero students are also included in the result
SELECT cs.course_id, cs.course_name, COUNT(e.student_id)
FROM courses as cs
    LEFT JOIN enrollment as e ON e.course_id = cs.course_id
GROUP BY
    cs.course_id;

-- 20 Find the names of all students who are actively taking 'Database Management Systems'.
SELECT s.name
FROM
    students as s
    JOIN enrollment as e ON e.student_id = s.student_id
    JOIN courses as cs ON cs.course_id = e.course_id
WHERE
    cs.course_name = 'Database Management Systems';

-- 21 Identify any students who are not enrolled in any course.
SELECT *
FROM students as s
    LEFT JOIN enrollment as e ON e.student_id = s.student_id
WHERE
    e.course_id IS NULL;

-- 22 Calculate the total credit hours each student is currently taking. Display the student's name and their total credit hours.
SELECT s.name, s.student_id, SUM(cs.credit_hour) AS total_credit_hour
FROM
    students as s
    LEFT JOIN enrollment as e ON e.student_id = s.student_id
    LEFT JOIN courses as cs ON e.course_id = cs.course_id
GROUP BY
    s.student_id;

-- Subqueries and Advanced Logic

-- 23 Find the names of students who are enrolled in the course with the highest credit hours