\# Telco Customer Churn Analytics



> An end-to-end churn analysis pipeline built with PostgreSQL and Power BI to identify at-risk customers and surface actionable retention insights for a telecom business.



\---



\## Problem Statement



A telecom company is losing roughly \*\*1 in 4 customers\*\* to churn, costing over \*\*$139,000 in monthly recurring revenue\*\*. This project analyzes \*\*7,043 customer records\*\* to understand who is churning, why, and which active customers are most at risk of leaving next.



\---



\## Tools Used



\- \*\*PostgreSQL\*\* — Database design, data modeling, and SQL analysis

\- \*\*Power BI Desktop\*\* — Interactive dashboard and data visualization



\---



\## Database Schema



Star schema with 4 tables inside the `analytics` schema:



```

fact\_subscriptions (center)

├── dim\_customer      — customer demographics

├── dim\_contract      — contract type and billing info

└── dim\_services      — subscribed services

```



> All dimension tables connect to `fact\_subscriptions` via `customer\_id` (FK).



\---



\## Key Findings



\*\*Finding 1: Month-to-month customers are the highest churn risk\*\*

\- Evidence: Month-to-month customers churn at 42.71%, compared to 11.27% 

&#x20; for one-year and 2.83% for two-year contract holders. They represent 

&#x20; 88.55% of all churned customers despite being one of three contract types.

\- Recommendation: Offer month-to-month customers a discounted upgrade to a 

&#x20; one-year contract within their first 3 months before churn risk peaks.



\*\*Finding 2: New customers are dramatically more likely to leave\*\*

\- Evidence: Customers with 0-9 months tenure churn at 50.43%, dropping to 

&#x20; 29.07% at 9-29 months, 18.91% at 29-55 months, and just 7.73% for 

&#x20; customers past 55 months. Customers who survive past 29 months almost 

&#x20; never leave.

\- Recommendation: Introduce an onboarding program with proactive check-ins 

&#x20; and a loyalty reward at month 6 to push new customers past the high-risk 

&#x20; window.



\*\*Finding 3: Fiber optic customers represent the majority of revenue at risk\*\*

\- Evidence: Fiber optic customers account for $114,300 of the $139,130 

&#x20; total monthly revenue at risk — 82% of all churn losses — despite being 

&#x20; a premium, higher-paying segment.

\- Recommendation: Investigate fiber optic service quality and satisfaction. 

&#x20; Launch a targeted retention campaign for fiber optic customers in their 

&#x20; first year as they combine high charges with high churn risk.



\---



\## How to Run



1\. Install PostgreSQL and create a database called `telco\_churn`

2\. Run `sql/01\_create\_schema.sql` to create all tables

3\. Load `Telco-Customer-Churn.csv` into `analytics.stg\_raw` using pgAdmin Import

4\. Run `sql/02\_load\_data.sql` to populate dimension and fact tables

5\. Run `sql/03\_views.sql` to create all analytical views

6\. Run `sql/04\_analysis.sql` to reproduce all analysis queries

7\. Open `telco\_churn.pbix` in Power BI Desktop and refresh the data source



\---



\## Dashboard Screenshots



\### Page 1 — Executive Report

!\[Customer Segmentation](screenshots/page2\_segmentation.png)



\### Page 2 — Customer Segmentation

!\[Customer Segmentation](screenshots/page2\_segmentation.png)



\### Page 3 — Retention Opportunity

!\[Retention Opportunity](screenshots/page3\_retention.png)



\---



\## Author



Built by \*\*Jericho Layos\*\* as a portfolio project demonstrating end-to-end data analytics using PostgreSQL and Power BI.
