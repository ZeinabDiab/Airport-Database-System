USE FINAL_AIRPORT


create table airport (
    airportId int primary key,
    name varchar(100) not null,
    location varchar(100) not null,
    terminalsCount int not null
);

insert into airport values
(1,'Cairo Airport','Cairo',3),
(2,'Alex Airport','Alexandria',2),
(3,'Aswan Airport','Aswan',1),
(4,'Luxor Airport','Luxor',2),
(5,'Hurghada Airport','Hurghada',3);

create table gate (
    gateId int primary key,
    gateNumber varchar(20) not null,
    terminal varchar(20) not null
);

insert into gate values
(1,'G1','T1'),
(2,'G2','T1'),
(3,'G3','T2'),
(4,'G4','T2'),
(5,'G5','T3');

create table flight (
    flightId int primary key,
    flightNo varchar(50) not null,
    duration varchar(50),
    departureTime datetime not null,
    arrivalTime datetime not null,
    status varchar(50),
    airlineName varchar(100) not null,
    airportId int not null,
    gateId int not null,
    foreign key (airportId) references airport(airportId)
        on delete cascade
        on update cascade,
    foreign key (gateId) references gate(gateId)
        on delete no action
        on update cascade
);

insert into flight values
(1,'MS101','2h','2025-01-01 08:00','2025-01-01 10:00','on time','EgyptAir',1,1),
(2,'MS102','1.5h','2025-01-02 09:00','2025-01-02 10:30','delayed','EgyptAir',2,2),
(3,'QR201','3h','2025-01-03 11:00','2025-01-03 14:00','on time','Qatar Airways',3,3),
(4,'EK301','4h','2025-01-04 13:00','2025-01-04 17:00','cancelled','Emirates',4,4),
(5,'SV401','2.5h','2025-01-05 15:00','2025-01-05 17:30','on time','Saudi Airlines',5,5);

create table passenger (
    passengerId int primary key,
    name varchar(100) not null,
    passengerNo varchar(50) not null,
    department varchar(50),
    email varchar(100),
    address varchar(200) not null
);

insert into passenger values
(1,'Ahmed Ali','P1001','IT','ahmed@gmail.com','Cairo'),
(2,'Mona Hassan','P1002','HR','mona@gmail.com','Giza'),
(3,'Omar Salah','P1003','Finance','omar@gmail.com','Alex'),
(4,'Sara Adel','P1004','Sales','sara@gmail.com','Aswan'),
(5,'Youssef Kamal','P1005','Marketing','youssef@gmail.com','Luxor');

create table booking (
    bookingId int primary key,
    paymentStatus varchar(50) not null,
    bookingDate date not null,
    passengerId int not null,
    flightId int not null,
    foreign key (passengerId) references passenger(passengerId)
        on delete cascade
        on update cascade,
    foreign key (flightId) references flight(flightId)
        on delete cascade
        on update cascade
);

insert into booking values
(1,'paid','2024-12-01',1,1),
(2,'paid','2024-12-02',2,2),
(3,'pending','2024-12-03',3,3),
(4,'paid','2024-12-04',4,4),
(5,'cancelled','2024-12-05',5,5);

create table ticket (
    ticketNo int,
    bookingId int not null,
    issueDate date not null,
    price decimal(10,2) not null,
    seatNo varchar(10) not null,
    primary key (ticketNo, bookingId),
    foreign key (bookingId) references booking(bookingId)
        on delete cascade
        on update cascade
);

insert into ticket values
(101,1,'2024-12-01',1500,'A1'),
(102,2,'2024-12-02',1200,'B2'),
(103,3,'2024-12-03',1800,'C3'),
(104,4,'2024-12-04',2000,'D4'),
(105,5,'2024-12-05',1600,'E5');

create table securityCheck (
    checkid int primary key,
    time datetime not null,
    status varchar(50) not null,
    passengerId int not null,
    foreign key (passengerId) references passenger(passengerId)
        on delete cascade
        on update cascade
);

