
Select *
From PortfolioProject.dbo.CovidDeaths
where continent is not null
order by 3,4

Select *
From PortfolioProject.dbo.CovidVaccinations
order by 3,4

--Select data that we will use
	
SELECT location,date,total_cases,new_cases,total_deaths,population
From PortfolioProject.dbo.CovidDeaths
where continent is not null
order by 1,2

--total cases vs total deaths
	
SELECT location,date,total_cases,total_deaths,( total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject.dbo.CovidDeaths
Where location like '%afg%'
order by 1,2

--percentage of population infected
	
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
