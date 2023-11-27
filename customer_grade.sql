USE shopmall_db;

SELECT  RANK() OVER(ORDER BY SUM(shopmall_db.orders.payment) DESC) AS rank_customer,
        shopmall_db.orders.customer_id AS customer_id,                                 
        shopmall_db.customers.customer_name AS name,                           
        shopmall_db.customers.gender AS gender,                                 
        shopmall_db.customers.age AS age,                                      
        shopmall_db.customers.home_address AS address,                    
        COUNT(shopmall_db.orders.customer_id) AS number_of_purchase,                     
        AVG(shopmall_db.orders.payment) AS average_payment,                             
        SUM(shopmall_db.orders.payment) AS sum_payment, 
        CASE WHEN SUM(shopmall_db.orders.payment) < 90000 THEN 'Bronze'
             WHEN SUM(shopmall_db.orders.payment) < 120000 THEN 'Silver'
             WHEN SUM(shopmall_db.orders.payment) < 150000 THEN 'Gold'
             WHEN SUM(shopmall_db.orders.payment) < 170000 THEN 'Platinum'
             WHEN SUM(shopmall_db.orders.payment) < 230000 THEN 'Titanium'
        END AS 'grade'
FROM shopmall_db.orders
INNER JOIN shopmall_db.customers
ON shopmall_db.orders.customer_id = shopmall_db.customers.customer_id
GROUP BY 2, 3, 4, 5, 6
LIMIT 4; -- Titanium 등급만 출력
