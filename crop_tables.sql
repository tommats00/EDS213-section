-- Create table for crop yield
CREATE TABLE crop_yield (
    country VARCHAR,
    crop VARCHAR,
    item_code_npc VARCHAR,
    element VARCHAR,
    element_code REAL,
    year REAL,
    unit VARCHAR,
    value REAL,
    flag_description VARCHAR,
    domain VARCHAR,
    domain_code VARCHAR,
    unique_id INTEGER PRIMARY KEY
); 

SELECT * FROM crop_yield;

COPY crop_yield 
FROM "crop_test.csv" 
(DELIM ',', HEADER, QUOTE '"', strict_mode FALSE);

CREATE TABLE crop_yield2 AS
    SELECT * FROM read_csv('crop_yield_cleaned.csv');


CREATE TABLE crop_calendar (
    data_id INTEGER PRIMARY KEY,
    county VARCHAR,
    crop VARCHAR,
    plant_start INTEGER,
    plant_end INTEGER,
    plant_range INTEGER,
    harvest_start INTEGER,
    harvest_end INTEGER,
    harvest_range INTEGER,
    temp_average REAL,
    precip_average REAL
);

COPY crop_calendar FROM 'crop_cal_cleaned.csv' (header TRUE);