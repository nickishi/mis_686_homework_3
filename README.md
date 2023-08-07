# mis_686_homework_3
This is an assignment for MIS 686 Spring 2021 at SDSU.

The purpose of this assignement was to create a series of tables in SQL, all of which would be all relational tables.

The tables and the data contained in each is listed below with the tables in alphabetical order, example table below:

Ex:

1. Table 1
   a. column 1
     - Datapoint 1
     - Datapoint 2
   b. column 2
     - Datapoint 1
     - Datapoint 2

If a datpoint is a repeating value, then the daatpoint will only appear once.
If a column is a Primary Key, then they will be marked with (PK).
If a column is a Foriegn Key, then they will be marked with (FK).

The SQL code that was written to create the table will appear before the table itself.
So on and so forth..


Table 1: Airplanes
CREATE TABLE `airplanes` (
  `tail_number` int(11) NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `model_number` varchar(100) NOT NULL,
  `seat_count` int(11) DEFAULT NULL
) 

1. Airplanes:
  a. tail_number (PK)
    - 321
    - 322
    - 324
    - 325
  b. manufacturer
    - AA
    - BB
  c. model_number
    - 3441
    - 3442
  d. seat_count
    - 100
  
  
  
  
  
    

