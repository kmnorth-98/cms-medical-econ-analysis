# CMS Medicare Cost & Utilization Analysis (2022–2023)
## with Geographic Variation (2014–2023)

### Objective
Analyze Medicare physician service spending, utilization, provider spend concentration, and geographic variation using CMS Public Use Files (PUFs) to identify cost drivers and opportunities for targeted intervention.

### Data
- CMS Medicare Physician & Other Practitioners PUF (2022, 2023)
- CMS Medicare Geographic Variation PUF (2014–2023)

### Method
Raw CMS files were loaded into SQLite and transformed into a normalized metric layer. Average payment fields were converted into total spend measures using service counts. Provider- and service-level concentration metrics were computed, and geographic variation was evaluated using standardized per-capita spending. Public outputs exclude CPT/HCPCS codes and use anonymized service identifiers.

### Key Findings
- Total allowed spending increased from **$113.0B (2022) to $118.5B (2023)** while service volume increased from **2.52B to 2.65B** services.
- Provider spend concentration is high and increased YoY. In 2023, the top **1%** of providers accounted for **~30.5%** of allowed spending; the top **10%** accounted for **~62.3%**.
- Service-level concentration was lower: the top 10 services represented **~29.7%** of allowed spending in 2023 (vs. **~31.1%** in 2022).
- Geographic variation remained large even after standardization: 2023 standardized per-capita spending ranged by approximately **$15,900** across states.

### Implications
- Concentration patterns support provider-focused review (outliers), utilization management targeting, and network strategy.
- Lower service concentration suggests provider behavior is a stronger cost driver than service mix alone.
- Persistent geographic variation indicates region-specific drivers and intervention opportunities.

### Limitations
- PUFs are aggregated and are not member-level claims; PMPM is approximate when beneficiary-months are not available.
- Results reflect Medicare FFS and may not generalize directly to other payer populations.

### Licensing / Compliance Note
Raw physician PUF files and any CPT/HCPCS code fields remain local and are excluded from public artifacts. Public outputs use aggregated metrics and anonymized service identifiers (`Service_###`) and do not distribute CPT/HCPCS content.

