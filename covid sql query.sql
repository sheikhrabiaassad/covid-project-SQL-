SELECT * 
FROM CovidDeaths
where continent is not null
SELECT *
FROM CovidVaccinations
where continent is not null



 covid deaths
SELECT location ,date,population,total_cases,new_cases,total_deaths
FROM CovidDeaths
where continent is not null
ORDER BY 1,2

--(A)
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases) *100 AS percent_death
FROM CovidDeaths
where location ='india' 
order by 2

--(B)
select  location,date,total_cases,population,(total_cases/population)*100 AS percent_population_affected
from CovidDeaths
where location= 'india'
order by 2

--(C)
select  location,population, max(total_cases) as highestinfectioncount,( max(total_cases)/population)*100 as percentpopulationaffected
from CovidDeaths
where continent is not null
group by location,population
order by 1 

--(D)
SELECT location, max( CAST(total_deaths as int))as deaths,population,(max(total_deaths)/population)*100 as deathpercentage
from CovidDeaths
where continent is not null
group by location,population
order by 2 desc

-- (E)
 select location ,max( cast(total_deaths as int)) as deathspercontinent
 from CovidDeaths
 where continent is null
 group by location

 
-- (F)

Select date, sum(new_cases) as total_cases,sum( Cast(new_deaths as int)) as total_deaths
from CovidDeaths
group by date
order by date

Covid Vaccination table joined with covid death table

--(G) joining tables 


select cd.location,cd.population,max (cast(cv.total_vaccinations as int)) as totalvaccination,(max(cast(cv.total_vaccinations as int))/cd.population)*100 as percentvaccinated
 FROM CovidDeaths as cd

JOIN CovidVaccinations as cv
ON cd.location=cv.location
and cd.date=cv.date
where cd.continent is not null
group by cd.location,cd.population 
order by 4 desc

-- creating view to store data for later visualization
create view  A as 
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases) *100 AS percent_death
FROM CovidDeaths
where location ='india' 

create view  B as 
select  location,date,total_cases,population,(total_cases/population)*100 AS percent_population_affected
from CovidDeaths
where location= 'india'

create view C as 
select  location,population, max(total_cases) as highestinfectioncount,( max(total_cases)/population)*100 as percentpopulationaffected
from CovidDeaths
where continent is not null
group by location,population

create view D as 
select  location,population, max(total_cases) as highestinfectioncount,( max(total_cases)/population)*100 as percentpopulationaffected
from CovidDeaths
where continent is not null
group by location,population

create view E as 
 select location ,max( cast(total_deaths as int)) as deathspercontinent
 from CovidDeaths
 where continent is null
 group by location

create view F as 

Select date, sum(new_cases) as total_cases,sum( Cast(new_deaths as int)) as total_deaths
from CovidDeaths
group by date

create View G as 
select cd.location,cd.population,max (cast(cv.total_vaccinations as int)) as totalvaccination,(max(cast(cv.total_vaccinations as int))/cd.population)*100 as percentvaccinated
 FROM CovidDeaths as cd

JOIN CovidVaccinations as cv
ON cd.location=cv.location
and cd.date=cv.date
where cd.continent is not null
group by cd.location,cd.population 
