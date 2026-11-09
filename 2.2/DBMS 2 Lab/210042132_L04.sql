--Task 01-a

SET SERVEROUTPUT ON
DECLARE
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Antara');
END;
/

--Task 01-b
DECLARE
    student_id varchar2(10);
    id_length  number;
BEGIN
    student_id := &Enter_Student_ID;
    id_length := length(student_id);

    DBMS_OUTPUT.PUT_LINE('The length of the student ID is: ' || id_length);
END;
/

--Task 02-a

DECLARE
   v_iid instructor.ID%TYPE;
   v_credits number; 
   v_salary number;
BEGIN
   FOR rec IN (SELECT ID FROM instructor)
   LOOP
      v_iid := rec.ID;

      SELECT SUM(credits) INTO v_credits
      FROM course
      WHERE dept_name = (SELECT dept_name FROM instructor WHERE ID = v_iid);

      v_salary := 9000 * v_credits;

      BEGIN
         UPDATE instructor
         SET salary = v_salary
         WHERE ID = v_iid
         RETURNING salary INTO v_salary;

         DBMS_OUTPUT.PUT_LINE('Instructor ' || v_iid || ' salary updated to ' || v_salary);
      EXCEPTION
         WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Instructor ' || v_iid || ' salary update failed. Check constraint violated.');
      END;
   END LOOP;
END;
/


--Task 02-b

DECLARE 
    CURSOR c1 IS
        SELECT c.title, s.name
        FROM course c
        JOIN prereq p ON c.course_id = p.course_id
        JOIN takes t ON p.prereq_id = t.course_id
        JOIN student s ON t.ID = s.ID;

BEGIN
    FOR rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('Course Title: ' || rec.title || ', Student Name: ' || rec.name);
    END LOOP;
END;
/

--Task 02-c

DECLARE 
    student_name student.name%TYPE := &student_name;
    CURSOR c1 IS
        SELECT ts.day, ts.start_hr || ':' || ts.start_min as start_time, 
               ts.end_hr || ':' || ts.end_min as end_time, 
               s.course_id, c.title, s.building, s.room_number
        FROM student st
        JOIN takes t ON st.ID = t.ID
        JOIN section s ON t.course_id = s.course_id AND t.sec_id = s.sec_id
        JOIN time_slot ts ON s.time_slot_id = ts.time_slot_id
        JOIN course c ON s.course_id = c.course_id
        WHERE st.name = student_name
        ORDER BY 
            CASE ts.day
                WHEN 'Monday' THEN 1
                WHEN 'Tuesday' THEN 2
                WHEN 'Wednesday' THEN 3
                WHEN 'Thursday' THEN 4
                WHEN 'Friday' THEN 5
                WHEN 'Saturday' THEN 6
                WHEN 'Sunday' THEN 7
            END,
            ts.start_hr,
            ts.start_min;

BEGIN
    FOR rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('<' || rec.day || '>');
        DBMS_OUTPUT.PUT_LINE('<' || rec.start_time || ' - ' || rec.end_time || '>');
        DBMS_OUTPUT.PUT_LINE('<' || rec.course_id || ' - ' || rec.title || '>');
        DBMS_OUTPUT.PUT_LINE('<' || rec.building || ' - ' || rec.room_number || '>');
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;
/

--Task 02-d

DECLARE
    CURSOR c1 IS
        SELECT i.ID, i.name, i.dept_name
        FROM instructor i
        LEFT JOIN advisor a ON i.ID = a.i_ID
        WHERE a.i_ID IS NULL;

    student_id student.ID%TYPE;
BEGIN
    FOR rec IN c1 LOOP
        SELECT ID INTO student_id
        FROM (
            SELECT ID
            FROM student
            WHERE dept_name = rec.dept_name AND ID NOT IN (SELECT s_ID FROM advisor)
            ORDER BY tot_cred ASC
        ) WHERE ROWNUM = 1;

        IF student_id IS NOT NULL THEN
            INSERT INTO advisor (s_ID, i_ID) VALUES (student_id, rec.ID);
        ELSE
            DBMS_OUTPUT.PUT_LINE('No students assigned to: ' || rec.name);
        END IF;
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No students available for assignment.');
END;
/

--Task 02-e

DECLARE 
    dept_name department.dept_name%TYPE;
    min_id instructor.ID%TYPE;
    avg_salary instructor.salary%TYPE;
    new_id instructor.ID%TYPE;
    new_instructor instructor%ROWTYPE;
BEGIN
    SELECT dept_name INTO dept_name
    FROM student
    GROUP BY dept_name
    ORDER BY COUNT(*) DESC
    FETCH FIRST ROW ONLY;

    SELECT MIN(ID) INTO min_id FROM instructor;

    SELECT AVG(salary) INTO avg_salary FROM instructor WHERE dept_name = dept_name;

    new_id := TO_CHAR(TO_NUMBER(min_id) - 1);

    INSERT INTO instructor (ID, name, dept_name, salary)
    VALUES (new_id, 'John Doe', dept_name, avg_salary);

    SELECT * INTO new_instructor FROM instructor WHERE ID = new_id;

    DBMS_OUTPUT.PUT_LINE('Instructor Information:');
    DBMS_OUTPUT.PUT_LINE('ID: ' || new_instructor.ID);
    DBMS_OUTPUT.PUT_LINE('Name: ' || new_instructor.name);
    DBMS_OUTPUT.PUT_LINE('Department Name: ' || new_instructor.dept_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || new_instructor.salary);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found.');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate value on index.');
END;
/