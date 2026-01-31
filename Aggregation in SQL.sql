USE `world`;
-- Question 1 : Count how many cities are there in each country?
SELECT countrycode,COUNT(name) FROM city
GROUP BY countrycode;


-- Question 2: Display all continents having more than 30 countries.
SELECT continent,COUNT(name) FROM country
GROUP BY continent
HAVING COUNT(name)>30;

-- Question 3 : List regions whose total population exceeds 200 million.
SELECT region, SUM(population)
FROM country
GROUP BY region
HAVING SUM(population)>200000000;

-- Question 4 : Find the top 5 continents by average GNP per country.
SELECT continent, AVG(GNP)
FROM country
GROUP BY continent
ORDER BY AVG(GNP) DESC
LIMIT 5;

-- Question 5 : Find the total number of official languages spoken in each continent
SELECT Continent,COUNT(countrylanguage.Language)
FROM country LEFT JOIN countrylanguage 
ON country.code=countrylanguage.CountryCode
WHERE Isofficial = 'T'
GROUP BY continent;

-- Question 6 : Find the maximum and minimum GNP for each continent.
SELECT Continent, MAX(GNP), MIN(GNP)
FROM country
GROUP BY Continent;

-- Question 7 : Find the country with the highest average city population.
SELECT country.name,AVG(city.population)
FROM country INNER JOIN city
ON country.code=city.countrycode
GROUP BY country.name
ORDER BY AVG(city.population) DESC
LIMIT 1;

-- Question 8 : List continents where the average city population is greater than 200,000
SELECT country.continent,AVG(city.population)
FROM country INNER JOIN city
ON country.code=city.countrycode
GROUP BY continent
HAVING AVG(city.population)>200000;

-- Question 9 : Find the total population and average life expectancy for each continent, ordered by average life
-- expectancy descending.
SELECT continent,SUM(population),AVG(LifeExpectancy)
FROM country
GROUP BY continent
ORDER BY AVG(LifeExpectancy) DESC;

-- Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where
-- the total population is over 200 million.
SELECT continent,SUM(population),AVG(LifeExpectancy)
FROM country
GROUP BY continent
HAVING SUM(population)>200000000
ORDER BY AVG(LifeExpectancy) DESC
LIMIT 3;









