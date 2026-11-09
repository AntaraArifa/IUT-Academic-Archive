--Task 01

DECLARE 
    v_dept_name department.dept_name%TYPE;
    v_budget department.budget%TYPE;
    v_count NUMBER(5) := 0;

    CURSOR c1 IS
        SELECT dept_name, budget
        FROM department;

BEGIN
    OPEN c1;

    LOOP
        FETCH c1 INTO v_dept_name, v_budget;
        EXIT WHEN c1%NOTFOUND;

        IF v_budget > 99999 THEN
            UPDATE department
            SET budget = budget * 0.9
            WHERE dept_name = v_dept_name;
        ELSE
            v_count := v_count + 1;
        END IF;
    END LOOP;

    CLOSE c1;

    DBMS_OUTPUT.PUT_LINE('Number of unaffected departments: ' || v_count);
END;
/

--Task 02

DECLARE
    v_day VARCHAR2(1);
    v_start_hr NUMBER(2);
    v_end_hr NUMBER(2);
    v_instructor_name instructor.name%TYPE;

    CURSOR c2 IS
        SELECT DISTINCT i.name
        FROM instructor i
        JOIN teaches t ON i.ID = t.ID
        JOIN section s ON t.course_id = s.course_id AND t.sec_id = s.sec_id AND t.semester = s.semester AND t.year = s.year
        JOIN time_slot ts ON s.time_slot_id = ts.time_slot_id
        WHERE ts.day = v_day AND ts.start_hr >= v_start_hr AND ts.end_hr <= v_end_hr;

BEGIN
    
    DBMS_OUTPUT.PUT_LINE('Enter the day of the week');
    v_day := &v_day;
    DBMS_OUTPUT.PUT_LINE('Enter the starting hour');
    v_start_hr := &v_start_hr;
    DBMS_OUTPUT.PUT_LINE('Enter the ending hour (0-23):');
    v_end_hr := &v_end_hr;

    
    OPEN c2;
    LOOP
        FETCH c2 INTO v_instructor_name;
        EXIT WHEN c2%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_instructor_name);
    END LOOP;
    CLOSE c2;
END;
/

--Task 03

DECLARE 
    v_N NUMBER;
    v_ID student.ID%TYPE;
    v_name student.name%TYPE;
    v_dept_name student.dept_name%TYPE;
    v_course_count NUMBER;

    CURSOR c3 IS
        SELECT s.ID, s.name, s.dept_name, COUNT(*) as course_count
        FROM student s
        JOIN takes t ON s.ID = t.ID
        GROUP BY s.ID, s.name, s.dept_name
        ORDER BY course_count DESC;

BEGIN
    
    DBMS_OUTPUT.PUT_LINE('Enter the number of top students to fetch:');
    v_N := &v_N;

 
    OPEN c3;
    FOR i IN 1..v_N LOOP
        FETCH c3 INTO v_ID, v_name, v_dept_name, v_course_count;
        EXIT WHEN c3%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_ID || ', Name: ' || v_name || ', Department: ' || v_dept_name || ', Courses taken: ' || v_course_count);
    END LOOP;
    CLOSE c3;
END;
/

--Task 04
DECLARE 
    new_id NUMBER;
    h_id NUMBER;
    new_dept VARCHAR(50);
    dept_num NUMBER;

    CURSOR c4 IS
        SELECT dept_name, COUNT(*) AS dept_count
        FROM student 
        GROUP BY dept_name
        ORDER BY dept_count ASC;

BEGIN
    SELECT MAX(id) INTO h_id FROM student;
    new_id := h_id + 1;

    OPEN c4;
    FETCH c4 INTO new_dept, dept_num;
    CLOSE c4;

    INSERT INTO student(id, name, dept_name, tot_cred) VALUES(new_id, 'Jane Doe', new_dept, 0);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('STUDENT INSERTED SUCCESSFULLY.');
END;
/


--Task 05
DECLARE
    student_id student.id%TYPE;
    student_name student.name%TYPE;
    department student.dept_name%TYPE;
    ins_id instructor.id%TYPE;
    ins_name instructor.name%TYPE;
    tot_student NUMBER;
    least_student NUMBER;

    CURSOR without_advisor IS
        SELECT s.id, s.name, s.dept_name
        FROM student s
        WHERE NOT EXISTS(
            SELECT 1
            FROM advisor a
            WHERE a.s_id = s.id
        );

    CURSOR least_students IS
        SELECT i.id, i.name, COUNT(a.s_id) AS tot_student
        FROM advisor a
        JOIN instructor i ON a.i_id = i.id
        WHERE i.dept_name = department
        GROUP BY i.id, i.name
        ORDER BY tot_student ASC;

BEGIN
    OPEN without_advisor;
    LOOP
        FETCH without_advisor INTO student_id, student_name, department;
        EXIT WHEN without_advisor%NOTFOUND;
        
        OPEN least_students;
        FETCH least_students INTO ins_id, ins_name, least_student;
        CLOSE least_students;

        INSERT INTO advisor(s_id, i_id) VALUES (student_id, ins_id);
        DBMS_OUTPUT.PUT_LINE('Assigned advisor ' || ins_name || ' to student ' || student_name ||
                              '. Number of students advised by advisor: ' || least_student);
    END LOOP;

    CLOSE without_advisor;
END;
/
