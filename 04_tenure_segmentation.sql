WITH CTE AS (
SELECT 
	customer_id,
	churn,
	tenure,
	NTILE(4) OVER(ORDER BY tenure) AS tenure_quartile
FROM fact_subscriptions
)
SELECT
	tenure_quartile,
	MIN(tenure) AS min_months,
	MAX(tenure) AS max_months,
	ROUND(100.0 * COUNT(*) FILTER (WHERE churn = True) / COUNT(*), 2) AS churn_pct
FROM cte
GROUP BY 1
ORDER BY 1