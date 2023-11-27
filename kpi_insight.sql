USE shopmall_db;

SELECT CASE WHEN age IS NULL THEN '무응답'
            WHEN age <= 15 THEN '0-15세'
            WHEN age <= 20 THEN '15-20세'
            WHEN age <= 25 THEN '20-25세'
            WHEN age <= 30 THEN '25-30세'
            WHEN age <= 35 THEN '30-35세'
            WHEN age <= 40 THEN '35-40세'
            WHEN age <= 45 THEN '40-45세'
            WHEN age >= 46 THEN '46세 이상'
       END age,
       COUNT(*) 
FROM shopmall_db.customers
GROUP BY 1
ORDER BY 2 DESC;
