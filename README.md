# CMS Medicare Medical Economics Analysis (2022–2023) + Geographic Variation (2014–2023)

Portfolio project analyzing Medicare physician service utilization and spend, provider spend concentration, and geographic variation using CMS Public Use Files (PUFs). This repository publishes **public-safe, aggregated outputs** and excludes raw CMS files and any CPT/HCPCS content.

**Interactive Tableau Story (Public):**  
https://public.tableau.com/views/Medicare_Econ_Workbook/Story1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

**Portfolio write-up page:**  
https://www.kaileynortham.com/portfolio-collections/my-portfolio/cms-medicare-spending-analysis

---

## What this analysis answers
**Medical economics questions (high level):**
- How did Medicare physician-service allowed spend, payments, and service volume change from **2022 → 2023**?
- How concentrated is spend across providers (e.g., what share is captured by the top 1%, 5%, 10%)?
- Are “cost drivers” primarily **service mix** or **provider concentration**?
- How large is geographic variation in standardized per-capita spend, and how do state trends evolve over time?

---

## Key findings (from published Tableau outputs)
- **Allowed spend increased +4.8%** from 2022 to 2023 (≈ **$113B → $118B**).
- **Service volume increased** (≈ **2.52B → 2.65B** services).
- **Provider spend is highly concentrated and increased YoY**:
  - 2022: top 1% ≈ **28.3%**, top 5% ≈ **48.8%**, top 10% ≈ **60.9%**
  - 2023: top 1% ≈ **30.5%**, top 5% ≈ **50.7%**, top 10% ≈ **62.3%**
- **Service concentration is materially lower** (top 10 anonymized services share of allowed):
  - 2022: ≈ **31.1%**
  - 2023: ≈ **29.7%**
- **Geographic variation remains large** even after standardization (state-level per-capita spread remains wide across the 2014–2023 period, with a 2023 map view included in the story).

---

## Repo navigation (start here)
### Deliverables
- **Deliverables folder:** [`docs/deliverables/`](docs/deliverables/)  
  Includes the **Tableau Story PDF**, a **downloadable Tableau workbook**, and the **Project Write-Up**.

### Documentation
- **Executive Summary:** [`docs/executive_summary.md`](docs/executive_summary.md)  
- **Dataset Dictionaries:** [`docs/Dictionaries/`](docs/Dictionaries/)

### Public data exports (safe to publish)
- **Public datasets:** [`data/public/`](data/public/)  
  These are the analysis-ready CSVs used for Tableau. They are aggregated and do not include CPT/HCPCS fields.

### SQL used to generate exports (safe to publish)
- **Public SQL queries:** [`sql/public/`](sql/public/)  
  Queries for table creation and exported metric layers.

---

## Methods (workflow summary)
1. Downloaded CMS PUFs locally and stored raw files outside the public repo.
2. Loaded raw files into a local SQLite database.
3. Transformed raw fields into a normalized metric layer (casts, derived totals, standardization fields).
4. Generated **public-safe export tables**:
   - Removed/avoided CPT/HCPCS content
   - Aggregated outputs
   - Generalized service identifiers to anonymized labels (e.g., `SERVICE_001`)
5. Exported CSVs to `data/public/` and built a Tableau Story for interpretation.

---

## Compliance / licensing note (important)
This repo intentionally excludes raw CMS physician PUF files and any CPT/HCPCS code fields. Public artifacts are aggregated and anonymized (e.g., `SERVICE_###`) to comply with CPT licensing restrictions and to avoid publishing restricted code content.

---

## Tools
- SQLite (local ETL + metric layer)
- SQL (export queries in `sql/public/`)
- Tableau (Story + workbook)

---

## Contact
If you’d like to talk through the analysis, methodology, or the repo structure:  
**Kailey Northam** — https://www.kaileynortham.com

