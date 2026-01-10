# Executive Summary — CMS Medicare Medical Economics Analysis
## Physician Services (2022–2023) + Geographic Variation (2014–2023)

**Related links**
- Dataset dictionaries: [`../docs/Dictionaries/`](Dictionaries/)
- Public datasets (CSV exports): [`../data/public/`](../data/public/)

---

## Objective
Assess Medicare physician-service spending and utilization patterns (2022–2023), quantify **provider spend concentration**, and contextualize results using **state-level geographic variation trends** (2014–2023). The goal is to surface cost drivers and patterns relevant to medical economics: spend growth, concentration risk, and region-driven differences.

---

## Data
**CMS Public Use Files (PUFs)**
- Medicare Physician & Other Practitioners PUF (2022, 2023)
- Medicare Geographic Variation PUF (2014–2023)

> Note: Raw CMS files are not included in this repo. Published artifacts use aggregated outputs and anonymized service identifiers.

---

## Approach (high level)
- Loaded raw CMS PUFs into a local SQLite database (local-only).
- Built a normalized metric layer and derived totals from available averages and volume fields.
- Computed:
  - Year-over-year totals (allowed spend, payments, service volume)
  - Provider spend concentration curve (cumulative spend share by provider percentile)
  - Service-level concentration and cost driver views using anonymized service IDs
  - Geographic variation using standardized per-capita spending, 2014–2023 trends plus a 2023 map view
- Exported **public-safe CSVs** to [`../data/public/`](../data/public/) for visualization and sharing.

---

## Key results (published outputs)
- **Allowed spend increased ~4.8%** from 2022 to 2023 (≈ $113B → $118B) and service volume increased (≈ 2.52B → 2.65B).
- **Provider concentration is high and increased YoY:**
  - 2022: top 1% ≈ 28.3% | top 5% ≈ 48.8% | top 10% ≈ 60.9%
  - 2023: top 1% ≈ 30.5% | top 5% ≈ 50.7% | top 10% ≈ 62.3%
- **Service concentration is lower than provider concentration**, indicating provider-level behavior/distribution is a stronger driver than “service mix” alone:
  - Top 10 anonymized services share of allowed: 2022 ≈ 31.1% | 2023 ≈ 29.7%
- **Geographic variation remains large** after standardization, and state trends show persistent divergence across 2014–2023.

---

## Why this matters (medical economics lens)
- High (and rising) concentration supports **provider-focused review**: outlier identification, targeted UM, and network strategy.
- Lower service concentration suggests that spend is not dominated by only a handful of services; instead, **spend distribution across providers** is a key lever.
- Persistent geographic variation supports **region-specific interventions** and deeper drilldowns (policy, practice patterns, access, population differences).

---

## Limitations
- PUFs are aggregated; this is not member-level claims and does not support patient-level PMPM precision.
- Results reflect Medicare FFS and may not generalize to other payer populations without adjustment.

---

## Licensing / compliance note
Public outputs in this repo exclude CPT/HCPCS fields and do not publish restricted code content. Service identifiers are generalized (e.g., `SERVICE_###`) and only aggregated metrics are shared.

