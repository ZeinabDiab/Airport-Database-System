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
