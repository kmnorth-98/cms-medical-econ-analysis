DROP TABLE IF EXISTS geo_variation_public;

-- Geography variation standardized table (Public)
CREATE TABLE geo_variation_public AS
SELECT
    CAST(YEAR AS INTEGER) AS Year,
    BENE_GEO_LVL AS geo_level,
    BENE_GEO_DESC AS geo_name,
    BENE_GEO_CD AS geo_code,
    
    -- population
    CAST(BENES_TOTAL_CNT AS REAL) AS benes_total_cnt,
    CAST(BENES_FFS_CNT AS REAL) AS benes_ffs_cnt,
    CAST(BENES_MA_CNT AS REAL) AS benes_ma_cnt,
    CAST(MA_PRTCPTN_RATE AS REAL) AS ma_participation_rate,
    
    -- key PMPM metrics (per-capita per year)
    CAST(TOT_MDCR_PYMT_PC AS REAL) AS total_payment_per_capita,
    CAST(TOT_MDCR_STDZD_PYMT_PC AS REAL) AS total_std_payment_per_capita,
    
    -- context controls
    CAST(BENE_AVG_AGE AS REAL) AS bene_avg_age,
    CAST(BENE_DUAL_PCT AS REAL) AS bene_dual_pct,
    CAST(BENE_AVG_RISK_SCRE AS REAL) AS bene_avg_risk_score,
    
    -- utilization indicators
    CAST(ER_VISITS_PER_1000_BENES AS REAL) AS er_visits_per_1000,
    CAST(IP_CVRD_STAYS_PER_1000_BENES AS REAL) AS ip_stays_per_1000,
    CAST(OP_VISITS_PER_1000_BENES AS REAL) AS op_visits_per_1000
FROM geo_variation_raw
WHERE
	YEAR IS NOT NULL
	AND BENE_GEO_LVL IS NOT NULL
	AND BENE_GEO_DESC IS NOT NULL;


-- Checks
SELECT MIN(Year) AS min_year, MAX(Year) AS max_year, COUNT(*) AS rows
FROM geo_variation_public;


SELECT geo_level, COUNT(*) AS rows
FROM geo_variation_public
GROUP BY geo_level
ORDER BY rows DESC;