# Dataset Dictionary — geo_state_trend_public.csv

**Path:** `data/public/geo_state_trend_public.csv`  
**Domain:** Geographic variation in Medicare spending (state-level)  
**Grain (one row per):** `Year` × `geo_name` × (beneficiary cohort record)  
**Primary key (practical):** (`Year`, `geo_name`, `rowid`)  
**Contains restricted CPT/HCPCS content?** No

---

## Purpose
State-level per-capita spending metrics across 2014–2023, including standardized and non-standardized per-capita amounts and beneficiary counts.

Used for:
- 2014–2023 state trend line view
- 2023 standardized per-capita map view (by filtering to Year=2023)

---

## Important structural note (3 rows per state-year)
This dataset contains **three records per state per year** (consistent across state-years). A beneficiary cohort label is not included in the published export. In the Tableau build, an “overall” row can be selected by using the row with the **largest `benes_total_cnt`** per `Year` + `geo_name`.

---

## Field definitions

| Field | Type | Description | Example / Notes |
|---|---|---|---|
| Year | integer | Calendar year | 2014 … 2023 |
| geo_name | string | Geography label | State abbreviation (e.g., `CA`, `TX`) |
| geo_code | numeric | Geographic code | Typically aligns with state FIPS codes (numeric) |
| benes_total_cnt | numeric | Total beneficiaries represented by the cohort record | Use max per state-year for “overall” |
| total_std_payment_per_capita | numeric | Standardized payment per beneficiary (per-capita) | USD per beneficiary |
| total_payment_per_capita | numeric | Non-standardized payment per beneficiary (per-capita) | USD per beneficiary |
| rowid | integer | Surrogate row identifier from export | Not a business key |

---

## Assumptions / caveats
- Standardized per-capita is intended to reduce geographic price adjustment effects and enable peer comparison.
- Cohort label not published; treat this as a public-safe export and apply the “max beneficiary row” rule when you need the overall series.

---

## Suggested QA checks
- For each (`Year`, `geo_name`): exactly **3 rows**.
- Values are reasonable ranges and non-negative.
- When selecting the overall row (max `benes_total_cnt`), ensure the trend line matches the Tableau story output.

