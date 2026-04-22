/*deciding the buckets per customer
	118.75 as high value
	89.85 as mid value
	and 35.50 as low value*/
	
WITH CTE AS (
SELECT
	customer_id,
	monthly_charges,
	NTILE(4) OVER(ORDER BY monthly_charges) AS value_segment
FROM fact_subscriptions
)

SELECT
	MAX(monthly_charges) AS max_monthly_charges,
	CASE
		WHEN value_segment = 4 THEN 'High Value'
		WHEN value_segment IN (2, 3) THEN 'Mid Value'
		ELSE 'Low Value'
	END AS buckets
FROM cte
GROUP BY 2
ORDER BY 1 DESC;


/*churn pct of all high value customers is 33.17 %
	and mid value customers is 30.81
	and low value customers is 10.89*/

CREATE OR REPLACE VIEW analytics.vw_customer_value_segmentation AS
SELECT
	CASE
		WHEN monthly_charges <= 35 THEN 'Low Value'
		WHEN monthly_charges <= 89 THEN 'Mid Value'
		ELSE 'High Value'
	END AS segment,
	COUNT(*) AS total,
	ROUND(100.0 * COUNT(*) FILTER(WHERE churn = True) / COUNT(*), 2) AS churn_pct
FROM fact_subscriptions
GROUP BY 1
ORDER BY churn_pct DESC;






