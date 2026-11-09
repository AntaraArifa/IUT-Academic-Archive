--1

SELECT name
FROM instructor
WHERE dept_name = 'Biology';

--2

SELECT t.course_id, c.title
FROM takes t join course c on t.course_id = c.course_id
WHERE t.ID = '73492';

--3

SELECT s.name, s.dept_name
FROM student s join takes t on s.ID = t.ID
join section sec on t.course_id = sec.course_id join course c on sec.course_id = c.course_id
WHERE c.dept_name = 'Comp. Sci.';

--4

SELECT s.name
FROM student s join takes t on s.ID = t.ID
join section sec on t.course_id = sec.course_id
WHERE t.course_id = 'CS-101' AND sec.semester = 'Spring' AND sec.year = 2018;

--5

SELECT s.name
FROM student s
WHERE s.ID IN (
    SELECT t.ID
    FROM takes t
    WHERE t.course_id LIKE 'CS%'
    GROUP BY t.ID
    HAVING COUNT(*) = (
        SELECT MAX(course_count)
        FROM (
            SELECT COUNT(*) as course_count
            FROM takes t
            WHERE t.course_id LIKE 'CS%'
            GROUP BY t.ID
        )
    )
);

--6

SELECT s.name
FROM student s join takes t on s.ID = t.ID join section sec on t.course_id = sec.course_id join teaches tea on sec.course_id = tea.course_id
GROUP BY s.name
HAVING COUNT(DISTINCT tea.ID) >= 3;

--7

SELECT c.title, t.course_id, t.sec_id, COUNT(*) as num_enrollments
FROM takes t
JOIN course c ON t.course_id = c.course_id
GROUP BY t.course_id, t.sec_id, c.title
HAVING COUNT(*) > 0
ORDER BY num_enrollments ASC
FETCH FIRST 1 ROWS ONLY;

--8

SELECT i.name, i.dept_name, COUNT(a.s_ID) AS advisee_count
FROM instructor i
LEFT join advisor a on i.ID = a.i_ID
GROUP BY i.name, i.dept_name;

--9

SELECT s.name, s.dept_name
FROM student s
JOIN (
    SELECT ID, COUNT(*) AS num_courses
    FROM takes
    GROUP BY ID
    HAVING COUNT(*) > (SELECT AVG(num_courses) FROM (
        SELECT ID, COUNT(*) AS num_courses
        FROM takes
        GROUP BY ID
    ) AS avg_courses)
) AS more_than_avg
ON s.ID = more_than_avg.ID;

--10

INSERT INTO student (ID, name, dept_name, tot_cred)
SELECT ID, name, dept_name, 0
FROM instructor where ID <> '76543';

--11

select student.id from
student join instructor on student.id = instructor.id;

--12

UPDATE student s
SET tot_cred = (
  SELECT SUM(c.credits)
  FROM takes t
  JOIN course c ON t.course_id = c.course_id
  WHERE t.ID = s.ID
);

--13

UPDATE instructor i
SET salary = (
  SELECT COUNT(*) * 10000
  FROM teaches t
  WHERE t.ID = i.ID
);

--14

SELECT s.ID, s.name, AVG(gp.points * c.credits) as CPI
FROM student s
LEFT JOIN takes t ON s.ID = t.ID
LEFT JOIN course c ON t.course_id = c.course_id
LEFT JOIN (
  SELECT 'A' as grade, 10 as points FROM dual UNION ALL
  SELECT 'B', 8 FROM dual UNION ALL
  SELECT 'C', 6 FROM dual UNION ALL
  SELECT 'D', 4 FROM dual UNION ALL
  SELECT 'F', 0 FROM dual
) gp ON t.grade = gp.grade
GROUP BY s.ID, s.name;


