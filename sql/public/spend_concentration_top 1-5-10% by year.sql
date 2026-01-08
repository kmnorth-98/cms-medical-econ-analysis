WITH ranked AS (
  SELECT
    Year,
    Rndrng_NPI,
    SUM(Tot_Mdcr_Alowd_Amt) AS total_allowed
  FROM physician_puf_analysis_all
  GROUP BY Year, Rndrng_NPI
),
calc AS (
  SELECT
    Year,
    total_allowed,
    ROW_NUMBER() OVER (PARTITION BY Year ORDER BY total_allowed DESC) AS rn,
    COUNT(*) OVER (PARTITION BY Year) AS n,
    total_allowed * 1.0 / SUM(total_allowed) OVER (PARTITION BY Year) AS spend_share
  FROM ranked
),
curve AS (
  SELECT
    Year,
    rn,
    n,
    (rn * 1.0) / n AS provider_pct,
    SUM(spend_share) OVER (PARTITION BY Year ORDER BY total_allowed DESC) AS cum_spend_share
  FROM calc
)
SELECT
  Year,
  MAX(CASE WHEN provider_pct <= 0.01 THEN cum_spend_share END) AS top_1pct_share,
  MAX(CASE WHEN provider_pct <= 0.05 THEN cum_spend_share END) AS top_5pct_share,
  MAX(CASE WHEN provider_pct <= 0.10 THEN cum_spend_share END) AS top_10pct_share
FROM curve
GROUP BY Year
ORDER BY Year;
