-- Create Tables for Export
--- Geography by State, Year 2023
DROP TABLE IF EXISTS geo_state_2023_public;

CREATE TABLE geo_state_2023_public AS
SELECT
  Year,
  geo_name,
  geo_code,
  benes_total_cnt,
  total_std_payment_per_capita,
  total_payment_per_capita,
  er_visits_per_1000,
  ip_stays_per_1000,
  op_visits_per_1000,
  bene_avg_age,
  bene_dual_pct,
  bene_avg_risk_score
FROM geo_variation_public
WHERE geo_level = 'State' AND Year = 2023;


--- Geography Trends by State (all years)
DROP TABLE IF EXISTS geo_state_trend_public;

CREATE TABLE geo_state_trend_public AS
SELECT
  Year,
  geo_name,
  geo_code,
  benes_total_cnt,
  total_std_payment_per_capita,
  total_payment_per_capita
FROM geo_variation_public
WHERE geo_level = 'State';
