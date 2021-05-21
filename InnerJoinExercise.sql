
--INNER	JOIN	Practice	Problems

/*1) Using	the	Person.Person	and	Person.Password	tables,	INNER	JOIN	the	two	tables	using	the	BusinessEntityID	column	and	
return	the	FirstName	and	LastName	columns	from	Person.Person	and	then	PasswordHash	column	from	Person.Password*/

	select 
	p.FirstName,
	p.LastName,
	pw.PasswordHash
	from Person.Person p
	inner join Person.Password pw
	on p.BusinessEntityID = pw.BusinessEntityID

/*2) Join	the	HumanResources.Employee	and	the	 HumanResources.EmployeeDepartmentHistory	tables	together	via	an	INNER	JOIN	
using	the	BusinessEntityID	column.		Return	the	BusinessEntityID, NationalIDNumber	and	JobTitle	columns	from	HumanResources.Employee	and	
the	DepartmentID,	StartDate,	and	EndDate	columns	from	HumanResources.EmployeeDepartmentHistory.		Notice	the	number	of	rows	
returned.		Why	is	the	row	count	what	it	is?*/

	select 
	he.BusinessEntityID,
	he.NationalIDNumber,
	he.JobTitle,
	hed.DepartmentID,
	hed.StartDate,
	hed.EndDate
	from HumanResources.Employee he
	inner join HumanResources.EmployeeDepartmentHistory hed
	on he.BusinessEntityID=hed.BusinessEntityID

/*3) Expand	upon	the	query	used	in	question	1.		Using	the	existing	query,	add	another	 INNER	JOIN	to	the	Person.EmailAddress	
table	and	include	the	EmailAddress	column	in	your	select	statement.*/

	select 
	p.FirstName,
	p.LastName,
	pw.PasswordHash,
	pe.EmailAddress
	from Person.Person p
	inner join Person.Password pw
	on p.BusinessEntityID = pw.BusinessEntityID
	inner join Person.EmailAddress pe
	on pw.BusinessEntityID=pe.BusinessEntityID

/*4) Using	the	Book,	BookAuthor	and	Author	tables,	join	them	together	so	that	you	return	the	Title	and	ISBN	columns	from	
Book	and	the	AuthorName	column	from	Author.		(Hint:	You	must	start	with	the	BookAuthor	table	in	your	FROM	clause	even	
though	we	will	not	be	returning	any	columns	from	this	table)*/

	SELECT
	B.Title,
	B.ISBN,
	A.AuthorName
	FROM BookAuthor BA
	INNER JOIN Book B
	ON B.BookID = BA.BookID
	INNER JOIN Author A
	ON A.AuthorID = BA.AuthorID

/*5) Using	the	query	from	example	4,	add	another	INNER	JOIN	that	joins	the	Publisher	
table	with	your	query.		Return	the	PublisherName	column	from	this	table.		So,	you	
should	return	the	Title	and	ISBN	columns	from	Book,	the	AuthorName	column	from	
Author,	and	the	PublisherName	column	from	Publisher.		(Hint:	this	will	require	
three	separate	INNER	JOINs).*/

	SELECT
	B.Title,
	B.ISBN,
	A.AuthorName,
	P.PublisherName
	FROM BookAuthor BA
	INNER JOIN Book B
	ON B.BookID = BA.BookID
	INNER JOIN Author A
	ON A.AuthorID = BA.AuthorID
	INNER JOIN Publisher P
	ON P.PublisherID = B.PublisherID
