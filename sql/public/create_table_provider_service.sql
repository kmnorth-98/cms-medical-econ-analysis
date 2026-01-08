DROP TABLE IF EXISTS provider_spend_public;

-- Provider Spend Concentration (Public)
CREATE TABLE provider_spend_public AS
SELECT
    Year,
    Rndrng_NPI,
    Rndrng_Prvdr_Type,
    Rndrng_Prvdr_State_Abrvtn,
    SUM(Tot_Mdcr_Alowd_Amt) AS total_allowed,
    SUM(Tot_Mdcr_Pymt_Amt) AS total_payment,
    SUM(Tot_Srvcs) AS total_services,
    SUM(Tot_Benes) AS total_beneficiaries
FROM physician_puf_analysis_all
GROUP BY Year, Rndrng_NPI, Rndrng_Prvdr_Type, Rndrng_Prvdr_State_Abrvtn;