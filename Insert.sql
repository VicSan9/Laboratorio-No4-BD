INSERT INTO student (student_name, student_program)
VALUES
  ('Serena Whitfield', 'Tecnologia en Sistemas'),
  ('Jonas Ewing', 'Ingenieria Industrial'),
  ('Isadora Sweeney', 'Contaduía Pública'),
  ('Tatum Fulton', 'Administración de Empresas'),
  ('Gannon Puckett', 'Tecnologia en Sistemas');
  
INSERT INTO instructor (instructor_name, dept, title)
VALUES
  ('Dante Dudley', 'Ingenieria', 'Ingeniero en Sistemas'),
  ('Chase Farrell', 'Ingenieria', 'Ingeniero Industrial'),
  ('Leslie Jimenez', 'Contaduría', 'Contador Público'),
  ('Elliott Boyd', 'Administración', 'Administrador de Empresas'),
  ('Chloe Roy', 'Ingenieria', 'Ingeniero Electronico');
  
INSERT into course (title, syllabus, credits)
values 
  ('Programación Orientada a Objetos','Tecnologia en Sistemas' , 4),
  ('Calculo III','Ingeniería Industrial' , 4),
  ('Estadistica','Contaduría Pública' , 5),
  ('Matematemática Básica','Administración de Empresas' , 4),
  ('Bases de datos I','Tecnologia en Sistemas' ,3),
  ('Introducción Universitaria', 'Todos los Programas', 0);
       
INSERT into course_offering (course_id, co_year, semester, co_time, classroom)
VALUES
  (837827, 2019, 1, '7:00 A.M - 10:00 A.M', '110'),
  (837850, 2022, 4, '1:00 P.M - 3:00 P.M', '203'),
  (837873, 2020, 2, '7:00 A.M - 9:00 A.M', '309'),
  (837896, 2000, 3, '6:00 P.M - 10:00 P.M', '101'),
  (837919, 2007, 4, '8:00 A.M - 12:00 P.M', '213');

INSERT INTO enrols (student_id, course_id, semester, e_year, grade)
VALUES 
  (7488, 837827, 2, 2003, 4.55),
  (7656, 837850, 4, 2014, 2.40),
  (7824, 837873, 1, 2017, 3.04),
  (7992, 837896, 6, 2022, 1.25),
  (8160, 837919, 5, 2012, 2.68);
  
INSERT into teaches (course_id, semester, t_year, instructor_id)
VALUES
  (837827, 2, 2015, 1),
  (837850, 4, 2006, 2),
  (837873, 3, 2016, 3),
  (837896, 6, 2011, 4),
  (837919, 1, 2022, 5);
  
INSERT into requires
VALUES
  (837827, 837942),
  (837896, 837942),
  (837873, 837942),
  (837850, 837942),
  (837919, 837827);