insert into securityCheck values
(1,'2025-01-01 07:30','clear',1),
(2,'2025-01-02 08:30','clear',2),
(3,'2025-01-03 10:30','hold',3),
(4,'2025-01-04 12:30','clear',4),
(5,'2025-01-05 14:30','clear',5);

create table passport (
    passportId int primary key,
    nationality varchar(50) not null,
    issueDate date not null,
    expiry_date date not null,
    gender varchar(10) not null,
    passengerId int not null,
    foreign key (passengerId) references passenger(passengerId)
        on delete cascade
        on update cascade
);

insert into passport values
(1,'Egyptian','2020-01-01','2030-01-01','male',1),
(2,'Egyptian','2019-02-01','2029-02-01','female',2),
(3,'Egyptian','2018-03-01','2028-03-01','male',3),
(4,'Egyptian','2021-04-01','2031-04-01','female',4),
(5,'Egyptian','2022-05-01','2032-05-01','male',5);

create table baggage (
    bag_no int,
    passengerId int not null,
    status varchar(50),
    weight int not null,
    primary key (bag_no, passengerId),
    foreign key (passengerId) references passenger(passengerId)
        on delete cascade
        on update cascade
);

insert into baggage values
(1,1,'checked',20),
(2,2,'checked',18),
(3,3,'lost',22),
(4,4,'checked',25),
(5,5,'checked',19);

create table staff (
    staffId int primary key,
    role varchar(50) not null,
    name varchar(100) not null,
    department varchar(50),
    email varchar(100),
    address varchar(200)
);

insert into staff values
(1,'Pilot','Ali Mahmoud','Flight','ali@gmail.com','Cairo'),
(2,'Co-Pilot','Hany Mostafa','Flight','hany@gmail.com','Giza'),
(3,'Engineer','Karim Said','Maintenance','karim@gmail.com','Alex'),
(4,'Security','Mohamed Adel','Security','mohamed@gmail.com','Aswan'),
(5,'Hostess','Nour Hassan','Cabin','nour@gmail.com','Luxor');

create table works_on (
    staffId int not null,
    flightId int not null,
    primary key (staffId, flightId),
    foreign key (staffId) references staff(staffId)
        on delete cascade
        on update cascade,
    foreign key (flightId) references flight(flightId)
        on delete cascade
        on update cascade
);

insert into works_on values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

create table passenger_address (
    passengerId int not null,
    address varchar(200) not null,
    primary key (passengerId, address),
    foreign key (passengerId) references passenger(passengerId)
        on delete cascade
        on update cascade
);

insert into passenger_address values
(1,'Cairo'),
(2,'Giza'),
(3,'Alexandria'),
(4,'Aswan'),
(5,'Luxor');

create table staff_address (
    staffId int not null,
    address varchar(200) not null,
    primary key (staffId, address),
    foreign key (staffId) references staff(staffId)
        on delete cascade
        on update cascade
);

insert into staff_address values
(1,'Cairo'),
(2,'Giza'),
(3,'Alexandria'),
(4,'Aswan'),
(5,'Luxor');

-------------------------------------
-- AIRPORT TABLE QUERIES
-------------------------------------
select * from airport;
select name, location from airport;
select * from airport where terminalsCount > 2;
select * from airport order by terminalsCount desc
select * from airport where location = 'Cairo';
select name as airport_name, location as city from airport;
select count(*) as total_airports from airport;
select max(terminalsCount) as max_terminals from airport;
select * from airport 
where terminalsCount > (select avg(terminalsCount) from airport);

-------------------------------------
-- GATE TABLE QUERIES
-------------------------------------
select * from gate;
select * from gate where terminal = 'T1';
select terminal, count(*)  
from gate group by terminal;
select gateNumber +'-' + terminal as gate_code from gate;

