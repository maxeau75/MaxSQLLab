-- 2.1 SELECT: 
 -- Selcte all the columns of all the records in the employee table
SELECT * FROM Employee;
--Select all the columns of all the records in the employee table and filter the records with the WHERE statement to specify one condition
SELECT * FROM Employee WHERE Lastname = 'King';
/*Select all the columns of all the records in the employee table and filter the records with the WHERE statement to specify a double condition 
by using the AND operator*/
SELECT * FROM Employee WHERE Firstname = 'Andrew' AND REPORTSTO IS NULL;


--2.2 ORDER BY:
--This statement select all albums from "Album" table sorted DESCENDING by Title column
SELECT * FROM Album ORDER BY Title DESC;
-- This statement select all firstnames from "Customer" table sorted ASCENDING by City
SELECT Firstname FROM Customer ORDER BY City ASC;

--2.3 INSERT INTO:
-- This statement insert two new records in "Genre" table
INSERT INTO Genre(GenreID, Jazz) VALUES (1, Jazz );
-- The following statement insert two new records in "Employee" table
INSERT INTO Employee(EmployeeID, PostalCode) VALUES(8, 33351 );
--The following staement insert two new records in "Customer" table
INSERT INTO Customer(Firstname, email) VALUES(Max, max@revature.com)

--2.4 UPDATE
--This statement Update Aaron Mitchell in Customer table to Robert Walter
UPDATE Customer
SET Firstname=Robert, Lastname=Walter
WHERE Firstname=Aaron AND Lastname=Mitchell;
-- Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
UPDATE Artist
SET Name='CCR'
WHERE Name='Creedence Clearwater Revival';


--2.5 LIKE:
--Select all invoices with a billing address like “T%”
SELECT* FROM invoice WHERE billing address LIKE 'T%';


--2.6 BETWEEN: 
--Select all invoices that have a total between 15 and 50Task
SELECT * FROM invoice WHERE total>15 AND total < 50;
--Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * FROM Employee WHERE hire date > '01-JUN-03' AND hire date < '01-MAR-04'>;


--2.7 DELETE:
--Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them)
DELETE FROM Customer WHERE Firstname= 'Robert' AND Lstname='Walter';



--3.1 SQL Functions:
-- Create a function that returns the current time
CREATE FUNCTION CURR_TIME(TIMEOFTODAY)
		returns text AS
		begin
		returns TIMEOFTODAY;
END;		
			

-- Create a function that returns the length of a mediatype from the mediatype table
CREATE FUNCTION mediatype_length(req_id IN Number)
	RETURNS NUMBER 
	AS 
	BEGIN
		returns req_id;
end MEDIATYPE_LENGTH;		
		
	
 --3.2  Create a function that returns the average total of all invoices
CREATE FUNCTION  average_Total_Invoices()
	RETURN number AS AVEARGE NUMBER;
	BEGIN
		returns AVERAGE(TOTAL)into AVERAGE from INVOICE;
	end aVERAGE_TOTAL_INVOICES;

-- Create a function that returns the most expensive track
CREATE FUNCTION mostExpensiveTrack()
RETURNS text AS 
BEGIN
	RETURN mostExpensiveTrack() where unitprice = (select max(unitprice) from track));
 end;	
end MOST_EXPENESIVE;



 -- 3.3 Create a function that returns the average price of invoiceline items in the invoiceline table
CREATE FUNCTION averageInvoicePrice()
returns float as
begin
	return (select avg(unitprice) from invoiceline);
 end averageInvoicePrice();





-- 3.4 Create a function that returns all employees who are born after 1968
	create function  EMPLOYE_BORN_AFTER_1968
		return EMPLOYEE_SET
			as
			BEGIN
			return year from e.BIRTHDAY)> 1968;
end EMPLOYEE_BORN_AFTER_1968;
	
 	

-- 4.1  – Create a stored procedure that selects the first and last names of all the employees.
	CREATE procedure FIRST_AND_LAST()
		 select FIRSTNAME, LASTNAME from EMPLOYEE;
		 RETURN(FNAME, LNAME) AS
begin
end FIRST_AND_LAST;


