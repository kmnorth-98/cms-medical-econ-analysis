# CMS Medicare Medical Economics Analysis (2022–2023) + Geographic Variation (2014–2023)

Portfolio project analyzing Medicare physician service costs, utilization, provider spend concentration, and geographic variation using CMS Public Use Files (PUFs). Public artifacts exclude CPT/HCPCS codes and publish only aggregated, anonymized outputs.

## Objective
Identify cost drivers and variation patterns relevant to medical economics work: utilization, spend concentration, and geography-driven differences in per-capita spending.

## Data
- **CMS Medicare Physician & Other Practitioners PUF** (2022, 2023)
- **CMS Medicare Geographic Variation PUF** (2014–2023)

> Note: Raw files are not included in this repo due to size and licensing constraints.

## Method (Workflow)
1. Downloaded CMS PUFs locally and stored raw files outside the public repo.
2. Imported CSVs into SQLite (local database).
3. Built a cleaned metric layer (casts, totals derived from averages × service counts).
4. Created public-safe export tables (no CPT/HCPCS fields; service identifiers anonymized to `Service_###`).
5. Exported analysis-ready CSVs for visualization (Power BI).

## Key Outputs (in `data/public/`)
- `physician_service_public.csv` — year + anonymized service-level utilization and spend
- `provider_concentration_public.csv` — downsampled concentration curve by year
- `geo_state_2023_public.csv` — 2023 state snapshot (standardized per-capita)
- `geo_state_trend_public.csv` — 2014–2023 state trend (standardized per-capita)

## Key Findings
- **Total allowed spend increased from $113.0B (2022) to $118.5B (2023)** with service volume rising from **2.52B to 2.65B** services.
- **Provider spend is highly concentrated and increased YoY**:
  - 2022: top 1% = **28.3%**, top 5% = **48.8%**, top 10% = **60.9%**
  - 2023: top 1% = **30.5%**, top 5% = **50.7%**, top 10% = **62.3%**
- **Service concentration is lower than provider concentration** (top 10 services share of allowed):
  - 2022: **31.1%**
  - 2023: **29.7%**
- **Geographic variation remains large even after standardization**:
  - 2023 standardized per-capita range spread ≈ **$15,900** across states (highest: NV ≈ $15,886; TX ≈ $15,198; CA ≈ $14,946).

## Reproducibility
This repo includes **public-safe exports and SQL queries**. The full pipeline (including raw imports and CPT/HCPCS code fields) is intentionally kept local.

To reproduce the published analysis:
1. Use the CSVs in `data/public/` to rebuild visuals.
2. Use `sql/public/` queries to compute rankings and concentration outputs.

## Licensing / Compliance Note
Raw physician PUF files and any CPT/HCPCS code fields remain local and are excluded from this repository. Public artifacts use aggregated metrics and anonymized service identifiers (`Service_###`) and do not distribute CPT/HCPCS content.

