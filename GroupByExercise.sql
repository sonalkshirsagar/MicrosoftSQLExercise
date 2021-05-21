

--GROUP	BY	Clause	Practice	Problems

--1) In	the	Person.Person	table,	how	many	people	are	associated	with	each	PersonType?

	select 
	PersonType,
	count(*) as PersonCount
	from Person.Person
	group by PersonType


--2) Using	only	one	query,	find	out	how	many	products	in	Production.Product	are	the	color	“red”	and	how	many	are	“black”.

	select 
	Color,
	count(*) as ProductCount
	from Production.Product
	where Color in('red','black')
	group by Color

	
/*3) Using	Sales.SalesOrderHeader,	how	many sales occurred	in	each territory	between	July 1,	2005 and December 31, 2006?Order the results 
by	the	sale	count	in	descending	order.*/

	select 
	TerritoryID,
	count (*) as SalesCount
	from Sales.SalesOrderHeader
	where OrderDate 
	BETWEEN '7/1/2005' AND '12/31/2006'
	GROUP BY TerritoryID
	
	
/*4) Expanding	on	the	previous	example,	group	the	results	not	by	the	TerritoryID	but	by	the	name	of	the	territory	
(found	in	the	Sales.SalesTerritory	table).*/

	select 
	st.Name,
	count (*) as SalesCount
	from Sales.SalesOrderHeader s
	left outer join Sales.SalesTerritory st
	on s.TerritoryID = st.TerritoryID
	where OrderDate 
	BETWEEN '7/1/2005' AND '12/31/2006'
	GROUP BY st.Name 

	
--5) Using	the	Book,	BookAuthor,	Author	and/or	Publisher	tables,	identify	how	many	books	each	author	either	wrote	or	co-authored

	SELECT
	A.AuthorName,
	COUNT(*) AS BookCount
	FROM BookAuthor BA
	INNER JOIN Author A
	ON A.AuthorID = BA.AuthorID
	GROUP BY A.AuthorNam


