-- vw_churn_summary
CREATE VIEW analytics.vw_churn_summary AS
SELECT 
    dc.customer_id,
    dc.gender,
    dc.senior_citizen,
    dc.partner,
    dc.dependents,
    dct.contract,
    dct.paperless_billing,
    dct.payment_method,
    ds.phone_service,
    ds.multiple_lines,
    ds.internet_service,
    ds.online_security,
    ds.online_backup,
    ds.device_protection,
    ds.tech_support,
    ds.streaming_tv,
    ds.streaming_movies,
    fs.tenure,
    fs.monthly_charges,
    fs.total_charges,
    fs.churn
FROM analytics.dim_customer dc
JOIN analytics.dim_contract dct  ON dc.customer_id = dct.customer_id
JOIN analytics.dim_services ds   ON dc.customer_id = ds.customer_id
JOIN analytics.fact_subscriptions fs ON dc.customer_id = fs.customer_id;


-- vw_high_risk_customers
CREATE VIEW analytics.vw_high_risk_customers AS
SELECT *
FROM analytics.vw_churn_summary
WHERE contract = 'Month-to-month'
  AND tenure < 12
  AND online_security = 'No'
  AND churn = FALSE;