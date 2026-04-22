/*total customer count is 7043*/
SELECT 
	COUNT(*) AS customer_count
FROM fact_subscriptions;


/*total churned customers
	active is 5174
	inactive is 1869*/
SELECT 
	CASE
		WHEN churn = True THEN 'inactive'
		ELSE 'active'
	END AS segment,
	COUNT(*) AS total_churned
FROM fact_subscriptions
GROUP BY 1
ORDER BY 2 DESC;



/* total churned customers and churn rate percentage 
	churn rate pct is 26.54% */
SELECT 
	CASE
		WHEN churn = True THEN 'inactive'
		ELSE 'active'
	END AS segment,
	COUNT(*) AS total_churned,
	ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS churn_rate_pct
FROM fact_subscriptions
GROUP BY 1
ORDER BY 2 DESC;























