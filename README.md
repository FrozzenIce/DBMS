# DBMS

---

## Lab 1: Basic Table and Database Setup
In this lab, I created a basic database named `college` and a `students` table. I added columns for student details (ID, name, address, email) and inserted a few records to test it.

* **File:** [Lab 1.sql](./Lab1.sql)

### Table Structure
* `s_id`: Integer, primary key, auto-increment.
* `f_name`: First name (text).
* `l_name`: Last name (text).
* `address`: Address (text).
* `email`: Unique email.

### Output Screenshot
![Lab 1 Output](./screenshots/lab1.png)

---

## Lab 2 & 3 & 4: Advanced SQL Queries and Joins
This lab was about setting up a relational database with three connected tables (Students, Courses, and Enrollment) and writing queries to manipulate and join the data.

* **File:** [Lab 2 & 3 & 4.sql](./Lab_2-3-4.sql)

### Database Relationships
* A student can enroll in multiple courses.
* An enrollment table connects students (`student_id`) to courses (`course_id`) using foreign keys.

---

## Query Output Screenshots

### Part 1: Schema Setup Verification

#### Students Table (Initial Select)
![Students Table](./screenshots/lab_2-3-4/setup_students.png)

#### Courses Table (Initial Select)
![Courses Table](./screenshots/lab_2-3-4/setup_courses.png)

#### Enrollment Table (Initial Select)
![Enrollment Table](./screenshots/lab_2-3-4/setup_enrollment.png)

---

### Part 2: Basic Selection and Filtering

#### Question 1: Retrieve all records and columns from the Students table
![Question 1 Output](./screenshots/lab_2-3-4/q1.png)

#### Question 2: List only the name and email of all students
![Question 2 Output](./screenshots/lab_2-3-4/q2.png)

#### Question 3: Find all students who are strictly older than 20 years
![Question 3 Output](./screenshots/lab_2-3-4/q3.png)

#### Question 4: Retrieve the names of students whose name starts with the letter 'A'
![Question 4 Output](./screenshots/lab_2-3-4/q4.png)

#### Question 5: Find all courses that have the word 'Science' anywhere in their name
![Question 5 Output](./screenshots/lab_2-3-4/q5.png)

#### Question 6: List all students sorted by their age in descending order
![Question 6 Output](./screenshots/lab_2-3-4/q6.png)

#### Question 7: Retrieve the details of the student with the exact phone number '555-0103'
![Question 7 Output](./screenshots/lab_2-3-4/q7.png)

---

### Part 3: CRUD Operations — ALTER (Modifying Table Structures)

#### Question 1: Add a Column (address VARCHAR(255)) to the Students table
#### Question 2: Add a Column with Default (is_active BOOLEAN DEFAULT TRUE) to the Students table
#### Question 3: Modify a Column Data Type (phone_number to VARCHAR(50))
![ALTER Q1, Q2, Q3 Output](./screenshots/lab_2-3-4/alter_q1-q2-q3.png)

#### Question 4: Rename a Column (name in courses table to course_name)
![ALTER Q4 Output](./screenshots/lab_2-3-4/alter_q4.png)

#### Question 5: Drop a Column (remove the age column from the Students table)
![ALTER Q5 Output](./screenshots/lab_2-3-4/alter_q5.png)

#### Question 6: Add a Constraint (ensure credit_hour in courses is never less than 1)
![ALTER Q6 Output](./screenshots/lab_2-3-4/alter_q6.png)

---

### Part 4: CRUD Operations — UPDATE (Modifying Existing Data)

#### Question 7: Simple Update (Update Alice Smith's phone_number to '555-9999')
![UPDATE Q7 Output](./screenshots/lab_2-3-4/update_q7.png)

#### Question 8: Update Multiple Columns (Update Bob Johnson's age to 23 and email to 'bob.j@newmail.com')
![UPDATE Q8 Output](./screenshots/lab_2-3-4/update_q8.png)

#### Question 9: Conditional Update (Add 1 to credit_hour of any course with exactly 3 credits)
![UPDATE Q9 Output](./screenshots/lab_2-3-4/update_q9.png)

#### Question 10: Bulk Update with String Function (Convert all student emails to completely lowercase)
![UPDATE Q10 Output](./screenshots/lab_2-3-4/update_q10.png)

#### Question 11: Update with a Subquery (Update credit_hour of 'Data Structures' to 5 by looking up its name)
![UPDATE Q11 Output](./screenshots/lab_2-3-4/update_q11.png)

---

### Part 5: CRUD Operations — DELETE (Removing Data)

#### Question 12: Simple Delete (Delete student named 'Evan Wright')
![DELETE Q12 Output](./screenshots/lab_2-3-4/delete_q12.png)

#### Question 13: Delete with Condition (Delete any course with fewer than 3 credit_hours)
![DELETE Q13 Output](./screenshots/lab_2-3-4/delete_q13.png)

#### Question 14: Delete Related Records (Remove Charlie Brown's enrollments then delete his student record)
![DELETE Q14 Output](./screenshots/lab_2-3-4/delete_q14.png)

