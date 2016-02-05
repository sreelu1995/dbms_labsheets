  alter table faclty add column Designation varchar(20);
   
   update faclty set Designation='assi prof' where emp_id='am.en.ud1552';
   update faclty set Designation='prof' where emp_id='am.en.uds552'; 
   update faclty set Designation='assi teach' where emp_id='U4CSE01';
   update faclty set Designation='lecturer' where emp_id='am.en.uds352';
   update faclty set Designation='prof' where emp_id='am.en.uds452';
   update faclty set Designation='assi teach' where emp_id='am.en.uds562';
   update faclty set Designation='lecturer' where emp_id='am.en.uds762';
   update faclty set Designation='prof' where emp_id='am.en.uds557';
   update faclty set Designation='assi prof' where emp_id='am.en.uds587';
   update faclty set Designation='assi teach' where emp_id='am.en.ud1552';
   update faclty set Designation='lecturer' where emp_id='am.en.uds662';

   select * from faclty;
   select count(Designation) from faclty where Designation='prof' and dept_name='ECE';

   select dept_name,count(Designation) as no_ofap from faclty where Designation='assi prof' group by dept_name;

   select dept_name,avg(salary) as avgsal from faclty group by dept_name;

   select dept_name,Designation,avg(salary) as avgsal from faclty group by dept_name,Designation;

    INSERT INTO Faclty VALUES ('am.en.ud2552','SAKSHI','CSE',NULL,'2001-5-1');
     INSERT INTO Faclty VALUES ('am.en.ud3552','GANESH','ECE',NULL,'2003-5-3');
      INSERT INTO Faclty VALUES ('am.en.ud1554','SAM','PHY',NULL,'2008-5-2');
       INSERT INTO Faclty VALUES ('am.en.ud1652','MAX','EEE',NULL,'2009-5-7');
   
   SELECT emp_name from Faclty where salary is NULL;

   select dept_name,avg(salary) from faclty group by dept_name;

   select dept_name,avg(salary) from faclty group by dept_name having avg(salary)>5000 ;

     select dept_name,avg(salary) from faclty where Designation='assi prof' group by dept_name having avg(salary)>5000;

     update faclty set salary=salary*1.15 where Designation like 'assi%';
    select emp_name,salary,Designation from faclty where Designation like 'assi%';

     update faclty set salary=salary*1.15 where Designation like 'assi%' and salary<10000;

     select faclty.emp_name,Teach.Course_id from faclty,Teach where faclty.Emp_ID=Teach.Emp_ID;

     select emp_name,Course_id from faclty natural join Teach;

     select i.emp_name from Faclty as i,Faclty as s where i.salary>s.salary and s.dept_name='CSE';

     INSERT INTO Students VALUES ('AM.EN.U4CSE119','Sreyas','f','CSE',2013);

     select * from Students where stud_name like '______';

     select * from Students order by stud_name;

     select * from Students order by stud_name,adm_yr desc;
    