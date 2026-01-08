SELECT
  ROUND(MAX(total_std_payment_per_capita), 2) AS max_std_pc,
  ROUND(MIN(total_std_payment_per_capita), 2) AS min_std_pc,
  ROUND(MAX(total_std_payment_per_capita) - MIN(total_std_payment_per_capita), 2) AS spread_std_pc
FROM geo_state_2023_public;