#### Question 15: Clear a Table (Delete all records from the enrollment table)
![DELETE Q15 Output](./screenshots/lab_2-3-4/delete_q15.png)

---

### Part 6: Aggregate Functions

#### Question 8: Count the total number of students currently in the database
![AGGREGATE Q8 Output](./screenshots/lab_2-3-4/aggregate_q8.png)

#### Question 9: Calculate the average age of all students
![AGGREGATE Q9 Output](./screenshots/lab_2-3-4/aggregate_q9.png)

#### Question 10: Find the maximum credit hours offered by any single course
![AGGREGATE Q10 Output](./screenshots/lab_2-3-4/aggregate_q10.png)

#### Question 11: Find the age of the youngest student in the database
![AGGREGATE Q11 Output](./screenshots/lab_2-3-4/aggregate_q11.png)

#### Question 12: Calculate the total sum of credit hours for all available courses combined
![AGGREGATE Q12 Output](./screenshots/lab_2-3-4/aggregate_q12.png)

---

### Part 7: Grouping Data

#### Question 13: Count how many students are enrolled in each course
![GROUPING Q13 Output](./screenshots/lab_2-3-4/grouping_q13.png)

#### Question 14: Find the total number of courses each student is enrolled in
![GROUPING Q14 Output](./screenshots/lab_2-3-4/grouping_q14.png)

#### Question 15: List the course_ids of courses that have more than 2 students enrolled (HAVING)
![GROUPING Q15 Output](./screenshots/lab_2-3-4/grouping_q15.png)

#### Question 16: Find the student_ids of students who are enrolled in exactly 2 courses
![GROUPING Q16 Output](./screenshots/lab_2-3-4/grouping_q16.png)

---

### Part 8: Table Relations and Joins

#### Question 17: Display the name of each student alongside the course_ids they are enrolled in
![JOINS Q17 Output](./screenshots/lab_2-3-4/joins_q17.png)

#### Question 18: Retrieve the names of students and the names of the courses they are enrolled in
![JOINS Q18 Output](./screenshots/lab_2-3-4/joins_q18.png)

#### Question 19: List all courses and the number of students enrolled (including courses with zero students)
![JOINS Q19 Output](./screenshots/lab_2-3-4/joins_q19.png)

#### Question 20: Find the names of all students who are actively taking 'Database Management Systems'
![JOINS Q20 Output](./screenshots/lab_2-3-4/joins_q20.png)

#### Question 21: Identify any students who are not enrolled in any course
![JOINS Q21 Output](./screenshots/lab_2-3-4/joins_q21.png)

#### Question 22: Calculate the total credit hours each student is currently taking
![JOINS Q22 Output](./screenshots/lab_2-3-4/joins_q22.png)

---

### Part 9: Subqueries and Advanced Logic

#### Question 23: Find the names of students enrolled in the course with the highest credit hours
![SUBQUERY Q23 Output](./screenshots/lab_2-3-4/subquery_q23.png)

#### Question 24: List courses with enrollment counts higher than the average enrollment count across all courses
![SUBQUERY Q24 Output](./screenshots/lab_2-3-4/subquery_q24.png)

#### Question 25: Find the names of students whose age is strictly greater than the average age
![SUBQUERY Q25 Output](./screenshots/lab_2-3-4/subquery_q25.png)

---

### Part 10: Stored Procedures and DML

#### Question 26: Stored Procedure GetStudentCourses execution
![SP Q26 Output](./screenshots/lab_2-3-4/sp_q26.png)

#### Question 27: Stored Procedure EnrollStudent execution
![SP Q27 Output](./screenshots/lab_2-3-4/sp_q27.png)

#### Question 28: UPDATE statement to increase the credit hours of 'Web Development' by 1
![DML Q28 Output](./screenshots/lab_2-3-4/dml_q28.png)

---

## Lab 5: User creation & drop & permission grant & revoke
This lab was about user creation, user drop, granting and revoking database access permissions.

* **File:** [Lab 5.sql](./Lab5.sql)

![Lab 5 - Show users (after user creation)](/screenshots/lab_5-6/Lab-5.png)

![Lab 5 - Show user grants (after granting some permissions)](/screenshots/lab_5-6/Lab-5(1).png)

![Lab 5 - Show user grants (after revoke)](/screenshots/lab_5-6/Lab-5(2).png)

![Lab 5 - Show users (after drop)](/screenshots/lab_5-6/Lab-5(3).png)

---

## Lab 6: Role creation & drop & permission grant & revoke
This lab was about role creation, role drop, role set to users, granting and revoking database access permissions to roles.

* **File:** [Lab 6.sql](./Lab6.sql)

![Lab 6 - Show roles (after role creation)](/screenshots/lab_5-6/Lab-6%20(3).png)

![Lab 6 - Show role's grants (after granting some permissons to role)](/screenshots/lab_5-6/Lab-6%20(2).png)

![Lab 6 - Show roles assigned (after roles assingment to user)](/screenshots/lab_5-6/Lab-6%20(5).png)

![Lab 6 - Show role's grants (after revoking UPDATE permissons to role)](/screenshots/lab_5-6/Lab-6%20(1).png)

