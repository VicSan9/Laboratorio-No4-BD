CREATE SEQUENCE IF NOT EXISTS  seq_student_id INCREMENT 168 START 7488;

CREATE TABLE IF NOT EXISTS student (
  student_id INTEGER DEFAULT nextval('seq_student_id'), 
  student_name VARCHAR (200),
  student_program VARCHAR (200),
  PRIMARY KEY (student_id)
);

CREATE TABLE IF NOT EXISTS instructor (
  instructor_id serial,
  instructor_name VARCHAR (200),
  dept VARCHAR (100),
  title VARCHAR (100),
  PRIMARY KEY (instructor_id)
);

CREATE SEQUENCE IF NOT EXISTS  seq_course_id INCREMENT 23 START 837827;

CREATE TABLE IF NOT EXISTS course (
  course_id INTEGER DEFAULT nextval('seq_course_id'),
  title VARCHAR (100),
  syllabus VARCHAR (100),
  credits INTEGER,
  PRIMARY KEY (course_id)
);

CREATE TABLE IF NOT EXISTS course_offering (
  course_id INTEGER,
  sec_id serial,
  co_year INTEGER,
  semester INTEGER,
  co_time VARCHAR (50),
  classroom VARCHAR (50),
  PRIMARY KEY (course_id, sec_id, co_year, semester),
  FOREIGN KEY (course_id) REFERENCES course (course_id)
);

CREATE table IF NOT EXISTS enrols (
  student_id INTEGER,
  course_id INTEGER,
  sec_id serial,
  semester VARCHAR (50),
  e_year INTEGER,
  grade NUMERIC(3,2), 
  CHECK (grade >= 1.00 AND grade <= 5.00),
  PRIMARY KEY (student_id, course_id, sec_id, semester, e_year),
  FOREIGN KEY (student_id) REFERENCES student (student_id)
);

CREATE TABLE IF NOT EXISTS teaches (
  course_id INTEGER,
  sec_id SERIAL,
  semester VARCHAR (50),
  t_year INTEGER,
  instructor_id INTEGER,
  PRIMARY KEY (course_id, sec_id, semester, t_year, instructor_id),
  FOREIGN KEY (course_id) REFERENCES course (course_id),
  FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id)
);

CREATE TABLE IF NOT EXISTS requires (
  main_course INTEGER,
  prerequisite INTEGER,
  PRIMARY KEY (main_course, prerequisite),
  FOREIGN KEY (main_course) REFERENCES course (course_id),
  FOREIGN KEY (prerequisite) REFERENCES course (course_id)
);