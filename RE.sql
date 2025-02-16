USE final_project;

-- total number of countries
SELECT COUNT(DISTINCT country) AS total_countries
FROM country_df;

-- types of technology
SELECT DISTINCT technology
FROM country_df;

SELECT DISTINCT technology
FROM region_df;

-- overview of the full tables
SELECT*
FROM region_df
LIMIT 10;

SELECT*
FROM country_df
LIMIT 10;

-- total annual investment by continent, filtered by year
SELECT continent, SUM(`public_investments_(2021_million_usd)`) AS total_annual_investment
FROM country_df
WHERE year = 2022  -- adjust accordingly
GROUP BY continent
ORDER BY total_annual_investment DESC;

-- average investment per country and technology, filter by year
SELECT country, technology, AVG(`public_investments_(2021_million_usd)`) AS avg_investment
FROM country_df
WHERE year = 2022  -- year filter
GROUP BY country, technology
ORDER BY avg_investment DESC
LIMIT 10;

-- total annual investment on the different technologies, filter by year
SELECT technology, SUM(`public_investments_(2021_million_usd)`) AS total_investment
FROM country_df
WHERE year = 2021 -- year filter 
GROUP BY technology
ORDER BY total_investment DESC
LIMIT 10;

-- annual average investment per country and tech
SELECT year, country, technology, AVG(`public_investments_(2021_million_usd)`) AS avg_annual_investment
FROM country_df
GROUP BY year, country, technology
ORDER BY avg_annual_investment DESC
LIMIT 10;

-- Total RE share of electricity capacity (%) per region, filter by year
SELECT region, SUM(`re_share_of_electricity_capacity_and_generation_%`) AS total_re_capacity
FROM region_df
WHERE year = 2022
AND indicator = 'RE share of electricity capacity (%)' -- year filter 
GROUP BY region
ORDER BY total_re_capacity DESC;

-- Total RE share of electricity generation (%) per region, filter by year
SELECT region, SUM(`re_share_of_electricity_capacity_and_generation_%`) AS total_re_generation
FROM region_df
WHERE year = 2022 AND indicator = 'RE share of electricity generation (%)' -- year filter 
GROUP BY region
ORDER BY total_re_generation DESC;


