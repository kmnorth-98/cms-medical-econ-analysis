-- Totals by year
SELECT 
    Year,
    ROUND(SUM(Tot_Mdcr_Alowd_Amt), 0) AS total_allowed,
    ROUND(SUM(Tot_Mdcr_Pymt_Amt), 0) AS total_payment,
    ROUND(SUM(Tot_Srvcs), 0) AS total_services
FROM physician_puf_analysis_all
GROUP BY Year
ORDER BY Year;

-- Check for nulls / zeros
SELECT
    SUM(CASE WHEN Tot_Srvcs = 0 THEN 1 ELSE 0 END) AS zero_services_rows,
    SUM(CASE WHEN Avg_Mdcr_Alowd_Amt IS NULL THEN 1 ELSE 0 END) AS null_allowed_avg_rows
FROM physician_puf_analysis_all;