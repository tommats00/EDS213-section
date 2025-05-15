-- Create tables
CREATE TABLE crop_yield AS
    SELECT * FROM read_csv('data/crop_yield_cleaned.csv');

CREATE TABLE crop_calendar AS
    SELECT * FROM read_csv('data/crop_cal_cleaned.csv');

-- Crop calendar table
SELECT * FROM crop_calendar LIMIT 5;

-- Crop Yield table
SELECT * FROM crop_yield LIMIT 5;

-- My crops: Barley, Rice, Wheat, Rye, Oats
-- My question: What are the countries for the top 5 yields for each crop? 
-- My question: What is the minimum, maximum, and mean average_temp and average_precip for the top 5 yields of each crop? 
 

-- My question is only interested in the yields for these crops. I need to filter down my data a little more and select only the yield element
SELECT * FROM crop_yield 
    WHERE element IN ('Yield');

-- Create a new table with this information
CREATE TABLE filtered_crop_yield AS
    SELECT * FROM crop_yield
    WHERE element IN ('Yield');

-- View new table
SELECT * FROM filtered_crop_yield LIMIT 5;

-- We need to join the tables for our analysis
-- Inner join because we don't have perfect crossover of crops for both tables
CREATE TABLE crop_join AS
SELECT * FROM filtered_crop_yield
    INNER JOIN crop_calendar
    ON filtered_crop_yield.country = crop_calendar.country
    AND filtered_crop_yield.crop = crop_calendar.crop 
    ORDER BY crop_calendar.country;


------- Question 1 --------
-- Use WITH to create a temporary view
WITH unique_yields AS ( 
  SELECT crop, value, MIN(country) AS country  -- Selecting only one country where values are the same
  FROM crop_join
  GROUP BY crop, value
),
-- creating ranks for crops based on value (yield)
ranked_yields AS (
  SELECT crop, value, country,
         RANK() OVER (PARTITION BY crop ORDER BY value DESC) AS rank 
  FROM unique_yields
)
-- select the top 5 yields for each crop 
SELECT crop, value, country
FROM ranked_yields
WHERE rank <= 5;




------- Question 2 --------
-- Use WITH to create a temporary view
WITH unique_yields AS ( 
  SELECT crop, value, temp_average, precip_average, MIN(country) AS country
  FROM crop_join
  GROUP BY crop, value, temp_average, precip_average
),
-- creating ranks for crops based on value (yield)
ranked_yields AS (
  SELECT crop, value, temp_average, precip_average, country,
         RANK() OVER (PARTITION BY crop ORDER BY value DESC) AS rank 
  FROM unique_yields
),
-- select the top 5 yields for each crop 
top5_yields AS (
  SELECT crop, value, temp_average, precip_average
  FROM ranked_yields
  WHERE rank <= 5
)
-- Calculating summary stats for temp and precip
SELECT 
  crop,
  ROUND(MIN(temp_average), 2) AS min_temp,
  ROUND(MAX(temp_average), 2) AS max_temp,
  ROUND(AVG(temp_average), 2) AS mean_temp,
  ROUND(MIN(precip_average), 2) AS min_precip,
  ROUND(MAX(precip_average), 2) AS max_precip,
  ROUND(AVG(precip_average), 2) AS mean_precip
FROM top5_yields
GROUP BY crop;