--4.2  Create a stored procedure that updates the personal information of an employee.
CREATE OR REPLACE PROCEDURE UPDATE_EMPLOYEE 
(
  NEW_LASTNAME IN VARCHAR2,
  NEW_FIRSTNAME IN VARCHAR2,
AS 
BEGIN
  UPDATE EMPLOYEE
  SET LASTNAME = 
        CASE NEW_LASTNAME 
        WHEN NULL THEN 
          LASTNAME
        ELSE NEW_LASTNAME
        END,
      FIRSTNAME =
        CASE NEW_FIRSTNAME 
        WHEN NULL THEN 
          FIRSTNAME
        ELSE NEW_FIRSTNAME
END UPDATE_EMPLOYEE;
	
-- Create a stored procedure that returns the managers of an employee.
create or replace PROCEDURE MANAGER_OF_EMPLOYEE 
  THE_EMPLOYEEID IN NUMBER
AS 
  TEMP VARCHAR2(20);
  TEMP2 VARCHAR2(20);
  TEMP3 VARCHAR2(20);
  TEMP4 VARCHAR2(20);
BEGIN
  SELECT MGR.FIRSTNAME, MGR.LASTNAME, EMP.FIRSTNAME, EMP.LASTNAME INTO TEMP, TEMP2, TEMP3, TEMP4
  FROM EMPLOYEE EMP
  LEFT OUTER JOIN EMPLOYEE MGR 
  ON EMP.EMPLOYEEID = MGR.REPORTSTO
  WHERE EMP.EMPLOYEEID = THE_EMPLOYEEID AND EMP.REPORTSTO = MGR.EMPLOYEEID;
END MANAGER_OF_EMPLOYEE;




-- 4.3 Create a stored procedure that returns the name and company of a customer
CREATE procedure COMPANY_NAME
returns table (customer_fname varchar, customer_lname varchar, customer_company varchar)
as
begin
	return query (select firstname, lastname, company from customer);
end;



--5.0 Create a transaction that given a invoiceId will delete that invoice (There maybe constraints that rely on this, find out how to resolve them)
create or REPLECE procedure delete INVOICE
	(RED_ID in INVOOICE.INVOICE%TYPE) is
begin
	delete from INVOICELINE where INVOICED = RED_ID;
	delete from INVOICE where INVOICED = REQ_ID;
	COMMI;
end delete_INVOICE;

-- Create a transaction nested within a stored procedure that inserts a new record in the Customer table

create or replace procedure insert =_CUSTOMER
	(NEW_CUSTOMER in CUSTOMER%ROWTYPE) is
begin
	insert into CUSTOMER values NEW_CUSTOMER;
	commit;
end INSERT_CUSTOMER;



--6.1 Create an after insert trigger on the employee table fired after a new record isinserted into the table
create trigger employee_insert
    after insert on employee
    for each row
    execute procedure example_function();
end

--  Create an after update trigger on the album table that fires after a row is inserted in the table
create TRIGGER album_update
AFTER UPDATE
   ON Album
    FOR EACH ROW 
DECLARE
   username varcahr2(10);
BEGIN
   select user into username
	insert into Album(order-id, username) values(5, user)
end;
--Create an after delete trigger on the customer table that fires after a row is deleted from the table.

CREATE TRIGGER customer_Delete
AFTER DELETE
   ON Customer
   FOR EACH ROW
DECLARE
   username varchar2(10);
BEGIN
select user into username
END;



-- 7.1 Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId
SELECT Orders.OrderID, Customers.CustomerName, orders.InvoiceID
FROM Orders
INNER JOIN invoice ON Customer.CustomerID = invoice.CustomerID;

-- Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total
SELECT Customer.Customerid, firstname, lastname, invoiceid, 
FROM customer
full outer JOIN invoice ON Customer.Customerid = invoice.Customerid;

--  Create a right join that joins album and artist specifying artist name and title
SELECT ALBUM.TITLE, ARTIST.NAME
FROM ARTIST
RIGHT OUTER JOIN ALBUM
ON ALBUM.ARTISTID = ARTIST.ARTISTID;

-- Create a cross join that joins album and artist and sorts by artist name in ascending order
SELECT *
FROM ALBUM
    CROSS JOIN ARTIST
ORDER BY ARTIST.NAME ASC;

--  Perform a self-join on the employee table, joining on the reportsto column
SELECT FIRST.EMPLOYEEID, FIRST.LASTNAME || FIRST.FIRSTNAME AS Name, SECOND.REPORTSTO
FROM EMPLOYEE FIRST, EMPLOYEE SECOND
WHERE FIRST.EMPLOYEEID = SECOND.REPORTSTO; 