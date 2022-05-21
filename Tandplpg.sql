--Punto a1
CREATE OR REPLACE FUNCTION error_insert_enrol()
	RETURNS TRIGGER AS $error_insert_enrol$
 	DECLARE  
 	BEGIN 
    	if new.grade < 0.00 or new.grade > 5.00 THEN
    	RAISE EXCEPTION 'La nota debe estar entre 0.00 y 5.00';
        END if;
    RETURN new;
    END   
$error_insert_enrol$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_error_insert_enrol
BEFORE INSERT on enrols
FOR EACH ROW
EXECUTE PROCEDURE error_insert_enrol();

--Punto a2
CREATE OR REPLACE FUNCTION notice_update_enrol()
	RETURNS TRIGGER AS $notice_update_enrol$
 	DECLARE  
 	BEGIN        
        if new.grade = OLD.grade THEN
        RAISE NOTICE 'La nota no ha sido midificada';
		end if;
        if new.grade <> OLD.grade THEN
        RAISE NOTICE 'La nota se ha modificada';
        END if;
    RETURN new;
    END 
$notice_update_enrol$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_notice_update_enrol
AFTER UPDATE on enrols
FOR EACH ROW
EXECUTE PROCEDURE notice_update_enrol();

--Punto b
CREATE OR REPLACE FUNCTION procedure_add_teaches (INTEGER, INTEGER) 
	RETURNS void as $procedure_add_teaches$
 	DECLARE  
    	instructorid ALIAS FOR $1;
	 	courseid ALIAS FOR $2;
		semester INTEGER = (SELECT semester from course_offering WHERE course_id = courseid);
        year_ INTEGER = (SELECT co_year FROM course_offering WHERE course_id = courseid);
    BEGIN 
    	INSERT into teaches (course_id, semester, t_year, instructor_id)
        VALUES (courseid, semester, year_, instructorid);
    END 
$procedure_add_teaches$ LANGUAGE plpgsql;