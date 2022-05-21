--Primera consulta
SELECT dept, title 
FROM instructor;

--Segunda consulta
SELECT student_name, student_program
FROM student
WHERE student_id = 7656;

--Tercera consulta
SELECT c.student_name
FROM student as C
JOIN enrols as m 
On c.student_id = m.student_id
WHERE m.course_id = 837873;

--Vista
CREATE VIEW better_students as 
SELECT c.student_name, c.student_program, Max (m.grade) AS max_grade, M.semester, M.e_year
FROM student as C
JOIN enrols as M
on c.student_id = M.student_id
WHERE m.e_year >= 1900 and m.e_year <= 2018
GROUP BY c.student_name, c.student_program, M.semester, m.e_year;

SELECT * FROM better_students;

