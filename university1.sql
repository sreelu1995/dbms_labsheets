CREATE TABLE Deprtmnt(
   dept_name varchar(15) PRIMARY KEY,
   dept_room integer,
   contactno numeric(10) 
   );

   CREATE TABLE Faclty (
   Emp_ID varchar(15) PRIMARY KEY,
   emp_name varchar(20),
   dept_name varchar(10),
   salary numeric(6),
   date_of_join date NOT NULL
   );

   CREATE TABLE Students (
     stud_id varchar(15) PRIMARY KEY,
     stud_name varchar(20),
     gender char(1),
     dept varchar(10) NOT NULL,
     adm_yr int
     );
   
   CREATE TABLE Courses (
     course_code varchar(6) PRIMARY KEY,
     course_title varchar(20),
     credit int,
     semester int,
     year int,
     branch varchar(10) unique
     );

     CREATE TABLE Counsellors (
          Emp_ID varchar(15) references Faclty(Emp_ID),
          stud_id varchar(15) references Students(stud_id)
          );

      CREATE TABLE Teach (
         Emp_ID varchar(15) references Faclty(Emp_ID),
         Course_id varchar(15) NOT NULL,
         semester int,
         year int,
         program varchar(10),
         branch varchar(6)
         );

         ALTER TABLE Counsellors ADD CONSTRAINT myprimkey primary key(Emp_ID);
         ALTER TABLE Teach add constraint my_prik primary key(Emp_ID);

    INSERT INTO Deprtmnt VALUES ('CSE',108,4912545444);   
    INSERT INTO Deprtmnt VALUES ('ECE',100,4912545234); 
    INSERT INTO Deprtmnt VALUES ('COM',008,4912546596); 
    INSERT INTO Deprtmnt VALUES ('SSR',118,4912548877); 
    INSERT INTO Deprtmnt VALUES ('PHY',101,4912533443); 
    INSERT INTO Deprtmnt VALUES ('CHE',111,4912545554); 
    INSERT INTO Deprtmnt VALUES ('MAT',211,4912549988); 
    INSERT INTO Deprtmnt VALUES ('ENG',238,4912545000); 
    INSERT INTO Deprtmnt VALUES ('JAP',328,4912523444); 
    INSERT INTO Deprtmnt VALUES ('SAN',108,4912545876); 

    SELECT * FROM Deprtmnt;   

    INSERT INTO Faclty VALUES ('am.en.ud1552','greeshma s','CSE',25000,'2000-5-3');
    INSERT INTO Faclty VALUES ('am.en.uds552','lekshmi sn','ECE',35000,'2001-3-4'); 
    INSERT INTO Faclty VALUES ('U4CSE01','sarath s','CHE',25400,'2002-8-1');         
    INSERT INTO Faclty VALUES ('am.en.uds352','krishna p','PHY',25040,'2003-7-6'); 
    INSERT INTO Faclty VALUES ('am.en.uds452','dhanesh s','COM',20000,'2004-4-3'); 
    INSERT INTO Faclty VALUES ('am.en.uds562','sarika s','MAT',25000,'2005-5-4'); 
    INSERT INTO Faclty VALUES ('am.en.uds762','shini s','SSR',25000,'2006-6-7'); 
    INSERT INTO Faclty VALUES ('am.en.uds662','stephen h','CSE',5000,'2007-5-2'); 
    INSERT INTO Faclty VALUES ('am.en.uds557','tony thomas','JAP',5070,'2008-7-3'); 
    INSERT INTO Faclty VALUES ('am.en.uds587','manoj s r','SAN',28000,'2009-8-6'); 
    INSERT INTO Faclty VALUES ('am.en.uds987','manU s r','SSR',2800,'2019-8-6'); 
 
    SELECT * FROM Faclty;

    INSERT INTO Students VALUES ('AM.EN.U4CSE111','Sreelakshmi S','f','CSE',2013);
    INSERT INTO Students VALUES ('AM.EN.U4CSE152','Sakshi Vaid','f','CSE',2013);
    INSERT INTO Students VALUES ('AM.EN.U4ECE111','RACHANA','f','ECE',2013);
    INSERT INTO Students VALUES ('AM.EN.U4CSE199','DHARSHANA P','f','CSE',2012);
    INSERT INTO Students VALUES ('AM.EN.U4EEE111','Darahas Sai','m','CSE',2015);
    INSERT INTO Students VALUES ('AM.EN.U4MAT111','SAM','m','MAT',2010);
    INSERT INTO Students VALUES ('AM.EN.U3JAP111','Sreelakshmi S','f','JAP',2013);
    INSERT INTO Students VALUES ('AM.EN.U3CHE311','lakshmi S','f','CHE',2009);
    INSERT INTO Students VALUES ('AM.EN.U4SSR411','Sree Rekha S','f','SSR',2015);
    INSERT INTO Students VALUES ('AM.EN.U4COM991','RAJ K','m','COM',2012);
    INSERT INTO Students VALUES ('AM.EN.U4SAN231','VINODH S','M','SAN',2011);

    SELECT * FROM Students;

    INSERT INTO Courses VALUES ('CSE111','SICP',4,1,2000,'CSE'); 
    INSERT INTO Courses VALUES ('ECE211','DSP',4,2,2001,'ECE');    
    INSERT INTO Courses VALUES ('EEE321','ELEC CKTS',5,4,2014,'EEE');    
    INSERT INTO Courses VALUES ('COM311','ACC',2,3,2010,'BCOM');    
    INSERT INTO Courses VALUES ('JAP001','LEVEL1',1,3,2005,'JAP');    
    INSERT INTO Courses VALUES ('PHY211','WAVES',3,2,2008,'PHY');    
    INSERT INTO Courses VALUES ('CIR111','QUANTZ',2,1,2009,'SSR');    
    INSERT INTO Courses VALUES ('CHE211','ORG',4,6,2016,'CHE');    
    INSERT INTO Courses VALUES ('MAT211','COMPLEX',4,3,2003,'MAT');    
    INSERT INTO Courses VALUES ('SAN001','BASICSAN',1,1,2004,'SAN'); 

    SELECT * FROM Courses;

    INSERT INTO Counsellors VALUES ('am.en.ud1552','AM.EN.U4CSE111'); 
    INSERT INTO Counsellors VALUES ('am.en.uds552','AM.EN.U4CSE152');
    INSERT INTO Counsellors VALUES ('U4CSE01','AM.EN.U4ECE111');
    INSERT INTO Counsellors VALUES ('am.en.uds352','AM.EN.U4CSE199');
    INSERT INTO Counsellors VALUES ('am.en.uds452','AM.EN.U4EEE111');
    INSERT INTO Counsellors VALUES ('am.en.uds562','AM.EN.U4MAT111');
    INSERT INTO Counsellors VALUES ('am.en.uds762','AM.EN.U3JAP111');
    INSERT INTO Counsellors VALUES ('am.en.uds662','AM.EN.U4SAN231');
    INSERT INTO Counsellors VALUES ('am.en.uds557','AM.EN.U4COM991');
    INSERT INTO Counsellors VALUES ('am.en.uds587','AM.EN.U4SSR411');
    INSERT INTO Counsellors VALUES ('am.en.uds587','AM.EN.U4SSR411');
    INSERT INTO Counsellors VALUES ('am.en.uds987','U4CSE01');
    

    SELECT * FROM Counsellors;

    INSERT INTO Teach VALUES ('am.en.ud1552','CSE112',5,2015,'REDO','CSE'); 
    INSERT INTO Teach VALUES ('am.en.uds552','ECE112',4,2016,'REG','ECE');
    INSERT INTO Teach VALUES ('U4CSE01','MEC112',3,2014,'FSTR','MEC');
    INSERT INTO Teach VALUES ('am.en.uds352','BCOM112',2,2013,'REG','BCOM');
    INSERT INTO Teach VALUES ('am.en.uds452','MSC112',1,2012,'REDO','MSC');
    INSERT INTO Teach VALUES ('am.en.uds562','EEE112',6,2011,'FSTR','EEE');
    INSERT INTO Teach VALUES ('am.en.uds762','CSE222',5,2010,'FSTR','CSE');
    INSERT INTO Teach VALUES ('am.en.uds587','CSE102',7,2019,'REG','CSE');
    INSERT INTO Teach VALUES ('am.en.uds557','PHY112',4,2018,'REDO','PHY');
    INSERT INTO Teach VALUES ('am.en.uds662','CHE112',8,2017,'REG','CHE');  

    SELECT * FROM Teach

    INSERT INTO Teach VALUES ('am.en.uds662','CSIR12',5,2005,'REDO','CSE');

    SELECT dept_name FROM Deprtmnt;
    SELECT emp_name FROM Faclty WHERE dept_name='CSE';
    SELECT course_title FROM Courses WHERE credit=4;
    SELECT count(*) as no_of_stud FROM Students WHERE adm_yr =2014;

    INSERT INTO Students VALUES ('AM.EN.U4SAN001','prabhas S','M','theatre',2014);
    INSERT INTO Students VALUES ('AM.EN.U4non231','shahid k','M','noN',2014);
    INSERT INTO Students VALUES ('U4CSE01','shakti k','M','noN',2014);

     select Faclty.emp_name from Faclty natural join Counsellors where stud_id='U4CSE01';

    select max(salary) from faclty;

    Alter table Courses add column Exam_slot varchar(2);
    select * from Courses;

    select distinct course_title from Courses where branch='ECE'; 
    
   INSERT INTO Courses VALUES ('PHY001','BASICPHY',1,3,2015,'phy'); 
   INSERT INTO Courses VALUES ('CHE001','BASICCHE',1,2,2013,'che'); 
   
      
   (select course_title from Courses where year=2015 and mod(semester,2)=1)union
   (select course_title from Courses where year=2013 and mod(semester,2)=0);

    select faclty.emp_name from faclty,counsellors where faclty.emp_id=counsellors.emp_id;

    alter table Deprtmnt rename dept_room to room_no;
    select * from Deprtmnt;

   select emp_name,course_title from faclty natural join Courses where year=2012 and mod(semester,2)=0 and branch='CSE';

    select emp_name from faclty where salary between 25000 and 50000;

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
    
