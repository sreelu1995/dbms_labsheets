1.
create table takes(
 course_code varchar(10),
  course_title varchar(20),
    semester int,
  year int,
  student_id varchar(20),
  grade  varchar(2),
  primary key(course_code, course_title, semester,year,student_id));

 insert into takes values('ECE100','Digitals',5,2013,'101','A');
 insert into takes values('CSE300','Hardware',2,2011,'U4CSE01','A');
 insert into takes values('MAT212','Complexnumbers',3,2014,'23','B');  
  insert into takes values('ECE100','Digitals',5,2013,'121','C'); 
 insert into takes values('EEE100','Electricals',1,2013,'211','A');

delete from courses where course_code in
(select distinct course_code from courses where course_code not in
  (select distinct course_id from teaching));

delete from courses where course_code in
 ( select course_code from courses left outer join teaching on courses.course_code=teaching.course_id 
  where course_id is null);
 

  2.
insert into faculty values
(select students.student_id, students.student_name,students.department,1000 from students
where credit>100)

 3.
 alter table students add column tot_credits int;
 update table students set tot_credits=
 (select tot-credits
 
 
4.
select distinct emp_name from faculty left outer join teaching on
faculty.emp_id=teaching.emp_id where
mod(semester,2)=0 and t_year=2015 and teaching.emp_id is null;

5.
select dept_name,( select count(emp_id) from faculty where department.dept_name=faculty.dept_name)
as num_faculty,( select count(student_id) from students where department.dept_name=students.department)
as num_students from department;

6.
select distinct student_id from students left outer join takes
on students.student_id=takes.student_id where
mod(semester,2)<>0 and year=2015 and takes.student_id is null;

7.
(a)
create view students_credits as
select student_name 
from students 
where tot_credits>58;

(b)
create view students_CSE_credits as
select student_name 
from students 
where tot_credits>58 and department='CSE';

8.
create view stud_credits as
select student_id,year,(select sum(credit) from courses group by year) as sum_credits
from takes 

9. (*********)

create table registration (
username   varchar(30),
u_password   varchar(20) default 'Amma123',
student_id  varchar(20),
timeofregn  time,
primary key (username));

COPY registration FROM '/home/likewise-open/AMRITAVIDYA/u4cse13138/Desktop/note.txt';

select * from registration

10.  (*********)
