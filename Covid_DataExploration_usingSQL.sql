--SELECT JobTitle,AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics
--Left Outer Join SQLTutorial.dbo.EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle = 'Salesman'
--GROUP BY JobTitle

--SELECT EmployeeID,FirstName,Age
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION ALL
--SELECT EmployeeID,JobTitle,Salary
--FROM SQLTutorial.dbo.EmployeeSalary
--ORDER BY EmployeeID

--SELECT FirstName, LastName,JobTitle,Salary,
--CASE
--	WHEN JobTitle='Salesman' THEN Salary + (Salary * .10)
--	WHEN JobTitle='Accountant' THEN Salary + (Salary * .05)
--	WHEN JobTitle='HR' THEN Salary + (Salary * .00001)
--	ELSE Salary + (Salary * 0.03)
--END AS SalaryAfterRaise
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT JobTitle,AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary)

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics

--UPDATE SQLTutorial.dbo.EmployeeDemographics
--SET Age = 31,Gender='Female'
--WHERE FirstName='Holly' AND LastName='Flax'

--DELETE FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE EmployeeID = 1005

--SELECT FirstName + ' ' + LastName AS FullName
--FROM SQLTutorial.dbo.EmployeeDemographics

--SELECT Demo.EmployeeID,Demo.FirstName,Demo.FirstName, Sal.JobTitle,Ware.age
--FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
--LEFT JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
--	ON Demo.EmployeeID = Sal.EmployeeID
--LEFT JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics AS Ware
--	ON Demo.EmployeeID = Ware.EmployeeID

--SELECT FirstName,LastName,Gender,Salary,COUNT(Gender) OVER(PARTITION BY GENDER) AS TotalGender
--FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
--JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
--ON Demo.EmployeeID = Sal.EmployeeID

--WITH CTE_Employee AS (
--SELECT FirstName,LastName,Gender,Salary
--,COUNT(Gender) OVER(PARTITION BY GENDER) AS TotalGender
--,AVG(Salary) OVER(PARTITION BY Gender) AS AvgSalary
--FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
--JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
--	ON Demo.EmployeeID = Sal.EmployeeID
--WHERE Salary > '45000'
--)
--Select FirstName, AvgSalary
--FROM CTE_Employee

--CREATE TABLE #temp_Employee (
--EmployeeID int,
--JobTitle varchar(100),
--Salary int
--)
--SELECT *
--FROM #temp_Employee

--INSERT INTO #temp_Employee VALUES (
--'1001', 'HR', '45000'
--)
--INSERT INTO #temp_Employee
--SELECT *
--FROM SQLTutorial.dbo.EmployeeSalary


--CREATE TABLE #temp_Employee2 (
--JobTitle varchar(50),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int
--)

--INSERT INTO #temp_Employee2
--SELECT JobTitle,COUNT(JobTitle),AVG(Age),AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics AS emp
--JOIN SQLTutorial.dbo.EmployeeSalary as sal
--	ON emp.EmployeeID = sal.EmployeeID
--GROUP BY JobTitle

--SELECT *
--FROM #temp_Employee2

--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

--Select *
--From EmployeeErrors

--SELECT EmployeeID,RTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors


--SELECT LastName,REPLACE(LastName,'- Fired','') AS LastNameFixed
--FROM EmployeeErrors

--SELECT SUBSTRING(err.FirstName,1,3),SUBSTRING(dem.FirstName,1,3)
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

--SELECT FirstName,LOWER(FirstName)
--FROM EmployeeErrors

--CREATE PROCEDURE TEST
--AS
--SELECT *
--FROM EmployeeDemographics

--EXEC TEST

--CREATE PROCEDURE Temp_Employee
--AS
--DROP TABLE IF EXISTS #temp_employee
--Create table #temp_employee (
--JobTitle varchar(100),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)

--Insert into #temp_employee
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics AS emp
--JOIN SQLTutorial.dbo.EmployeeSalary AS sal
--	ON emp.EmployeeID = sal.EmployeeID
--group by JobTitle

--Select * 

--SELECT EmployeeID,Salary, (SELECT AVG(Salary) From EmployeeSalary)
--From EmployeeSalary

--SELECT EmployeeID,Salary, AVG(Salary) over() as AllAvgSalary
--From EmployeeSalary

--SELECT EmployeeID,Salary, AVG(Salary) as AllAvgSalary
--From EmployeeSalary
--GROUP BY EmployeeID,Salary
--ORDER BY 1,2

--Select a.EmployeeID, AllAvgSalary
--from (SELECT EmployeeID,Salary, AVG(Salary) over() as AllAvgSalary
--From EmployeeSalary) as a

--SELECT EmployeeID,JobTitle,Salary
--from EmployeeSalary
--where EmployeeID in (
--	Select EmployeeID 
--	from EmployeeDemographics
--	WHERE Age>30)

--EXEC master.sys.sp_MSset_oledb_prop;

Select *
From PortfolioProject.dbo.CovidDeaths
where continent is not null
order by 3,4

Select *
From PortfolioProject.dbo.CovidVaccinations
order by 3,4

SELECT location,date,total_cases,new_cases,total_deaths,population
From PortfolioProject.dbo.CovidDeaths
order by 1,2

SELECT location,date,total_cases,total_deaths,( total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject.dbo.CovidDeaths
Where location like '%afg%'
order by 1,2

SELECT location,date,population,total_cases, (total_cases/population)*100 as PercentPopulationInfected
From PortfolioProject.dbo.CovidDeaths
--Where location like '%afg%'
Order by 1,2

SELECT location,population,MAX(total_cases) as HighestInfectedCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject.dbo.CovidDeaths
group by location,population
Order by PercentPopulationInfected desc

SELECT continent,MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject.dbo.CovidDeaths
where continent is not null
group by continent
Order by TotalDeathCount desc

Select SUM(new_cases) as total_cases,SUM(cast(new_deaths as int)) as total_deaths,
SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject.dbo.CovidDeaths
where continent is not null
--group by date
order by 1,2

--cast/convert

With PopvsVac (Continent,Location,Date,Population,New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(int, vac.new_vaccinations )) OVER (Partition by dea.location order by dea.location,
dea.Date) as RollingPeopleVaccinated
From PortfolioProject.dbo.CovidDeaths as dea
Join PortfolioProject.dbo.CovidVaccinations as vac
	ON dea.location = vac.location
	AND dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac

DROP TABLE IF EXISTS #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(int, vac.new_vaccinations )) OVER (Partition by dea.location order by dea.location,
dea.Date) as RollingPeopleVaccinated
From PortfolioProject.dbo.CovidDeaths as dea
Join PortfolioProject.dbo.CovidVaccinations as vac
	ON dea.location = vac.location
	AND dea.date = vac.date
--where dea.continent is not null

Select *, (RollingPeopleVaccinated/Population)*100
FROM #PercentPopulationVaccinated

CREATE VIEW PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(int, vac.new_vaccinations )) OVER (Partition by dea.location order by dea.location,
dea.Date) as RollingPeopleVaccinated
From PortfolioProject.dbo.CovidDeaths as dea
Join PortfolioProject.dbo.CovidVaccinations as vac
	ON dea.location = vac.location
	AND dea.date = vac.date
where dea.continent is not null

Select *
from PercentPopulationVaccinated