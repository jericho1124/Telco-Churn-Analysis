/*most customers who churned has month-to-month contracts*/
SELECT 
	contract,
	COUNT(churn) AS total_churned,
	ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS churn_rate_pct
FROM dim_contract con
INNER JOIN fact_subscriptions sub
	ON con.customer_id = sub.customer_id
WHERE churn = True
GROUP BY 1
ORDER BY 3 DESC;






	