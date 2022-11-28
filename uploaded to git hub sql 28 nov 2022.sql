/*    Q1. Write a query to fetch the contactFirstName from the customers table in upper case and use the ALIAS name as EmpName. */
SELECT UPPER(contactFirstName) AS EmpName FROM customers;

/*    Q2. Write a query to fetch the number of employees working in the department ‘HR’. */
SELECT COUNT(*) FROM customers WHERE country = 'USA';

 /*   Q3. Write a query to get the current date. You can write a query as follows in any SQL platform: */
SELECT NOW();

/*    Q4. Write a query to retrieve the first four characters of contactLastName from the customers table. */
SELECT SUBSTRING(contactLastName, 1, 4) FROM customers;

/*    Q5. Write a query to fetch only the place name(string before brackets) from the phone column of customers table. */
/* Using the MID function in MySQL */
SELECT MID(phone,0,2) FROM customers;
/* Using SUBSTRING */
SELECT SUBSTRING(phone, 1, CHARINDEX('(',phone)) FROM customers;

/*    Q6. Write a query to create a new table which consists of data and structure copied from the other table. */
/* Using the SELECT INTO command: */
SELECT * INTO NewTable FROM customers WHERE 1 = 0;
/* Using the CREATE command in MySQL: */
CREATE TABLE NewTable AS SELECT * FROM customers;

 /*   Q7. Write q query to find all the employees whose amount is between 50000 to 100000. */
SELECT * FROM payments WHERE amount BETWEEN '5000' AND '10000';

/*    Q8. Write a query to find the names of employees that begin with ‘S’ */
SELECT * FROM customers WHERE contactFirstName LIKE 'S%';

  /*  Q9. Write a query to fetch top N records. */
/* By using the LIMIT command in MySQL:*/
SELECT * FROM payments ORDER BY amount DESC LIMIT 10;

/*    Q10. Write a query to retrieve the contactFirstName and contactLastName in a single column as “FullName”. The first name and the last name must be separated with space.*/
SELECT CONCAT(contactFirstName, ' ', contactLastName) AS 'FullName' FROM customers;

 /*   Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender */
SELECT COUNT(*), customerNumber FROM payments WHERE paymentDate BETWEEN '2005-05-20' AND '2005-06-10'

/*    Q12. Write a query to fetch all the records from the customers table ordered by contactLastName in descending order and Department in the ascending order. To order the records in ascending and descnding order, you have to use the ORDER
BY statement in SQL. */;
SELECT * FROM customers ORDER BY contactFirstName desc, country asc;

/*    Q13. Write a query to fetch details of employees whose contactLastName ends with an alphabet ‘A’ and contains five alphabets. To fetch details mathcing a certain value, you have to use the LIKE operator in SQL. */
SELECT * FROM customers WHERE contactLastName LIKE '____n';

/*    Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the customers table.*/
SELECT * FROM customers WHERE contactFirstName NOT IN ('Alexander','Daniel');

/*    Q15. Write a query to fetch details of employees with the phone as “DELHI(DEL)”. */
SELECT * FROM customers WHERE phone LIKE '%555';
/*    Q16. Write a query to fetch all employees who also hold the managerial position. */
SELECT E.contactFirstName, E.contactLastName, P.checkNumber
FROM customers E INNER JOIN payments P ON
E.customerNumber = P.customerNumber AND P.checkNumber LIKE ('%HQ%');

/*    Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order. */
SELECT country, count(customerNumber) AS countByCountry
FROM customers GROUP BY country
ORDER BY countByCountry ASC;

/*    Q18. Write a query to calculate the even and odd records from a table. To retrieve the even records from a table, you have to use the MOD() function as
follows:*/
SELECT customerNumber FROM (SELECT row_number() over (order by customerNumber)) WHERE MOD(rowno,2)=0;

/*    Similarly, to retrieve the odd records from a table, you can write a query as follows: */
SELECT customerNumber FROM (SELECT row_number, customerNumber from customers) WHERE MOD(row_number,2)=1;

/*    Q19. Write a SQL query to retrieve employee details from customers table who have a date of joining in the
payments table.*/
SELECT * FROM customers E
WHERE EXISTS
(SELECT * FROM payments P WHERE E.customerNumber = P.customerNumber);

/* Q20. Write a query to retrieve two 
minimum and maximum salaries from the payments table. 
To retrieve two minimum salaries, you can write a query as below:*/
SELECT DISTINCT amount FROM payments E1 
WHERE 2 >= (SELECT COUNT(DISTINCT amount)
FROM payments E2 WHERE E1.amount >= E2.amount) 
ORDER BY E1.amount DESC;
