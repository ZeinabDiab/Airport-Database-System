# ✈️ Airport Database Management System

A comprehensive **Airport Database Management System** designed to model and manage core airport operations using a relational database.

The project demonstrates practical **Database Management System (DBMS)** concepts through database design, SQL querying, relational algebra, views, stored procedures, user-defined functions, triggers, constraints, and multiple types of table relationships.

---

## 📌 Project Overview

The system models an airport environment and manages different operational entities such as:

- Airports
- Gates
- Flights
- Passengers
- Bookings
- Tickets
- Security Checks
- Passports
- Baggage
- Staff
- Staff–Flight Assignments
- Passenger Addresses
- Staff Addresses

The database is implemented using **SQL Server / T-SQL** and contains database creation scripts, sample data, queries, views, procedures, functions, triggers, joins, and relational algebra operations.

---

## 🏗️ Database Architecture

The database follows a **relational database model**, where information is organized into related tables connected through primary and foreign keys.

### Main Entities

| Entity | Description |
|---|---|
| Airport | Stores airport information and terminal capacity |
| Gate | Stores gate numbers and terminal assignments |
| Flight | Stores flight schedules, status, airline, airport, and gate |
| Passenger | Stores passenger personal and contact information |
| Booking | Connects passengers with flights and tracks payment status |
| Ticket | Stores ticket details, price, issue date, and seat |
| SecurityCheck | Tracks passenger security checks |
| Passport | Stores passport and nationality information |
| Baggage | Stores baggage status and weight |
| Staff | Stores airport staff information |
| Works_On | Associates staff members with flights |
| Passenger_Address | Stores passenger addresses |
| Staff_Address | Stores staff addresses |

---

# 🧠 DBMS Concepts Demonstrated

## 1. Relational Database Design

The system uses a relational model where data is divided into logically related entities to reduce redundancy and maintain data consistency.

The database contains **13 tables**, including entity tables and relationship/address tables.

---

## 2. Primary Keys

Primary keys uniquely identify records within tables.

Examples:

```sql
airportId INT PRIMARY KEY
flightId INT PRIMARY KEY
passengerId INT PRIMARY KEY
bookingId INT PRIMARY KEY

Composite primary keys are also demonstrated:

PRIMARY KEY (ticketNo, bookingId)

and:

PRIMARY KEY (staffId, flightId)
3. Foreign Keys

Foreign keys establish relationships between tables and maintain referential integrity.

Example:

FOREIGN KEY (airportId)
REFERENCES airport(airportId)

The project also demonstrates different referential actions such as:

ON DELETE CASCADE
ON DELETE NO ACTION
ON UPDATE CASCADE
4. Constraints

The database uses several integrity constraints, including:

PRIMARY KEY
FOREIGN KEY
NOT NULL

These constraints help maintain valid and consistent data.

5. CRUD Operations

The project demonstrates SQL operations for manipulating and retrieving database records:

CREATE
INSERT
SELECT
UPDATE
DELETE
🔎 SQL Querying

The project contains queries demonstrating different SQL concepts.

Filtering
SELECT *
FROM airport
WHERE terminalsCount > 2;
Sorting
SELECT *
FROM airport
ORDER BY terminalsCount DESC;
Aggregation

Examples include:

COUNT()
MAX()
SUM()
AVG()
Grouping
SELECT terminal, COUNT(*)
FROM gate
GROUP BY terminal;
Aliases
SELECT name AS airport_name,
       location AS city
FROM airport;
🔗 SQL Joins

The project demonstrates multiple types of joins:

INNER JOIN

Combines matching records between related tables.

LEFT JOIN

Returns all records from the left table and matching records from the right table.

RIGHT JOIN

Returns all records from the right table and matching records from the left table.

FULL OUTER JOIN

Returns matching and non-matching records from both tables.

CROSS JOIN

Produces the Cartesian product between two tables.

SELF JOIN

Joins a table with itself to compare related records.

Example:

SELECT s1.name AS staff1,
       s2.name AS staff2,
       s1.department
FROM staff s1
JOIN staff s2
ON s1.department = s2.department
AND s1.staffId <> s2.staffId;
🧩 Subqueries

The database includes nested queries for filtering and comparison.

Example:

SELECT *
FROM airport
WHERE terminalsCount >
      (SELECT AVG(terminalsCount)
       FROM airport);

Subqueries are also used with IN to connect information across related tables.

👁️ Database Views

The project implements multiple SQL Views to simplify repeated queries and provide reusable database-level representations.

Examples include:

airport_info
big_airports
airport_locations
flight_info
upcoming_flights
ontime_flights
passenger_info
passenger_contact
passenger_with_passport
booking_info
paid_bookings
ticket_info
security_summary
hold_passengers
passport_info
baggage_info
lost_baggage
staff_info
pilots
staff_flight_assign
delayed_flights
staff_emails

Views are used to encapsulate frequently required queries and simplify data retrieval.

⚙️ Stored Procedures

The project demonstrates 2 stored procedures for reusable database operations.

getPassengerBookings

Retrieves passenger booking information by joining passengers with their bookings.

getFlightDetails

Retrieves flight information together with the associated airport and gate.

Example:

EXEC getPassengerBookings;
EXEC getFlightDetails;
🧮 User-Defined Functions

The database includes 2 user-defined functions.

totalTickets()

Returns the total number of tickets.

passengerCountByCity(@city)

Returns the number of passengers associated with a specific city.

Example:

SELECT dbo.totalTickets();

SELECT dbo.passengerCountByCity('Cairo');
⚡ Database Triggers

The project demonstrates 2 triggers for event-driven database behavior.

trg_after_insert_booking

Executes after a new booking is inserted.

trg_after_delete_passenger

Executes after a passenger record is deleted.

Triggers demonstrate how database actions can automatically execute logic in response to data modifications.

🔤 Pattern Matching

The project demonstrates SQL pattern matching using the LIKE operator.

Examples include:

Searching names containing a specific character
Finding flights with a specific prefix
Finding staff names ending with a specific character

Example:

SELECT *
FROM flight
WHERE flightNo LIKE 'MS%';
📐 Relational Algebra

The project includes practical implementations of relational algebra concepts using SQL:

Relational Algebra	SQL Equivalent
Selection (σ)	WHERE
Projection (π)	SELECT columns
Rename (ρ)	AS
Difference (-)	EXCEPT
Union (∪)	UNION
Cartesian Product (×)	CROSS JOIN

These operations demonstrate the relationship between theoretical relational algebra and practical SQL querying.

🛠️ Technologies
SQL Server
T-SQL
Relational Database Design
ERD
Database Schema
SQL
Relational Algebra