-------------------------------------
-- FLIGHT TABLE QUERIES
-------------------------------------
select * from flight;
select * from flight where status = 'on time';
select flightNo, airlineName from flight;
select * from flight 
where airportId in (select airportId from airport where terminalsCount > 2);

select flight.flightNo, airport.name as airport_name, flight.status
from flight inner join airport on flight.airportId = airport.airportId;

select flight.flightNo, gate.gateNumber
from flight inner join gate on flight.gateId = gate.gateId;

-------------------------------------
-- PASSENGER QUERIES
-------------------------------------
select * from passenger;
select * from passenger where address in ('Cairo','Giza','Aswan');
select * from passenger where department = 'IT';

select address, count(*) as total_passengers
from passenger group by address;

select *
from passenger
where passengerId in (select passengerId from booking where paymentStatus = 'paid');

-------------------------------------
-- BOOKING QUERIES
-------------------------------------
select * from booking;
select * from booking where paymentStatus = 'paid';

select paymentStatus, count(*) as count_status
from booking group by paymentStatus;

select booking.bookingId, passenger.name, flight.flightNo, booking.paymentStatus
from booking
left join passenger on booking.passengerId = passenger.passengerId
inner join flight on booking.flightId = flight.flightId;

-------------------------------------
-- TICKET QUERIES
-------------------------------------
select * from ticket;
select * from ticket where price > 1500;
select bookingId, count(*) as total_tickets 
from ticket group by bookingId;

-------------------------------------
-- SECURITY CHECK QUERIES
-------------------------------------
select * from securityCheck;
select * from securityCheck where status = 'hold';
select passengerId, count(*) as checks
from securityCheck group by passengerId;

-------------------------------------
-- PASSPORT QUERIES
-------------------------------------
select * from passport;
select * from passport where gender = 'male';
select nationality, count(*) from passport group by nationality;

select *
from passport
where expiry_date is not null;

-------------------------------------
-- BAGGAGE QUERIES
-------------------------------------
select * from baggage;
select * from baggage where status = 'lost';
select passengerId, sum(weight) as total_weight
from baggage group by passengerId;

-------------------------------------
-- STAFF QUERIES
-------------------------------------
select * from staff;
select * from staff where role = 'Pilot';
select department, count(*) as total_staff
from staff group by department;

-------------------------------------
-- works_on QUERIES
-------------------------------------
select * from works_on;

select staff.name, flight.flightNo
from works_on
inner join staff on works_on.staffId = staff.staffId
inner join flight on works_on.flightId = flight.flightId;

-------------------------------------
-- PASSENGER ADDRESS QUERIES
-------------------------------------
select * from passenger_address;

select address, count(*) as occurences 
from passenger_address
group by address;

-------------------------------------
-- STAFF ADDRESS QUERIES
-------------------------------------
select * from staff_address;

select address, count(*) as occurences 
from staff_address group by address;
---------------------zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz---------------------------------------------
-------------------------------------
-- AIRPORT VIEWS
-------------------------------------
create view airport_info as
select name, location, terminalsCount from airport;

create view big_airports as
select * from airport where terminalsCount > 2;

create view airport_locations as
select airportId, name + ' - ' + location as full_location
from airport;

-------------------------------------
-- GATE VIEWS
-------------------------------------
create view gate_info as
select gateId, gateNumber, terminal from gate;

create view t1_gates as
select * from gate where terminal = 'T1';

create view gate_codes as
select gateNumber + '-' + terminal as gate_label
from gate;

-------------------------------------
-- FLIGHT VIEWS
-------------------------------------
create view flight_info as
select 
    flightNo, duration, departureTime, arrivalTime, status,
    airlineName, gateNumber, airport.name as airport_name
from flight
inner join gate on flight.gateId = gate.gateId
inner join airport on flight.airportId = airport.airportId;

create view upcoming_flights as
select * from flight 
where departureTime > '2024-12-31';

create view ontime_flights as
select * from flight where status = 'on time';

