-- View 1: State-level Only (2023)
DROP VIEW IF EXISTS geo_state_2023;

CREATE VIEW geo_state_2023 AS
SELECT *
FROM geo_variation_public
WHERE geo_level = 'State' And Year = 2023;


-- View 2: Trend Table for States (All Years)
DROP VIEW IF EXISTS geo_state_trend;

CREATE VIEW geo_state_trend AS
SELECT
    Year,
    geo_name,
    geo_code,
    total_std_payment_per_capita,
    total_payment_per_capita,
    benes_total_cnt
FROM geo_variation_public
WHERE geo_level = 'State';