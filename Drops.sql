--Borrar vista better_students
drop VIEW better_students;

--Borrar trigger 1
DROP TRIGGER trigger_error_insert_enrol on enrols;
DROP FUNCTION error_insert_enrol;

--Borrar trigger 2
DROP TRIGGER trigger_notice_update_enrol on enrols;
DROP FUNCTION notice_update_enrol;

--Borrar Función
drop FUNCTION procedure_add_teaches;

--Borrar todas las tablas
DROP TABLE course, course_offering, enrols, instructor, requires, student, teaches;

--Borrar todas las secuencias
DROP SEQUENCE seq_student_id, seq_course_id;


