1) select emp_ID from faclty as a where dept_name='CSE' and exists(select emp_id from teach as b where branch='ECE' and a.emp_ID=b.emp_ID);
INSERT INTO Faclty VALUES ('am.en.udsss555','MAX','ECE',NULL,'2009-5-7');
 INSERT INTO Teach VALUES ('am.en.udsss555','CSE112',5,2015,'REDO','CSE'); 

select emp_ID from faclty where dept_name='CSE' and emp_ID in (select emp_ID from teach where branch='ECE');

2) select course_code from courses where mod(semester,2)=0 and year=2009 and course_code in (select course_code from courses where mod(semester,2)<>0 and year=2010);

3) select course_code from courses where mod(semester,2)=0 and year=2009 and course_code not in (select course_code from courses where mod(semester,2)<>0 and year=2010);

4) with maxsalary(value) as (select max(salary) from faclty) select salary from maxsalary, faclty where faclty.salary=maxsalary.value;

5) with minsalary(value) as (select min(salary) from faclty) select salary from minsalary, faclty where faclty.salary=minsalary.value;

6) select emp_name from faclty as a where exists(select emp_id from counsellors as b where a.emp_ID=b.emp_ID);
   select emp_name from faclty where emp_ID in(select emp_id from counsellors);

7)  create table takes (
     stud_name varchar(20) ,
     course_code varchar(20) references Courses(course_code)
     );

insert into takes values ('rachana','CSE111');
insert into takes values ('rana','CSE111');
insert into takes values ('raMA','CSE111');
insert into takes values('punith','cse410',9,'cs');
                             insert into takes values('sree','cse101',10,'me');
                                  insert into takes values('gree','cse101',9,'me');
                                       insert into takes values('hhd','cse101',8,'me');
                                            insert into takes values('diuwy','cse101',9,'me');
                                                  insert into takes values('dpka','cse101',8,'cs');
                                                  
   select stud_name FROM takes where course_code<some(select course_code from Courses where branch='CSE');
   select distinct stud_name from takes where course_code<some(select course_code from takes where  course_code like '%CSE%');

 8)    select dept_name from faclty group by dept_name having avg(salary)>=all(select avg(salary) from faclty group by dept_name);
        select * from faclty;
        update faclty set salary=33000 where salary is null;

 9)     select emp_name, salary,(select avg(salary) from faclty as f where f.dept_name=faclty.dept_name group by dept_name) as avg_sal from faclty;

 10) select dept_name,avg(salary) as avg_sal from faclty group by dept_name having avg(salary)<=all(select avg(salary) from faclty group by dept_name);

 11)   select dept_name,avgsal from (select dept_name,avg(salary) as avgsal from faclty where designation='assi prof' group by(dept_name)) where avgsal>5000;

 12)  select emp_name from faclty where salary>some(select salary from faclty where dept_name='cse');



    alter table takes add grade numeric(2) ;
    alter table takes add dept_name varchar(2) ;
    update takes set grade=10  where course_code='cse130';   

  13. select  stud_name from takes where course_code='cse101'and grade>some(select grade from takes where dept_name='cs');
 
 14.  select  distinct dept_name ,empno from (select dept_name, count(emp_id) from faculty natural join teaching where semester=5 and year=2015 group by dept_name) as sala(dept_name,empno);
   
 15. select dept_name,(select count(emp_id)from faclty where faclty.dept_name=department.dept_name) from department;
      

    