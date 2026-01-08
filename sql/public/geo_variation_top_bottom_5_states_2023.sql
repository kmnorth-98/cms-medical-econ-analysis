SELECT geo_name, ROUND(total_std_payment_per_capita, 2) AS std_pc
FROM geo_state_2023_public
ORDER BY total_std_payment_per_capita DESC
LIMIT 5;

SELECT geo_name, ROUND(total_std_payment_per_capita, 2) AS std_pc
FROM geo_state_2023_public
ORDER BY total_std_payment_per_capita ASC
LIMIT 5;
