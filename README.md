# Olist E-Commerce Performance Analysis

**Business questions:**
1. Which product categories generate the most revenue?
2. Does late delivery affect customer review scores?
3. Which states have the most customers, and how much do they spend on average?

🔗 [View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/winlord.del.oeste/viz/OlistE-CommercePerformanceDashboard_17845301007780/Dashboard1)

---

## Data
- **Source:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) — public domain, CC0
- **Size:** 9 relational tables, ~100,000 orders from 2016–2018
- **Tables used:** `orders`, `order_items`, `products`, `product_category_translation`, `order_reviews`, `customers`

---

## Tools
- **PostgreSQL** — database setup, table creation, multi-table JOIN queries
- **Tableau Public** — interactive dashboard with bar charts and choropleth map

---

## Process
1. Created a PostgreSQL database (`olist_ecommerce`) and imported all 9 CSV files as relational tables
2. Wrote SQL queries joining multiple tables to answer each business question
3. Filtered all queries to `order_status = 'delivered'` to exclude cancelled and unavailable orders from analysis
4. Exported query results as CSVs and connected to Tableau Public for visualization
5. Built a multi-view dashboard combining all three analyses

---

## SQL Queries

### 1. Revenue by Product Category
Joins `order_items`, `products`, `product_category_translation`, and `orders` to calculate total revenue per English category name, filtered to delivered orders only.
→ [`revenue_by_category.sql`](revenue_by_category.sql)

### 2. Delivery Performance vs. Review Scores
Uses a CASE statement to classify each order as On Time or Late by comparing actual vs. estimated delivery dates, then calculates average review score per group.
→ [`delivery_vs_reviews.sql`](delivery_vs_reviews.sql)

### 3. Customer Behavior by State
Joins `customers`, `orders`, and `order_items` to count total orders and calculate average spend per Brazilian state.
→ [`customer_behavior_by_state.sql`](customer_behavior_by_state.sql)

---

## Findings

### Revenue by Category (Top 5)
| Category | Revenue (R$) |
|---|---|
| health_beauty | 1,233,132 |
| watches_gifts | 1,166,177 |
| bed_bath_table | 1,023,435 |
| sports_leisure | 954,853 |
| computers_accessories | 888,725 |

Health & beauty leads by a clear margin — nearly R$70K ahead of second place.

### Delivery Performance vs. Review Scores
| Delivery Status | Avg Review Score | Total Orders |
|---|---|---|
| On Time | 4.29 | 88,653 |
| Late | 2.57 | 7,708 |

Late deliveries result in a **1.72-point drop** in average review score on a 1–5 scale — a significant impact on customer satisfaction directly tied to logistics performance.

### Customer Orders by State (Top 5)
| State | Total Orders | Avg Spend (R$) |
|---|---|---|
| SP | 46,448 | 109.10 |
| RJ | 14,143 | 124.42 |
| MG | 12,916 | 120.20 |
| RS | 6,134 | 118.83 |
| PR | 5,649 | 117.91 |

São Paulo dominates in order volume (46,448 — nearly 3x more than second place Rio de Janeiro), but has the lowest average spend per order, suggesting a high-frequency, lower-ticket buyer profile compared to other states.

---

## Limitations
- Analysis covers delivered orders only — cancelled and unavailable orders (~1,200 combined) were excluded
- Revenue figures reflect item prices only and do not include freight costs
- Data covers 2016–2018 and may not reflect current market conditions
- State-level analysis uses customer billing state, not necessarily delivery location

---

## Next Steps
- Analyze revenue trends over time (monthly/quarterly) to identify seasonality
- Investigate which product categories have the highest late delivery rates
- Calculate freight cost as a percentage of order value by state
