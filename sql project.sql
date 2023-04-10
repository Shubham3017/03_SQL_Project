#1.Write a SQL query to retrieve the first 5 rows from the "customers" table
use pro;
select *
from customers
limit 5;


#2. Write a SQL query to retrieve the unique city names from "customers" table sorted in descending order.
select distinct city 
from customers
order by city desc;


#3. Write a SQL query to get the number of unique city names "offices" table.
select count(distinct city) as Total_no_of_City 
from offices;


#4. Write a SQL query to get the maximum, minimum and average value from the "CreditLimit" column in the "customers" table.
SELECT MAX(CreditLimit) AS MaxCreditLimit, 
       MIN(CreditLimit) AS MinCreditLimit, 
       AVG(CreditLimit) AS AvgCreditLimit
FROM customers;


#5. Write a SQL query to get the city names which are present in “offices” table but not in “customer” table.
SELECT DISTINCT city 
FROM offices 
WHERE city NOT IN (SELECT DISTINCT city FROM customers);


#6. Write a SQL query to get the city names which are present in “offices” table as well as in “customer” table.
SELECT DISTINCT city 
FROM offices 
WHERE city IN (SELECT DISTINCT city FROM customers);


#7. Write a SQL query to get records where city or state is not given in “customer” table and creditlimit is in the range – 80000 to 130000.
SELECT * 
FROM customers 
WHERE (city IS NULL OR state IS NULL) 
AND creditlimit BETWEEN 80000 AND 130000;


#8. Write a SQL query to get the maximum number of orders placed on a particular date and what is that date in orders table.
select orderdate,count(orderdate)
from orders
group by orderdate
order by count(orderdate) desc
limit 2;


#9. For the records which we get in previous question(Q8), write a SQL query to get the customer names and their phone numbers.
SELECT c.customerName, c.phone
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.orderDate = (SELECT orderDate 
FROM orders
GROUP BY orderDate 
ORDER BY COUNT(*) DESC 
LIMIT 1);
 
 #10. SQL query to get the customer phone number and customer name from customers table where order is either cancelled or disputed in orders table.
select customers.customername,customers.phone
from customers
left join orders
on orders.customernumber=customers.customernumber
where orders.status in ('cancelled','disputed');


#11. Write a SQL query to get the top 4 highest selling products from orderdetails table.
SELECT productcode, SUM(quantityordered) as total_quantity
FROM orderdetails
GROUP BY productcode
ORDER BY total_quantity DESC
limit 5;

#12. Write a SQL query to get the count of orders placed by each customer in 2003 and 2004.
SELECT customers.customername,customers.customernumber,
YEAR(orders.orderdate) AS year_,
COUNT(orders.orderdate) AS order_count
FROM orders 
RIGHT JOIN customers ON orders.customernumber = customers.customernumber 
WHERE YEAR(orders.orderdate) IN (2003, 2004) 
GROUP BY customers.customername ,YEAR(orders.orderdate),customers.customernumber;


#13. Write a SQL query to get the city names from customer table where more than 4 customers reside.
SELECT city,count(city)
FROM customers
GROUP BY city
having count(city)>4;

 