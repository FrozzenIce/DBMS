CREATE DATABASE college;

USE college;
CREATE TABLE students(
    s_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    address VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

INSERT INTO students (
    f_name,
    l_name, 
    address, 
    email)
VALUES (
    "Pranjal",
    "Sherstha",
    "Gothatar",
    "pranjal@gmail.com"
    );

INSERT INTO students (
    f_name,
    l_name, 
    address, 
    email)
VALUES (
    "Shishir",
    "Nepal",
    "Bhaktapur",
    "shishir@gmail.com"
    );

INSERT INTO students (
    f_name,
    l_name, 
    address, 
    email)
VALUES (
    "Samip",
    "Joshi",
    "Lalitpur",
    "samip@gmail.com"
    );


SELECT * FROM students;