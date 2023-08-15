CREATE DATABASE students;
-- \c students
CREATE TABLE students();
CREATE TABLE majors();
CREATE TABLE courses();
CREATE TABLE majors_courses();

ALTER TABLE students ADD COLUMN student_id SERIAL PRIMARY KEY;
-- students.csv has 4 columns separated by a comma. add these 4 columns in students table
ALTER TABLE students ADD COLUMN first_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN last_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN major_id INT;--we'll make it as a foreign key later on
ALTER TABLE students ADD COLUMN gpa NUMERIC(2,1);
-- NUMERIC(2,1) is because it's a one to right of decimal. and length of two on its left

ALTER TABLE majors ADD COLUMN major_id SERIAL PRIMARY KEY;
ALTER TABLE majors ADD COLUMN major VARCHAR(50) NOT NULL;
-- check it \d majors

ALTER TABLE students ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);-- made it as foreign
-- check \d students. do this with each major creation. debugging is awesome

ALTER TABLE courses ADD COLUMN course_id SERIAL PRIMARY KEY;
ALTER TABLE courses ADD COLUMN course VARCHAR(100) NOT NULL;

-- majors_courses is a junction table -> foreign with two primaries
ALTER TABLE majors_courses ADD COLUMN major_id INT;
-- you shouldn't use prior one. but the course required it😒
ALTER TABLE majors_courses ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
ALTER TABLE majors_courses ADD COLUMN course_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(course_id) REFERENCES courses(course_id);
-- create a composite primary key for setting both major and course ids as primary/unique
ALTER TABLE majors_courses ADD PRIMARY KEY(major_id, course_id);

-- get the first major in courses.csv
INSERT INTO majors(major) VALUES ('Database Administration');--only name is required. serial does rest
INSERT INTO courses(course) VALUES ('Data Structures and Algorithms');

INSERT INTO majors_courses(major_id, course_id) VALUES(1,1);
INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('Rhea', 'Kellems', 1, 2.5);
