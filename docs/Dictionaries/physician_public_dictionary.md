# Dataset Dictionary — physician_service_public.csv

**Path:** `data/public/physician_service_public.csv`  
**Domain:** Medicare physician services (aggregated)  
**Grain (one row per):** `Year` × `service_id` (generalized/anonymized)  
**Primary key:** (`Year`, `service_id`)  
**Contains restricted CPT/HCPCS content?** No (service IDs are generalized)

---

## Purpose
Aggregated service-level metrics for spend and utilization by year. Used for:
- Top services by allowed spend
- Utilization vs unit cost (allowed per service)
- Service-level concentration summaries

---

## Field definitions

| Field | Type | Description | Example / Notes |
|---|---|---|---|
| Year | integer | Calendar year of the observation | 2022, 2023 |
| service_id | string | Generalized service identifier | `SERVICE_001` (does not map to CPT/HCPCS in this repo) |
| total_services | numeric | Total service count for the service-year | Large values (can be fractional if sourced from aggregated fields) |
| total_beneficiaries | numeric | Total unique beneficiaries associated to the service-year aggregate | Aggregated PUF-derived total; not member-level |
| total_allowed | numeric | Total allowed amount for the service-year | USD |
| total_payment | numeric | Total payment amount for the service-year | USD |
| allowed_per_service | numeric | Allowed amount per service | `total_allowed / total_services` |
| rowid | integer | Surrogate row identifier from export | Not a business key |

---

## Assumptions / caveats
- `service_id` is **an anonymized label**. This repo does not publish CPT/HCPCS codes or any mapping.
- PUFs are aggregated; values are appropriate for macro-level economics, not member-level adjudication.

---

## Suggested QA checks
- For each year: `SUM(total_allowed)` and `SUM(total_services)` match the published totals in the Tableau story.
- `allowed_per_service ≈ total_allowed / total_services` (within rounding tolerance).
- `service_id` uniqueness within year: no duplicates for (`Year`, `service_id`).

