create table air_ticket(
    ticket_id numeric(10) primary key,
    flight_id varchar(10),
    durn numeric(4),
    seat_no varchar(5),
    tikt_type varchar(5),
    book_status varchar(5),
    price numeric(6),
    book_date date,
    book_time time,   
    foreign key(flight_id) references flight
);

create table customer(
    cust_id varchar(15) primary key,
    name varchar(20),
    house_no numeric(3),
    country varchar(15),
    city varchar(15),
    state varchar(15),
    trav_date date,
    trav_time time
);

create table cust_phnum(
    cust_id varchar(15),
    ph_num numeric(14),
    primary key(cust_id,ph_num)
);

alter table cust_phnum add constraint my_fkey foreign key(cust_id) references customer;

create table airplane(
    airp_id varchar(15) primary key,
    name varchar(20),
    price numeric(8),
    no_of_seat numeric(7)
);

create table plane_repair(
    airp_id varchar(15),
    det_of_repair varchar(25),
    primary key(airp_id,det_of_repair),
    foreign key(airp_id) references airplane
    );

create table staff(
    staff_id varchar(10) primary key,
    name varchar(20),
    salary numeric(6),
    position varchar(10)
); 

create table flight(
    flight_id varchar(15) primary key,
    cntry_origin varchar(10),
    cntry_dest varchar(10),
    dep_date date,
    dep_time time,
    arriv_date date,
    arriv_time time
);

alter table air_ticket add cust_id varchar(15) references customer(cust_id);
alter table flight add airp_id varchar(15) references airplane(airp_id);

create table staff_flight(
   staff_id varchar(10),
   flight_id varchar(15),
   primary key(staff_id,flight_id),
   foreign key(staff_id) references staff,
   foreign key(flight_id) references flight
);

insert into air_ticket values('121','AF102',2,'a1','eco','conf',5000,'01-22-2015','08:30','c121');
                
 insert into customer values('c121','deepika',21,'vidya','kollam','kerala',13323,'01-22-2015','08:30');       

  insert into customer values('c131','rachana',31,'vidya','kollam','kerala',13399,'01-24-2015','10:30');
   insert into customer values('c141','sree',41,'vidya','kollam','kerala',13344,'01-25-2015','11:30');
    insert into customer values('c151','sakshi',51,'vidya','kollam','kerala',134443,'01-30-2015','08:30');
     insert into customer values('c161','arsha',61,'vidya','kollam','kerala',1223243,'01-01-2015','08:30');
      insert into customer values('c171','gudu',71,'vidya','kollam','kerala',132443,'01-23-2015','08:30');              

insert into flight values ('Af108','mumbai','delhi','01-31-2015','08:30','02-01-2015','10:30','a111');
insert into flight values ('Af103','mumbai','goa','02-01-2015','08:30','02-02-2015','10:00','a121');
insert into flight values ('Af104','mumbai','paris','03-02-2015','08:30','03-03-2015','10:00','a131');
insert into flight values ('Af105','mumbai','chennai','10-03-2015','08:30','10-04-2015','12:30','a141');
insert into flight values ('Af102','mumbai','cochin','04-04-2015','08:30','04-05-2015','11:30','a151');

insert into airplane values('a111','king',13453,100);
insert into airplane values('a102','singpr',14443,500);
insert into airplane values('a151','canada',15453,300);
insert into airplane values('a141','indigo',13053,200);
insert into airplane values('a133','qatar',13953,400);

