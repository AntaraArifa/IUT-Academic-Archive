-- Task 01

CREATE SEQUENCE student_id_seq START WITH 1;
CREATE SEQUENCE biology_seq START WITH 1;
CREATE SEQUENCE comp_sci_seq START WITH 1;
CREATE SEQUENCE elec_eng_seq START WITH 1;
CREATE SEQUENCE finance_seq START WITH 1;
CREATE SEQUENCE history_seq START WITH 1;
CREATE SEQUENCE music_seq START WITH 1;
CREATE SEQUENCE physics_seq START WITH 1;

CREATE OR REPLACE FUNCTION generate_student_id(
    p_dept_name IN VARCHAR2
)
RETURN VARCHAR2
IS
    v_dept_code VARCHAR2(1);
    v_sequence_number NUMBER;
    v_student_id VARCHAR2(5);
BEGIN
    SELECT CASE p_dept_name
        WHEN 'Biology' THEN '1'
        WHEN 'Comp. Sci.' THEN '2'
        WHEN 'Elec. Eng.' THEN '3'
        WHEN 'Finance' THEN '4'
        WHEN 'History' THEN '5'
        WHEN 'Music' THEN '6'
        WHEN 'Physics' THEN '7'
        ELSE NULL
    END INTO v_dept_code
    FROM dual;

    IF v_dept_code IS NULL THEN
        RETURN NULL;
    END IF;

    CASE v_dept_code
        WHEN '1' THEN
            SELECT biology_seq.nextval INTO v_sequence_number FROM dual;
        WHEN '2' THEN
            SELECT comp_sci_seq.nextval INTO v_sequence_number FROM dual;
        WHEN '3' THEN
            SELECT elec_eng_seq.nextval INTO v_sequence_number FROM dual;
        WHEN '4' THEN
            SELECT finance_seq.nextval INTO v_sequence_number FROM dual;
        WHEN '5' THEN
            SELECT history_seq.nextval INTO v_sequence_number FROM dual;
        WHEN '6' THEN
            SELECT music_seq.nextval INTO v_sequence_number FROM dual;
        WHEN '7' THEN
            SELECT physics_seq.nextval INTO v_sequence_number FROM dual;
    END CASE;

    v_student_id := v_dept_code || LPAD(v_sequence_number, 4, '0');

    RETURN v_student_id;
END;
/
--TASK2

SET SERVEROUTPUT ON;

DECLARE
    CURSOR student_cursor IS
        SELECT ID, name, dept_name
        FROM student
        ORDER BY dept_name, name; 

    v_new_student_id NUMBER;

BEGIN

    FOR student_rec IN student_cursor 
    LOOP
        v_new_student_id := GenerateStudentID(student_rec.dept_name);

        UPDATE student
        SET ID = v_new_student_id
        WHERE ID = student_rec.ID;

        UPDATE takes
        SET ID = v_new_student_id
        WHERE ID = student_rec.ID;

        UPDATE advisor
        SET s_id = v_new_student_id
        WHERE s_id = student_rec.ID;


        
        DBMS_OUTPUT.PUT_LINE('Updated student ID for ' || student_rec.name || ' (' || student_rec.dept_name || ') to ' || v_new_student_id);
    END LOOP;
END;
/

-- Task 3

CREATE OR REPLACE TRIGGER generate_student_id_trigger
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    :NEW.ID := generate_student_id(:NEW.dept_name);
END;
/

--Task 4

CREATE OR REPLACE TRIGGER update_tot_cred_trigger
BEFORE INSERT ON takes
FOR EACH ROW
BEGIN
    UPDATE student
    SET tot_cred = tot_cred + (SELECT credits FROM course WHERE course_id = :NEW.course_id)
    WHERE ID = :NEW.ID;
END;
/

--Task 5