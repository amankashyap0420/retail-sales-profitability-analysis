# Retail Sales & Profitability Analysis — runnable starter

A complete Python + SQL + Power BI preparation project using the **actual Superstore CSV from the supplied repository**. Data and notebook results are not simulated. This is an independently written starter inspired by Prem Sharma's project, not a claim of original dataset collection or real-world business impact.

## Fast start on Windows / VS Code
1. Extract the ZIP fully, for example to `C:\Sales-Analysis-Starter`.
2. Open the extracted `sales_analysis_starter` folder in VS Code. Open a terminal in that folder.
3. Create a Python environment and install dependencies:

```powershell
py -3 -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe -m ipykernel install --user --name sales-analysis --display-name "Sales Analysis"
```

4. Open notebook 01 and select the **Sales Analysis** kernel. Run All, then proceed 02 through 06. Markdown cells explain purpose, assumptions and interpretation. No screenshots need to be sent to use the project.
5. Alternatively launch JupyterLab using `.\.venv\Scripts\python.exe -m jupyterlab`.

For automated reruns, register the environment under the kernel name used by the runner and execute:

```powershell
.\.venv\Scripts\python.exe -m ipykernel install --user --name python3 --display-name "Python 3"
.\.venv\Scripts\python.exe run_all.py
```

On macOS/Linux use `python3 -m venv .venv`, then `.venv/bin/python` in place of the Windows executable above. Python 3.11 or 3.12 is a suitable starting point. Internet is only required to install dependencies; analysis uses local data.

## Contents
- `notebooks/01_data_quality.ipynb`: data audit, validation, feature preparation.
- `notebooks/02_sales_profitability.ipynb`: KPIs, category/product/region analysis.
- `notebooks/03_trends_customers.ipynb`: trends, YoY, concentration, RFM.
- `notebooks/04_discount_shipping.ipynb`: discount association, explicit scenario, dispatch analysis.
- `notebooks/05_sql_analysis.ipynb`: SQLite queries and pandas reconciliation.
- `notebooks/06_powerbi_exports.ipynb`: star-schema exports and computed findings.
- `reports/`: reference review, findings, actual chart PNGs and result CSVs.
- `powerbi/`: four CSV tables, DAX measures and dashboard instructions. No PBIX included.
- `data/`: original, cleaned and SQLite data. `src/`: reusable helpers.

## What you still need to do
Read the notebook explanations and computed findings, build the Power BI report using `powerbi/BUILD_GUIDE.md`, and personalize the business narrative. Use `reports/REFERENCE_REVIEW.md` to understand where the reference is strong and where conclusions need care. Before discussing the project in interviews, be able to explain grain, distinct orders, weighted margins, SQL windows, relationships and scenario assumptions.

## Attribution
Reference: https://github.com/PRemSHarma-00/sales-analysis, commit d8e1b7ee004268df691dfc338028ea574f2ff50d. Source dataset copied unchanged from `data/Superstore.csv` for this requested adaptation. See the reference review for scope and redistribution limitations. No reference PBIX, screenshots or notebook code are bundled.

## Replacing the dataset
This starter uses the source's exact column names and date format. Replace the raw file only with a schema-compatible file; otherwise update notebook 01 explicitly. Validation stops on invalid records instead of silently dropping them. Rerun all notebooks after any data change. Do not combine old exports with a new data source.
