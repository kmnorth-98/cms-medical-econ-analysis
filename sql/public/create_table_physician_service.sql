DROP TABLE IF EXISTS physician_service_public;

-- Service Metrics by Year (Public)
CREATE TABLE physician_service_public AS
SELECT
    p.Year,
    m.service_id,
    SUM(p.Tot_Srvcs) AS total_services,
    SUM(p.Tot_Benes) AS total_beneficiaries,
    SUM(p.Tot_Mdcr_Alowd_Amt) AS total_allowed,
    SUM(p.Tot_Mdcr_Pymt_Amt) AS total_payment,
    CASE WHEN SUM(p.Tot_Srvcs) > 0
        THEN SUM(p.Tot_Mdcr_Alowd_Amt) / SUM(p.Tot_Srvcs)
        ELSE NULL END AS allowed_per_service
FROM physician_puf_analysis_all p 
JOIN service_rank_map m
	ON p.HCPCS_Cd = m.HCPCS_Cd
GROUP BY p.Year, m.service_id;


