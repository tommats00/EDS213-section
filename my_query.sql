-- View the tables

-- Crop calendar table
SELECT * FROM crop_calendar
    WHERE country IN ('Albania') LIMIT 5;

-- Crop Yield table
SELECT * FROM crop_yield
    LIMIT 5;

-- My crops: Barley, Rice, Wheat, Rye, Oats
-- My questions: How important are the variables average temperature and average precipitation for the yields of barley, rice, wheat, rye, and oats? 
-- Question 2: How does average temperature and average precipitation affect each crop yield? 

-- My quetsion is only interested in the yields for these crops. I need to filter down my data a little more and select only the yield element

SELECT * FROM crop_yield 
    WHERE element IN ('Yield');

-- Create a new table with this information
CREATE TABLE filtered_crop_yield AS
    SELECT * FROM crop_yield
    WHERE element IN ('Yield');

-- View new table
SELECT * FROM filtered_crop_yield LIMIT 10;

-- We need to join the tables for our analysis
-- Inner join because we don't have perfect crossover of crops for both tables
CREATE TABLE crop_join AS
SELECT * FROM filtered_crop_yield
    INNER JOIN crop_calendar
    ON filtered_crop_yield.country = crop_calendar.country
    AND filtered_crop_yield.crop = crop_calendar.crop 
    ORDER BY crop_calendar.country;

-- The inner join shows where country and crop are the same
-- Now lets display a table with the highest crop yields and view their temp and precip data
SELECT * FROM crop_join
    ORDER BY (temp_average, precip_average) DESC;

SELECT * FROM filtered_crop_yield
    WHERE country IN ('Cambodia');
SELECT * FROM crop_calendar
    WHERE country IN ('Cambodia');