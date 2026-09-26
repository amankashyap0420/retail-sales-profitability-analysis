# Review of the supplied reference

Source: https://github.com/PRemSHarma-00/sales-analysis
Reviewed commit: d8e1b7ee004268df691dfc338028ea574f2ff50d
Reviewed: 2026-09-25. Read the complete README, all 31 notebook cells, requirements and the CSV schema/content. The repository also includes a PBIX and four dashboard images. The PBIX internals/DAX were not audited or executed.

## What it does well
A clear business flow: KPIs → categories → furniture losses → discounts → regions → time → customer concentration. It counts distinct orders for AOV and distinct customers for repeat purchase share. Its simple Python + Power BI approach is suitable for a starter portfolio project.

## What needs strengthening
- Cleaning is mostly date conversion and null inspection; explicit grain, range, uniqueness and relationship validations are absent.
- No cleaned CSV export appears in the notebook despite a stated downstream Power BI workflow.
- Month-name grouping sorts labels alphabetically. Use month numbers or year-month dates.
- Customer concentration groups by name; stable Customer ID is safer. The original floors the top-decile count, this implementation explicitly uses ceiling, so its percentage can differ.
- The actual data has 4 non-loss-making Tables lines among 176 lines with discounts above 20%. Thus the README assertion that every such transaction is a net loss is false. Average line profit at a discount level also does not prove a causal effect.
- The README's $10K–15K annual recovery estimate has no supporting calculation in the notebook. A cap may also reduce demand. This starter replaces it with a clearly labelled mechanical scenario.
- Repeat customer share over four years is not a retention rate for a fixed cohort.
- Existing figures are useful exploratory plots but lack a reproducible export workflow.

## Independent implementation delivered
Six explanatory notebooks, reusable helpers, validation gates, SQL queries with KPI reconciliation, customer RFM, explicit scenario assumptions, dimensional CSV exports, DAX measures and a Power BI build guide. No original notebook code or dashboard file is redistributed; the reference dataset is bundled for the user-requested adaptation with attribution.

The repository did not include a LICENSE file at review time. Dataset upstream terms were not independently established. Retain provenance and confirm dataset redistribution terms before making your own repository public.
