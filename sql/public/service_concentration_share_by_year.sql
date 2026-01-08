WITH svc AS (
  SELECT
    Year,
    service_id,
    total_allowed
  FROM physician_service_public
),
ranked AS (
  SELECT
    Year,
    total_allowed,
    ROW_NUMBER() OVER (PARTITION BY Year ORDER BY total_allowed DESC) AS rn,
    SUM(total_allowed) OVER (PARTITION BY Year) AS year_total
  FROM svc
)
SELECT
  Year,
  ROUND(SUM(CASE WHEN rn <= 10 THEN total_allowed ELSE 0 END) * 1.0 / MAX(year_total), 4) AS top10_services_share
FROM ranked
GROUP BY Year
ORDER BY Year;
