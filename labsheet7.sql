   LABSHEET 7

   1. create table classroom(

        roomno numeric(3) primary key,
        capacity integer

   );

   insert into classroom values(101,100);
   insert into classroom values(102,150);
   insert into classroom values(103,60);
   insert into classroom values(104,80);
   insert into classroom values(105,100);
   insert into classroom values(106,50);

  2. create table section(

      cid varchar(6),
      secid varchar(6) ,
      sem numeric(3),
      year numeric(4),
      primary key(cid,secid,sem,year)
  );
drop table section;

  insert into section values( 'CSE100','CSEA',1,2015);
  insert into section values( 'CSE220','CSEC',2,2013);
  insert into section values( 'ECE100','ECEA',1,2016);
  insert into section values( 'ME300','MECB',3,2014);
  insert into section values( 'PHY220','MSCA',4,2015);
  insert into section values( 'EEE430','EEEA',7,2013);

  ALTER TABLE SECTION ADD roomno numeric(3);

  create or replace function room_allot(varchar(6),varchar(6),integer,numeric(4),numeric(3)) returns integer as
  $$
      declare rno integer default 0;

      begin 
            rno=(select count(roomno) from section where mod(sem,2)=mod($3,2) and year=$4 and roomno=$5);
            if rno=0
             then update section set roomno=$5 where (cid,secid,sem,year)=($1,$2,$3,$4);
             return 0;

             else
               raise notice 'class already allotted! not available currently!';
               return -1;
               end if;
               end;
               $$
               language plpgsql;

                 select room_allot('CSE100','CSEA',1,2015,101);   
                 select room_allot('CSE220','CSEC',2,2013,102); 
                 select room_allot('ECE100','ECEA',1,2016,103); 
                 select room_allot('ME300','MECB',3,2014,104); 
                 select room_allot('PHY220','MSCA',4,2015,104);  

  3.    create or replace function register_stud(

                sid numeric(15),
                scourseid numeric(5),
                ssecid numeric(5),
                ssem numeric(1),
                syear numeric(4))
                returns integer as
                $$
                    declare 
                            noofstudents bigint default 0;
                            rlimit integer default 0;

                    begin
                           noofstudents=(select count(*) from takes where cid=scourseid and secid=ssecid and sem=ssem and year =syear);
                           rlimit=(select capacity from classroom natural join section where cid=scourseid and secid=ssecid and sem=ssem and year=syear);

                           if noofstudents<rlimit
                           then insert into takes values (sid,scourseid,sem,year,null);
                           return 0;

                           else
                                raise notice 'limit reached for course(%%%)',scourse,ssem,syear;
                                return -1;

                           end if;
                           end;

                   $$
                   language plpgsql;

  select register_stud(12345,'111','1',1,2015);

 6. CREATE OR REPLACE FUNCTION cancel(cticket_id varchar(15),cdate date) returns integer as
       $$
          
          declare c_date date;

          begin

          c_date=(select dep_date from flight natural join air_ticket);
                     if (c_date-cdate)>2
                  then
                     delete from air_ticket where ticket_id=cticket_id;
                     return 1;
                else
                  raise notice 'cancellation not possible!';
                  return 0;
               end if;
               end  
          $$
          language plpgsql;  

          select cancel('121','01-01-2015'); 

5. 
create or replace function flight_book(tkt_id varchar(10), fl_id varchar(10), durtn time, seatno varchar(5),
						tick_typ varchar(10), cust_id varchar(10)) returns integer as
$$
	declare
	n integer default 0;
	p_limit integer default 0;

	begin
	n = (select count(*) from air_ticket where booking_status = 'confirmed' and flight_id = fl_id and
									ticket_type = tick_typ and duration = durtn);
	p_limit = (select no_of_seat from airplane where airplane_id = fl_id);

	
	if  n < p_limit
		then insert into air_ticket values (tkt_id, cust_id, fl_id, durtn, seatno, tick_typ, 'confirmed', '12000',current_date, current_time);
			return 1;
	else
		insert into air_ticket values (tkt_id, cust_id, fl_id, durtn, seatno, tick_typ, 'not-confirmed', '12000',current_date, current_time);
		return 0;
	end if;
	end;
$$ language plpgsql;

select flight_book();

4. create or replace function modify_teacher(year1 numeric,oore varchar(5),year2 numeric) returns integer as
$$
     declare n numeric default 0;
     begin
	if oore = 'even'
	then n=0;
     else n=1;
     
     end if;

     insert into teach(select emp_id, course_id, semester, year2,null,null from teach where year = year1 and mod(semester,2) = n);
     return 0;
     end;
$$ 
language plpgsql;

select modify_teacher(2010,'even',2020);

select * from teach;

           
         