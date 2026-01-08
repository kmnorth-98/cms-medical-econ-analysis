-- Provider Concentration Curve Table (for GitHub push)
DROP TABLE IF EXISTS provider_concentration_public;

CREATE TABLE provider_concentration_public AS
WITH base AS (
    SELECT
        Year,
        Rndrng_NPI,
        total_allowed
    FROM provider_spend_public
),
ranked AS (
    SELECT 
        Year,
        Rndrng_NPI,
        total_allowed,
        total_allowed * 1.0 / SUM(total_allowed) OVER (PARTITION BY Year) AS spend_share,
        row_number() OVER (PARTITION BY Year ORDER BY total_allowed DESC) AS rn,
        COUNT(*) OVER (PARTITION BY Year) AS n_providers
    FROM base
),
curve AS (
    SELECT
        Year,
        rn,
        n_providers,
        (rn * 1.0) / n_providers AS provider_pct,
        SUM(spend_share) OVER (PARTITION BY Year ORDER BY total_allowed DESC) AS cumulative_spend_share
    FROM ranked
)


-- downsample: every 100th provider + last row
SELECT * 
FROM curve
WHERE rn % 100 = 0 OR rn = n_providers;