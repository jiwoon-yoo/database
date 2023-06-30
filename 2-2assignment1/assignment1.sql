--Q1
CREATE OR REPLACE VIEW ex1 AS 
SELECT ct.name, ct.address, pd.product_name, oi.quantity, (oi.quantity * oi.unit_price) AS total_amount
FROM ot.customers ct INNER JOIN ot.orders od ON ct.customer_id = od.customer_id
INNER JOIN ot.order_items oi ON od.order_id = oi.order_id 
INNER JOIN ot.products pd ON oi.product_id = pd.product_id
WHERE od.status IN('Canceled', 'Shipped') AND EXTRACT(YEAR FROM od.order_date) = '2016' 

SELECT * from ex1 

--Q2
select product_name
FROM ot.orders o INNER JOIN ot.order_items i ON o.order_id = i.order_id 
INNER JOIN ot.products p ON i.product_id = p.product_id 
INNER JOIN ot.inventories it ON p.product_id = it.product_id  
where i.quantity > 0
GROUP BY product_name 
INTERSECT 
select product_name
FROM ot.orders o INNER JOIN ot.order_items i ON o.order_id = i.order_id 
INNER JOIN ot.products p ON i.product_id = p.product_id 
INNER JOIN ot.inventories it ON p.product_id = it.product_id  
where o.status = 'Shipped'
GROUP BY product_name 

--Q3
SELECT salesman_id, order_date, COUNT(customer_id)
FROM ot.orders 
GROUP BY GROUPING SETS((salesman_id, order_date), (salesman_id),(order_date), ())  

--Q4
SELECT warehouse_name, address, region_name 
FROM ot.warehouses wh INNER JOIN ot.locations lc ON wh.location_id = lc.location_id INNER JOIN ot.countries ct ON lc.country_id = ct.country_id INNER JOIN ot.regions rg ON ct.region_id = rg.region_id
WHERE rg.region_name = 'Americas'
ORDER BY 1 desc 










-----------------------------solution 
--q1
create view vwsales as
select name, address, order_date, product_name, sum(quantity) as "total qty", 
sum(quantity* unit_price) as "Total Amount", status 
from ot.customers c join ot.orders o on c.customer_id=o.customer_id
join ot.order_items t on o.order_id=t.order_id join
ot.products p on t.product_id=p.product_id
where status in ('Shipped','Cancelled') and to_char(order_date,'yyyy')='2016'
group by name, address, order_date, product_name, status ;


--q2
select distinct product_name 
from ot.products p  
join ot.order_items o on o.product_id=p.product_id 
Intersect
select  distinct product_name 
from ot.products p  
join ot.inventories i  on i.product_id=p.product_id
join ot.warehouses w  on i.warehouse_id=i.warehouse_id
where quantity>0;


--q3
select  first_name,order_date,count(name) 
from ot.employees e  
join ot.orders o on e.employee_id=o.salesman_id 
join ot.customers c on o.customer_id=c.customer_id
group by Grouping sets((first_name),(first_name,order_date),())


--q4
select warehouse_name, postal_code,city,region_name 
from ot.warehouses w 
join ot.locations l on w.location_id=l.location_id
join ot.countries c on l.country_id=c.country_id
join ot.regions r on c.region_id=r.region_id
where Region_name like 'America%';


