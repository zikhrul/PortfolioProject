/*
Queries used for Tableau Project
*/



-- 1. For Tableau Table 1

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..['owid-covid-data$']
order by 1,2


-- 2. For Tableau Table 2

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select continent, SUM(cast(new_deaths as bigint)) as TotalDeathCount
From PortfolioProject..['owid-covid-data$']
Where continent is not null 
Group by continent
order by TotalDeathCount desc


-- 3. For Tableau Table 3

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..['owid-covid-data$']
Group by Location, Population
order by PercentPopulationInfected desc


-- 4. For Tableau Table 4


Select continent, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..['owid-covid-data$']
Where continent is not null 
Group by continent, Population, date
order by PercentPopulationInfected desc