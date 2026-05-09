# Telco Customer Churn Analytics
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18-blue?logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-yellow?logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)

> An end-to-end churn analysis pipeline built with PostgreSQL and Power BI to identify at-risk customers and surface actionable retention insights for a telecom business.

---

## Problem Statement

A telecom company is losing roughly **1 in 4 customers** to churn, costing over **$139,000 in monthly recurring revenue**. This project analyzes **7,043 customer records** to understand who is churning, why, and which active customers are most at risk of leaving next.

---

## Tools Used

- **PostgreSQL** — Database design, data modeling, and SQL analysis
- **Power BI Desktop** — Interactive dashboard and data visualization

---

## Database Schema

Star schema with 4 tables inside the `analytics` schema:

```
fact_subscriptions (center)
├── dim_customer      — customer demographics
├── dim_contract      — contract type and billing info
└── dim_services      — subscribed services
```

> All dimension tables connect to `fact_subscriptions` via `customer_id` (FK).

---

## Key Findings

**Finding 1: Month-to-month customers are the highest churn risk**
- Evidence: Month-to-month customers churn at 42.71%, compared to 11.27% for one-year and 2.83% for two-year contract holders. They represent 88.55% of all churned customers despite being one of three contract types.
- Recommendation: Offer month-to-month customers a discounted upgrade to a one-year contract within their first 3 months before churn risk peaks.

**Finding 2: New customers are dramatically more likely to leave**
- Evidence: Customers with 0–9 months tenure churn at 50.43%, dropping to 29.07% at 9–29 months, 18.91% at 29–55 months, and just 7.73% for customers past 55 months. Customers who survive past 29 months almost never leave.
- Recommendation: Introduce an onboarding program with proactive check-ins and a loyalty reward at month 6 to push new customers past the high-risk window.

**Finding 3: Fiber optic customers represent the majority of revenue at risk**
- Evidence: Fiber optic customers account for $114,300 of the $139,130 total monthly revenue at risk — 82% of all churn losses — despite being a premium, higher-paying segment.
- Recommendation: Investigate fiber optic service quality and satisfaction. Launch a targeted retention campaign for fiber optic customers in their first year as they combine high charges with high churn risk.

---

## How to Run

1. Install PostgreSQL and create a database called `telco_churn`
2. Run `sql/01_create_schema.sql` to create all tables
3. Load `Telco-Customer-Churn.csv` into `analytics.stg_raw` using pgAdmin Import
4. Run `sql/02_load_data.sql` to populate dimension and fact tables
5. Run `sql/03_views.sql` to create all analytical views
6. Run `sql/04_analysis.sql` to reproduce all analysis queries
7. Open `telco_churn.pbix` in Power BI Desktop and refresh the data source

---

## Dashboard Screenshots

### Page 1 — Executive Report
<img width="1274" height="704" alt="Executive Report" src="https://github.com/user-attachments/assets/7a116c36-34c9-464f-b927-fce8407dfa6f" />

### Page 2 — Customer Segmentation
<img width="1274" height="710" alt="Customer Segmentation" src="https://github.com/user-attachments/assets/42fbc800-ce14-4ce5-89d7-6d5e376fa330" />

### Page 3 — Retention Opportunity
<img width="1274" height="712" alt="Action Page" src="https://github.com/user-attachments/assets/497de47a-991b-49bc-8d89-c6f950dfcb54" />

---

## Author

Built by **Jericho Layos** as a portfolio project demonstrating end-to-end data analytics using PostgreSQL and Power BI.
