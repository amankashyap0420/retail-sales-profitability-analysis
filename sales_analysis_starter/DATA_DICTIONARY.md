# Data dictionary and metric contract

Source file: data/raw/Superstore.csv. Historical US Superstore sample, 2014–2017; not a live commercial dataset. Grain: an order line.

| Fields | Meaning / treatment |
|---|---|
| Row ID | Unique order-line identifier; primary validation key |
| Order ID | Order identifier; repeats across products |
| Order Date, Ship Date | Source month/day/year; exported ISO dates |
| Ship Mode | Dispatch service category |
| Customer ID, Customer Name | Use ID for grouping; name is a display label |
| Segment | Source customer segment |
| Country, City, State, Postal Code, Region | Order geography; postal code is text |
| Product ID, Product Name | Product descriptors; ID alone may not uniquely identify a name |
| Category, Sub-Category | Product classification |
| Sales | Source line sales in USD; assumed already discounted |
| Quantity | Positive whole units |
| Discount | Fraction, e.g. 0.2 means 20% |
| Profit | Source line profit; negative values retained |
| Year, Month Start | Derived from Order Date |
| Ship Days | Ship Date minus Order Date; dispatch delay, not delivery time |
| Loss Flag | 1 when line Profit < 0 |
| Discount Band | 0%, >0–20%, >20–40%, >40% |
| ProductKey | Generated surrogate key for the full product descriptor combination |

Margin = sum Profit / sum Sales. AOV = sum Sales / distinct Order ID. Repeat share = customers with >1 distinct order / all observed customers. All denominators depend on active filters. Monetary values retain source precision until presentation; no fabricated cost or returns fields are added.