-------------------------------------
-- PASSENGER VIEWS
-------------------------------------
create view passenger_info as
select passengerId, name, passengerNo, department, email, address
from passenger;

create view passenger_contact as
select name, email from passenger;

create view passenger_with_passport as
select passenger.name, passport.nationality, passport.expiry_date
from passenger
inner join passport on passenger.passengerId = passport.passengerId;

-------------------------------------
-- BOOKING VIEWS
-------------------------------------
create view booking_info as
select bookingId, paymentStatus, bookingDate, name as passenger_name, flightNo
from booking
inner join passenger on booking.passengerId = passenger.passengerId
inner join flight on booking.flightId = flight.flightId;

create view paid_bookings as
select * from booking where paymentStatus = 'paid';

-------------------------------------
-- TICKET VIEWS
-------------------------------------
create view ticket_info as
select ticketNo, bookingId, issueDate, price, seatNo
from ticket;

create view expensive_tickets as
select * from ticket where price > 1500;

-------------------------------------
-- SECURITY CHECK VIEWS
-------------------------------------
create view security_summary as
select passengerId, status, time
from securityCheck;

create view hold_passengers as
select passengerId, time
from securityCheck
where status = 'hold';

-------------------------------------
-- PASSPORT VIEWS
-------------------------------------
create view passport_info as
select passportId, nationality, issueDate, expiry_date, gender, passengerId
from passport;

create view expired_passports as
select * from passport where expiry_date < '2030-01-01';

-------------------------------------
-- BAGGAGE VIEWS
-------------------------------------
create view baggage_info as
select bag_no, passengerId, status, weight
from baggage;

create view lost_baggage as
select * from baggage where status = 'lost';

-------------------------------------
-- STAFF VIEWS
-------------------------------------
create view staff_info as
select staffId, role, name, department, email
from staff;

create view pilots as
select * from staff where role = 'Pilot';

-------------------------------------
-- works_on VIEWS
-------------------------------------
create view staff_flight_assign as
select staff.name, staff.role, flight.flightNo
from works_on
inner join staff on works_on.staffId = staff.staffId
inner join flight on works_on.flightId = flight.flightId;

-------------------------------------
-- ADDRESS TABLE VIEWS
-------------------------------------
create view passenger_addresses as
select passengerId, address from passenger_address;

create view staff_addresses as
select staffId, address from staff_address;
-----------create view using LIKE operator for start char-----------------
create view passengers_with_a as
select *
from passenger
where name like '%a%';
-----------create view using LIKE operator search for prefix string -----------------
create view ms_flights as
select *
from flight
where flightno like 'MS%';
-----------create view using LIKE operator search for suffix string -----------------
create view staff_names_end_d as
select *
from staff
where name like '%d';
/*=====================================================
    DIFFERENT TYPES OF JOINS
=====================================================*/

-------------------------------------
-- INNER JOIN
-------------------------------------
select flight.flightNo , airport.name as airport_name
from flight
inner join airport
on flight.airportId = airport.airportId;

-------------------------------------
-- LEFT JOIN
-------------------------------------
select passenger.name , booking.paymentStatus
from passenger
left join booking
on passenger.passengerId = booking.passengerId;

-------------------------------------
-- RIGHT JOIN
-------------------------------------
select booking.bookingId , passenger.name
from booking
right join passenger
on booking.passengerId = passenger.passengerId;

-------------------------------------
-- FULL OUTER JOIN
-------------------------------------
select passenger.name , booking.bookingId
from passenger
full outer join booking
on passenger.passengerId = booking.passengerId;

-------------------------------------
-- CROSS JOIN
-------------------------------------
select airport.name , gate.gateNumber
from airport
cross join gate;

-------------------------------------
-- SELF JOIN
-------------------------------------
select s1.name as staff1 , s2.name as staff2 , s1.department
from staff s1
join staff s2
on s1.department = s2.department
and s1.staffId <> s2.staffId;

