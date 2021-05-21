--CASE Statements Lab Problems

/*1) Return the FirstName and LastName column from Person.Person. Return a third column 
that outputs �Promotion 1� if the EmailPromotion column value is 0, �Promotion 2� if the 
EmailPromotion value is 1, and �Promotion 3� if the column value is 2.*/

select 
	FirstName,
	LastName,
	case
		when EmailPromotion = 0 then 'Promotion 1'
		when EmailPromotion = 1 then 'Promotion 2'
		when EmailPromotion = 2 then 'Promotion 3'
	end as PromotionName
from Person.Person


/*2) In a CASE statement you define conditional expressions based on column values. What 
happens if a value does not meet any of the conditions expressed in the CASE statement?*/

	--If the value does not meet the any of the conditions expressed in the case statement then 'Null' value is returned.

/*3) Using the Person.Person table, complete a CASE statement that returns the string �Long 
Name� if the FirstName column is at least ten characters long. If the FirstName column is 
less than ten characters, return the string �Short Name�.*/

	select
	FirstName,
	case
		when len(FirstName)>=10 then 'Long name'
		else 'Short Name'
	end
	from Person.Person

/*4) Find out how many sales in Sales.SalesOrderHeader fell into the following ranges: �$0 to 
$149.99�, �$150 � 499.99�, �$500 to $4,999.99�, �$5,000 - $24,999.99�, and �Over 
$25,000�. Only analyze sales that had a sales person associated with them.*/
WITH SalesRanges
AS (
SELECT
CASE
WHEN TotalDue BETWEEN 0 AND 149.99 THEN '$0 to $149.99'
WHEN TotalDue BETWEEN 150 AND 499.99 THEN '$150 to $499.99'
WHEN TotalDue BETWEEN 500 AND 4999.99 THEN '$500 to $4,999.99'
WHEN TotalDue BETWEEN 5000 AND 24999.99 THEN '$5,000 to $24,999.99'
ELSE 'Over $25,000'
END AS SalesPriceRange,
SalesOrderID
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
)

SELECT
SalesPriceRange,
COUNT(*)
FROM SalesRanges
GROUP BY SalesPriceRange


/*5) Using the Production.Product table, if the value in Color column is NULL then return the string 
�No Color�. If a color exists, then return that color. Complete this request two ways: once with 
a CASE statement, and the second with a function we have previously discussed in this guide.*/

	select
	Color,
	case
	when Color is null then 'No color'
	else Color
	end as Color
	from Production.Product



	select
	color,
	coalesce(Color,'no color')
	from Production.Product