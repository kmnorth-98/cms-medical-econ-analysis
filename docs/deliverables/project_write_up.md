# Project Write-Up — CMS Medicare Medical Economics Analysis

**Deliverables & links**
- Repo deliverables (PDF + workbook): [`./`](./)
- Public datasets (CSV exports): [`../../data/public/`](../../data/public/)
- Public SQL queries: [`../../sql/public/`](../../sql/public/)
- Dataset dictionaries: [`../Dictionaries/`](../Dictionaries/)

**External links**
- Tableau Story (Public): https://public.tableau.com/views/Medicare_Econ_Workbook/Story1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
- Portfolio webpage: https://www.kaileynortham.com/portfolio-collections/my-portfolio/cms-medicare-spending-analysis

---

## 1. Business problem (what decision this supports)
Medical economics teams regularly need to answer:
- Where is spend growing (and how fast)?
- Is cost risk concentrated in a small segment of providers?
- Are “cost drivers” primarily utilization + unit cost at the service level, or provider distribution?
- Which regions consistently differ from peers, even after standardization?

This project provides a **portfolio-quality, reproducible** approach to answering those questions using CMS PUFs while maintaining licensing compliance.

---

## 2. Data sources
**CMS Public Use Files (PUFs)**
- Medicare Physician & Other Practitioners (2022, 2023)
- Medicare Geographic Variation (2014–2023)

**Important constraint:** CMS physician PUFs include CPT/HCPCS code content that is subject to licensing restrictions. This repo intentionally avoids publishing restricted code content by exporting aggregated outputs and generalized identifiers only.

---

## 3. Data governance & compliance (what is public vs local-only)
### Local-only (not published)
- Raw CMS files
- Local SQLite database
- Any tables containing CPT/HCPCS fields or restricted identifiers

### Published (safe)
- Aggregated CSV exports in [`../../data/public/`](../../data/public/)
- Public-safe SQL in [`../../sql/public/`](../../sql/public/)
- Tableau Story PDF + workbook in [`./`](./)
- Documentation and dictionaries in [`../`](../)

**Anonymization approach**
- Service IDs are generalized to `SERVICE_###` (no CPT/HCPCS content in the published outputs).

---

## 4. Workflow / pipeline
1. **Ingest:** Loaded CMS PUFs into SQLite (local).
2. **Transform:** Built a normalized metric layer (casts, derived totals).
3. **Metric definitions (examples):**
   - `total_allowed` = total allowed amount for the service-year (derived/aggregated)
   - `total_services` = service volume for the service-year
   - `allowed_per_service` = `total_allowed / total_services`
4. **Concentration modeling:** Produced a provider concentration curve (Lorenz-style cumulative spend share by provider percentile).
5. **Geographic trend:** Produced state-level standardized per-capita views across 2014–2023 and a 2023 snapshot map.
6. **Export:** Wrote public-safe tables to CSV for Tableau.

---

## 5. Analysis & visuals (what to look at in the Tableau Story)
### Executive Overview
- Year-over-year totals (Allowed, Payment, Services)
- Provider spend concentration curve (2022 vs 2023)

**Interpretation:** If the top 1–10% of providers capture a large share of spend, cost opportunity and risk are disproportionately concentrated.

### Cost Drivers
- Top services by allowed spend (service IDs generalized)
- Utilization vs unit cost scatter

**Interpretation:** This separates high-spend services driven by volume (utilization) from those driven by high allowed per service (unit cost). It supports identifying which lever is more plausible for intervention.

### Geographic Variation
- 2023 state map (standardized per-capita)
- 2014–2023 state trend lines

**Interpretation:** Persistent divergence after standardization suggests region-specific structural drivers. The trend view helps distinguish one-time shocks from sustained differences.

---

## 6. Results (published outputs)
From the published Tableau story:
- Allowed spend increased ≈ +4.8% from 2022 to 2023 (≈ $113B → $118B).
- Provider spend concentration increased YoY (top 1% ≈ 28.3% → 30.5%).
- Service-level concentration is meaningfully lower than provider concentration (top 10 services share ≈ 31.1% → 29.7%).
- Geographic variation remains wide after standardization; state trends show persistent separation across 2014–2023.

---

## 7. Reproducibility (how to reuse this repo)
### Option A — Rebuild the visuals (recommended for reviewers)
1. Open the CSV exports in [`../../data/public/`](../../data/public/).
2. Connect them in Tableau (or any BI tool).
3. Use the queries in [`../../sql/public/`](../../sql/public/) as the documentation of how each export was produced.

### Option B — Review the finished deliverables
- Tableau Story PDF and workbook are in [`./`](./).
- The interactive Tableau Public story is linked above.

---

## 8. Limitations & next steps
**Limitations**
- PUFs are aggregated; no member-level attribution, risk adjustment, or PMPM precision.
- Not all confounding factors can be controlled (demographics, morbidity, benefit design).

**Next steps (if expanding)**
- Add more years for physician services (trend beyond 2022–2023).
- Add decomposition: utilization vs price vs mix impacts on spend growth.
- Add statistical outlier flags for providers (robust z-scores / IQR) using public-safe aggregates.
- Add drilldowns by specialty (if publishable without restricted fields).

---

## 9. Appendix: Dataset dictionaries
See [`../Dictionaries/`](../Dictionaries/) for field-level definitions and QA checks.