-------------------------------------
-- LEFT JOIN WITH FLIGHT + GATE
-------------------------------------
select flight.flightNo , gate.gateNumber
from flight
left join gate
on flight.gateId = gate.gateId;

-------------------------------------
-- RIGHT JOIN WITH STAFF + WORKS_ON
-------------------------------------
select staff.name , works_on.flightId
from works_on
right join staff
on works_on.staffId = staff.staffId;



/*=====================================================
    STORED PROCEDURES (2)
=====================================================*/

-------------------------------------
-- PROCEDURE 1
-------------------------------------
create procedure getPassengerBookings
as
begin
    select passenger.name ,
           booking.bookingId ,
           booking.paymentStatus
    from passenger
    inner join booking
    on passenger.passengerId = booking.passengerId;
end;

-------------------------------------
-- EXECUTE
-------------------------------------
exec getPassengerBookings;

-------------------------------------
-- PROCEDURE 2
-------------------------------------
create procedure getFlightDetails
as
begin
    select flight.flightNo ,
           airport.name as airport_name ,
           gate.gateNumber ,
           flight.status
    from flight
    inner join airport
    on flight.airportId = airport.airportId
    inner join gate
    on flight.gateId = gate.gateId;
end;

-------------------------------------
-- EXECUTE
-------------------------------------
exec getFlightDetails;



/*=====================================================
    FUNCTIONS (2)
=====================================================*/

-------------------------------------
-- FUNCTION 1
-------------------------------------
create function totalTickets()
returns int
as
begin
    declare @total int;

    select @total = count(*)
    from ticket;

    return @total;
end;

-------------------------------------
-- EXECUTE
-------------------------------------
select dbo.totalTickets() as total_tickets;

-------------------------------------
-- FUNCTION 2
-------------------------------------
create function passengerCountByCity(@city varchar(100))
returns int
as
begin
    declare @count int;

    select @count = count(*)
    from passenger
    where address = @city;

    return @count;
end;

-------------------------------------
-- EXECUTE
-------------------------------------
select dbo.passengerCountByCity('Cairo') as passengers_in_cairo;



/*=====================================================
    TRIGGERS (2)
=====================================================*/

-------------------------------------
-- TRIGGER 1
-------------------------------------
create trigger trg_after_insert_booking
on booking
after insert
as
begin
    print 'New booking inserted successfully';
end;

-------------------------------------
-- TEST TRIGGER
-------------------------------------
insert into booking values
(6,'paid','2024-12-06',1,2);

-------------------------------------
-- TRIGGER 2
-------------------------------------
create trigger trg_after_delete_passenger
on passenger
after delete
as
begin
    print 'Passenger deleted successfully';
end;

-------------------------------------
-- TEST TRIGGER
-------------------------------------
delete from passenger
where passengerId = 5;



/*=====================================================
    EXTRA VIEWS (2)
=====================================================*/

-------------------------------------
-- VIEW 1
-------------------------------------
create view delayed_flights
as
select *
from flight
where status = 'delayed';

-------------------------------------
-- VIEW 2
-------------------------------------
create view staff_emails
as
select name , email
from staff;



/*=====================================================
    RELATIONAL ALGEBRA OPERATIONS
=====================================================*/

-------------------------------------
-- 1. SELECTION (σ)
-------------------------------------
select *
from passenger
where address = 'Cairo';

-------------------------------------
-- 2. PROJECTION (π)
-------------------------------------
select name , email
from passenger;

-------------------------------------
-- 3. RENAME (ρ)
-------------------------------------
select name as passenger_name ,
       address as city
from passenger;

-------------------------------------
-- 4. DIFFERENCE (-)
-------------------------------------
select passengerId
from passenger

except

select passengerId
from booking;

-------------------------------------
-- 5. UNION (∪)
-------------------------------------
select address
from passenger

union

select address
from staff;

-------------------------------------
-- 6. CARTESIAN PRODUCT (×)
-------------------------------------
select *
from airport
cross join gate;