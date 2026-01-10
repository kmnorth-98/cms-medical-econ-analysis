# Dataset Dictionary — provider_concentration_public.csv

**Path:** `data/public/provider_concentration_public.csv`  
**Domain:** Spend concentration across providers  
**Grain (one row per):** `Year` × `rn` (rank cutoff)  
**Primary key:** (`Year`, `rn`)  
**Contains restricted CPT/HCPCS content?** No

---

## Purpose
Represents a concentration curve (Lorenz-style) showing the **cumulative share of spend** captured by the top X% of providers.

Used for:
- Provider concentration curve visualization (2022 vs 2023)
- Extracting benchmarks (top 1%, 5%, 10% provider share of spend)

---

## Field definitions

| Field | Type | Description | Example / Notes |
|---|---|---|---|
| Year | integer | Calendar year of the observation | 2022, 2023 |
| rn | integer | Rank cutoff count (top N providers) | Often in increments (e.g., 100, 200, …) |
| n_providers | integer | Total number of providers in the year | Denominator used for percentiles |
| provider_pct | numeric | Provider percentile for the cutoff | `rn / n_providers` |
| cumulative_spend_share | numeric | Cumulative share of total spend captured by top `rn` providers | Monotonic increasing from ~0 to ~1 |
| rowid | integer | Surrogate row identifier from export | Not a business key |

---

## Assumptions / caveats
- Provider ranking is based on spend in the underlying (local-only) metric layer.
- Curve is intended for concentration and benchmarking, not provider identification.

---

## Suggested QA checks
- For each year: `provider_pct ≈ rn / n_providers` (within rounding tolerance).
- `cumulative_spend_share` is monotonic increasing and <= 1.0.
- The last row per year should approach 1.0 cumulative spend share (near total spend).

