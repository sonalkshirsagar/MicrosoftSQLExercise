-- HAVING	Clause Practice	Problems
/*1) Find	the	total	sales	by	territory	for	all	rows	in	the	Sales.SalesOrderHeader	table.		
Return	only	those	territories	that	have	exceeded	$10	million	in	historical	sales.		
Return	the	total	sales	and	the	TerritoryID	column.*/

	SELECT
	TerritoryID,
	SUM(TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader
	GROUP BY TerritoryID
	HAVING SUM(TotalDue) > 10000000

/*2) Using	the	query	from	the	previous	question,	join	to	the	Sales.SalesTerritory	table	
and	replace	the	TerritoryID	column	with	the	territory’s	name.*/

	SELECT
	st.Name as TerritoryName,
	SUM(TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader soh
	left outer join Sales.SalesTerritory st
	on soh.TerritoryID = st.TerritoryID
	GROUP BY st.Name
	HAVING SUM(TotalDue) > 10000000


/*3) Using	the	Production.Product	table,	find	how	many	products	are	associated	with	
each	color.		Ignore	all	rows	where	the	color	has	a	NULL	value.		Once	grouped,	return	
to	the	results	only	those	colors	that	had	at	least	20	products	with	that color.*/

	select
	Color,
	count (*) as ProductCount
	from Production.Product
	where Color is not null
	group by Color
	having count(*) >= 20


/*4) Starting	with	the	Sales.SalesOrderHeader	table,	join	to	the	Sales.SalesOrderDetail	table. This	table	contains	the	line item	
details	associated	with	each	sale. From	Sales.SalesOrderDetail,	join	to	the	Production.Product	table. Return	the	Name column	from	
Production.Product	and	assign	it	the	column	alias	“Product	Name”. For	each	product, find out	how	many	of	each	product	was	ordered	
for	all	orders	that	occurred	in	2006.		Only	output	those	products	where	at	least	200	were	ordered.*/

	select
	p.Name AS [Product	Name],
	SUM(SOD.OrderQty) AS ProductOrderCount
	from Sales.SalesOrderHeader soh
	inner join Sales.SalesOrderDetail sod
	on soh.SalesOrderID = sod.SalesOrderID
	inner join Production.Product p
	on p.ProductID = sod.ProductID
	WHERE SOH.OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
	GROUP BY P.Name
	HAVING SUM(SOD.OrderQty) >= 200

/*5) Find	the	first	and	last	name	of	each	customer	who	has	placed	at	least	6	orders	
between	July	1,	2005	and	December	31,	2006.		Order	your	results	by	the	number	of	
orders	placed	in	descending	order.		(Hint:	You	will	need	to	join	to	three	tables	–
Sales.SalesOrderHeader,	Sales.Customer,	and	Person.Person.		You	will	use	every	
clause	to	complete	this	query).*/

	select
	p.FirstName,
	p.LastName,
	COUNT(*) AS OrdersPlaced
	from Sales.SalesOrderHeader soh
	inner join Sales.Customer c
	on c.CustomerID = soh.CustomerID
	inner join Person.Person p
	on p.BusinessEntityID= c.PersonID
	where OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
	GROUP BY p.FirstName, p.LastName
	HAVING COUNT(*) >= 6

