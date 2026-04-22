SELECT
ds.internet_service,
ROUND(SUM(fs.monthly_charges), 2) AS revenue_at_risk
FROM analytics.fact_subscriptions fs
JOIN analytics.dim_services ds USING (customer_id)
WHERE fs.churn = TRUE
GROUP BY ds.internet_service
ORDER BY revenue_at_risk DESC;