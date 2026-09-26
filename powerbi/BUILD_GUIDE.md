# Build your own Power BI report

1. Run all notebooks (the included CSVs are already generated). In Power BI Desktop use Get Data > Text/CSV and import the four files in `powerbi/data`.
2. Name tables exactly FactSales, DimProduct, DimCustomer and DimDate. Set dates to Date, monetary values to Decimal Number, keys/counts to Whole Number, IDs and Postal Code to Text. Discount is a decimal fraction. Use an English (United States) locale if parsing is ambiguous.
3. Create one-to-many, single-direction relationships: DimProduct[ProductKey] → FactSales[ProductKey]; DimCustomer[Customer ID] → FactSales[Customer ID]; DimDate[Date] → FactSales[Order Date]. Remove unwanted automatic relationships. Keep Ship Date unrelated for this starter.
4. Mark DimDate as the date table using Date. Sort Month by Month Number; use Year Month for chronological multi-year trends.
5. Create each measure in measures.dax separately. Format amounts as USD and ratio measures as percentages. Do not multiply percentage measures by 100 again.
6. Build the following pages. Use measures, not summed per-category order counts. Add Date, Region, Category and Segment slicers as appropriate.

| Page | Visuals |
|---|---|
| Executive overview | Sales, Profit, Margin, Orders and AOV cards; monthly sales line; category sales bars; segment sales |
| Product profitability | Sub-category profit bars; sales-versus-profit product scatter; discount band matrix with sales, profit and line counts |
| Regional analysis | Region sales/profit bars; state profitability table with conditional formatting; state × sub-category matrix |
| Trends and customers | Monthly sales/profit charts; YoY cards; customer sales table; repeat customer card |

7. Reconcile unfiltered cards to `reports/tables/kpis.csv`. Check a category filter against `category.csv`. Check that Year 2014 has no prior-year comparison. Test cross-filters and reset all slicers before saving.
8. Save your own `sales_analysis.pbix`. This package intentionally contains no copied PBIX or screenshots. The PNGs in reports/figures are actual Python charts, not Power BI screenshots.

No returns, customer gender, inventory or delivery date is present. Do not add visuals implying those fields exist. YoY comparisons of a partial year need the matching prior-year period.
