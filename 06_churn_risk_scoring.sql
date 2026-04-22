/*this tells us which customer is most likely to churn*/

CREATE VIEW vw_churn_risk_scores AS 
SELECT
	customer_id,
	(CASE WHEN contract = 'Month-to-month' THEN 2 ELSE 0 END 
	+ CASE WHEN online_security = 'No' THEN 1 ELSE 0 END
	+ CASE WHEN tenure < 12 THEN 1 ELSE 0 END
	+ CASE WHEN internet_service = 'Fiber optic' THEN 1 ELSE 0
	END) AS risk_score
FROM analytics.vw_churn_summary
WHERE churn = False
ORDER BY risk_score DESC;
