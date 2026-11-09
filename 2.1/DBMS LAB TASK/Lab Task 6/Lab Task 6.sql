1.

CREATE OR REPLACE VIEW Advisor_Selection AS
SELECT ID , name , dept_name
FROM instructor ;

2.

CREATE OR REPLACE VIEW Student_Count AS 
SELECT a.name ,COUNT(d.s_id)as st_count
FROM Advisor_Selection a
Join advisor d ON a.id=d.i_id
group by a.name;

3.

(a)
CREATE ROLE std_role;
GRANT SELECT ON advisor TO std_role;
GRANT SELECT ON course TO std_role;

(b)
CREATE ROLE t_role;
GRANT SELECT ON student TO t_role;
GRANT SELECT ON course TO t_role;

(c)
CREATE ROLE hod_role;
GRANT t_role TO hod_role;
GRANT SELECT,INSERT ON instructor TO hod_role;


(d)
CREATE ROLE admin_role;
Grant select ON department TO admin_role;
Grant update(Budget) ON department TO admin_role;
Grant select ON instructor TO admin_role;

4.

drop user stud ;
drop user teach ;
drop user dept ;
drop user admin ;


create user stud identified by s;
create user teach identified by t ;
create user dept identified by d ;
create user admin identified by a ;


grant  create  session , resource , create tablespace to stud;
grant  create  session , resource , create tablespace to teach;
grant  create  session , resource , create tablespace to dept;
grant  create  session , resource , create tablespace to admin;


grant std_role to stud ;
grant t_role to teach ;
grant hod_role to dept ;
grant admin_role to admin ;



SELECT * FROM Advisor_Selection;
SELECT * FROM student;
SELECT * FROM course;

INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('12', 'Farhan', 'Comp. Sci.', 90000);
SELECT * FROM instructor;  

UPDATE department SET budget = 130000 WHERE dept_name = 'Comp. Sci.';

SELECT * FROM department;
SELECT * FROM instructor;

