
--Sorting using	the	ORDER	BY	Clause Practice	Problems

/*1) From	the	HumanResources.vEmployeeDepartment	view,	return	the	FirstName,	LastName	and	JobTitle	columns.		
Sort	the	results	by	the	FirstName	column	in	ascending	order.*/

	SELECT FirstName,LastName,JobTitle
	from HumanResources.vEmployeeDepartment
	order by FirstName asc


/*2) Modify	the	query	from	question	1	to	sort	the	results	by	the	FirstName	column	in	
ascending	order	and	then	by	the	LastName	column	in	descending	order.*/

	SELECT 
	FirstName,
	LastName,
	JobTitle
	from HumanResources.vEmployeeDepartment
	order by FirstName asc , LastName desc

/*3) From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	CountryRegionName	columns.		
Sort	the	results	by	the	CountryRegionName	column.		Use	the	column	ordinal	in	the	ORDER	BY	clause.*/

	select
	FirstName,
	LastName,
	CountryRegionName
	from Sales.vIndividualCustomer
	order by 3

/*4) From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
CountryRegionName	columns	for	those	rows	with a	CountryRegionName	that	is	either	“United	States”	or	“France”.		
Sort	the	results	by	the	CountryRegionName	column	in	ascending	order.	*/
	
	select 
	FirstName,
	LastName,
	CountryRegionName
	from Sales.vIndividualCustomer
	where CountryRegionName in ('United	States' , 'France')
	order by 3

/*5) From	the	Sales.vStoreWithDemographics	view,	return	the	Name,	AnnualSales,	
YearOpened,	SquareFeet,	and	NumberEmployees	columns.		Give	the	SquareFeet	
column	the	alias	“Store	Size”	and	the	NumberEmployees	column	the	alias	“Total	
Employees”.		Return	only	those	rows	with	AnnualSales	greater	than	1,000,000	and	
with	NumberEmployees	greater	than	or	equal	to	45.		Order	your	results by	the	
“Store	Size”	alias	in	descending	order	and	then	by	the	“Total	Employees”	alias	in	
descending	order.*/

	select 
	Name,
	AnnualSales,
	YearOpened,
	SquareFeet as "Store Size",
	NumberEmployees as "Total Employees"
	from Sales.vStoreWithDemographics
	where AnnualSales>1000000 
	and NumberEmployees>=45
	order by 4 desc ,5 desc
