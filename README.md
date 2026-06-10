# superstore-sql-analysis
SQL analysis of Superstore retail dataset identifying margin erosion patterns across categories, regions, and discount bands.

Queried the Superstore retail dataset (9,994 transactions) using SQL to identify margin erosion patterns across product categories, regions, and discount behaviours.

Dataset

Source: [Superstore Sales Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) — a widely-used public retail dataset modelled on a US office-supplies retailer.

Field                  Description 
Order_ID               Unique order identifier 
Customer_ID            Name Customer reference 
Segment                Consumer, Corporate, Home Office 
Region                 West, East, Central, South 
Category               Sub_Category` | Product hierarchy |
Sales                  Revenue per line item 
Profit                 Profit per line item 
Discount               Discount applied (0–1 decimal) 
Quantity               Units sold 



Queries & Findings

Query 1 — Revenue & Profit by Category
File: queries/01_revenue_by_category.sql

Furniture generates £742k revenue but only a **2.5% profit margin**, vs 17.4% for Technology. Despite similar revenue, Furniture carries a 17.4% average discount — the highest of any category.

| Category | Total Orders | Total Revenue | Total Profit | Profit Margin | Avg Discount |
|---|---|---|---|---|---|
| Technology | 1,544 | £836,154.03 | £145,454.95 | 17.4% | 13.2% |
| Office Supplies | 3,742 | £719,047.03 | £122,490.80 | 17.0% | 15.7% |
| Furniture | 1,764 | £741,999.80 | £18,451.27 | **2.5%** | **17.4%** |

---

Query 2 — Regional Performance
File: queries/02_regional_performance.sql

The **Central region** has the worst margin (7.9%) despite having a significant transaction volume. The West region generates the highest profit margin (14.9%) and the best revenue per customer (£1,057.52). 

| Region | Total Orders | Total Sales | Total Profit | Profit Margin | Revenue/Customer |
|---|---|---|---|---|---|
| West | 1,611 | £725,457.82 | £108,418.45 | 14.9% | £1,057.52 |
| East | 1,401 | £678,781.24 | £91,522.78 | 13.5% | £1,007.09 |
| South | 822 | £391,721.91 | £46,749.43 | 11.9% | £765.08 |
| Central | 1,175 | £501,239.89 | £39,706.36 | **7.9%** | £796.88 |

---

Query 3 — Discount Band vs Margin Erosion
File: queries/03_discount_bands.sql

Discounts above 20% are **actively loss-making**. The 31%+ band destroys over £125k of profit despite generating £259.5k in revenue across 1,166 transactions. Non-discounted sales yield the highest profit margin at 29.5%.

| Discount Band | Transactions | Total Revenue | Total Profit | Profit Margin |
|---|---|---|---|---|
| No Discount | 4,498 | £1,087,908.47 | £320,987.60 | +29.5% |
| 1–10% | 94 | £54,369.35 | £9,029.18 | +16.6% |
| 11–20% | 3,709 | £792,152.89 | £91,756.30 | +11.6% |
| 21–30% | 227 | £103,226.65 | -£10,369.28 | **-10.0%** |
| 31%+ | 1,166 | £259,543.49 | -£125,006.78 | **-48.2%** |

---

Query 4 — Loss-Making Sub-Categories *(uses subquery)
File: queries/04_loss_making_subcategories.sql

Three sub-categories are net loss-makers, heavily driven by aggressive discounting. **Tables** alone accounts for a loss of -£17,725.48, dragging down the performance of the entire Furniture category.

| Sub-Category | Total Revenue | Total Profit |
|---|---|---|
| Tables | £206,965.53 | **-£17,725.48** |
| Bookcases | £114,880.00 | **-£3,472.56** |
| Supplies | £46,673.54 | **-£1,189.10** |

---

## Key Takeaways

1. Furniture’s margin is being significantly eroded by the highest discount rate among all categories, resulting in a compressed margin of 2.5% compared to 17% for Technology and Office Supplies.
2. South is more efficient with fewer orders, while Central has nearly double the orders but a worse margin. This suggests a discounting or product-mix issue, not a demand issue.
3. Discounts exceeding 20% lead to losses, particularly in the 31%+ range, as seen in 1,166 transactions generating £259k in revenue but incurring a £125k loss.
4. Tables generate £207,000 in revenue but lose £17,000, as a low 2.5% category profit margin makes large furniture sub-categories like tables and bookcases unprofitable.

---

## SQL Techniques Demonstrated

- `GROUP BY` with multiple aggregations (`SUM`, `COUNT DISTINCT`, `AVG`, `ROUND`)
- `CASE WHEN` for custom bucketing (discount bands, customer segments)
- Subqueries for multi-level aggregation
- `ORDER BY` on computed expressions

---

## Author

Built as part of a data analysis portfolio. Dataset is publicly available; all queries are original.
