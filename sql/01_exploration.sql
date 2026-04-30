-- 01_exploration.sql
-- Initial exploration of the OWID energy dataset
-- Author: Ravinder Deep Singh Bindra
-- Database: energy.db, table: energy
-- Q1: How many rows total?
SELECT COUNT(*) AS total_rows FROM energy;
-- Q2: Peek at one row to see all columns
SELECT * FROM energy LIMIT 1;
-- Q3: What years are covered?
SELECT MIN(CAST(year AS INTEGER)) AS first_year,
       MAX(CAST(year AS INTEGER)) AS last_year
FROM energy;
-- Q4: Top 10 countries by total energy consumption in the most recent year
SELECT country,
       CAST(primary_energy_consumption AS REAL) AS consumption_twh
FROM energy
WHERE CAST(year AS INTEGER) = 2022
  AND primary_energy_consumption != ''
  AND country NOT IN ('World', 'Asia', 'Europe', 'Africa', 'North America', 'South America', 'Oceania')
ORDER BY consumption_twh DESC
LIMIT 10;
-- Q5: Global renewables share of energy, year by year (last 30 years)
SELECT year,
       ROUND(CAST(renewables_share_energy AS REAL), 2) AS renewables_pct
FROM energy
WHERE country = 'World'
  AND CAST(year AS INTEGER) >= 1995
  AND renewables_share_energy != ''
ORDER BY CAST(year AS INTEGER);
-- Q6: Top 15 fossil-fuel-dependent countries in 2022
SELECT country,
       ROUND(CAST(fossil_share_energy AS REAL), 1) AS fossil_pct
FROM energy
WHERE CAST(year AS INTEGER) = 2022
  AND fossil_share_energy != ''
  AND country NOT IN ('World', 'Asia', 'Europe', 'Africa', 'North America', 'South America', 'Oceania', 'European Union (27)')
ORDER BY fossil_pct DESC
LIMIT 15;
-- Q7: How has the world's renewable share evolved by decade?
SELECT (CAST(year AS INTEGER) / 10) * 10 AS decade,
       ROUND(AVG(CAST(renewables_share_energy AS REAL)), 2) AS avg_renewables_pct
FROM energy
WHERE country = 'World'
  AND renewables_share_energy != ''
GROUP BY decade
ORDER BY decade;
-- Q8: Countries where renewables share averaged above 50% across 2018-2022
SELECT country,
       ROUND(AVG(CAST(renewables_share_energy AS REAL)), 1) AS avg_renewables_pct,
       COUNT(*) AS years_counted
FROM energy
WHERE CAST(year AS INTEGER) BETWEEN 2018 AND 2022
  AND renewables_share_energy != ''
  AND country NOT IN ('World', 'Asia', 'Europe', 'Africa', 'North America', 'South America', 'Oceania', 'European Union (27)')
GROUP BY country
HAVING avg_renewables_pct > 50
ORDER BY avg_renewables_pct DESC;