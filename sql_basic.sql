--1

---a
SELECT SUM(price_per_kg*quantity) AS revenue_345
FROM sales
WHERE store_city_id IN (3,4,5) AND price_per_kg > 11000

---b
SELECT SUM(price_per_kg*quantity) AS revenue_fitr
FROM sales
WHERE purchase_date > '2022-05-02'

---c
SELECT SUM(price_per_kg*quantity) AS revenue_ORMA
FROM sales
WHERE product_name IN ('Jeruk','Mangga') 
AND store_city_id NOT IN (1,6,7)

--2 
---a
SELECT employee_id,
	   CONCAT(first_name, ' ',last_name) as full_name,
	   email,
	   department,
	   hire_date,
	   salary_2021
FROM employees

---b
SELECT CONCAT(first_name, ' ',last_name) AS full_name
FROM employees
WHERE store_city_id IN (3,4,7) AND salary_2022 > 5000



--3

SELECT product_name, 
	   SUM(quantity) AS total_qty
FROM sales
WHERE product_name IN ('Mangga','Apel')
	  AND purchase_date BETWEEN '2022-05-03'AND '2022-05-23'
GROUP BY 1
ORDER BY 2 DESC


--4
SELECT * FROM employees
WHERE store_city_id IN (SELECT store_city_id FROM region
					   WHERE region IN ('Bali','Yogyakarta'))

SELECT * FROM sales
ORDER BY purchase_date
SELECT * FROM region



SELECT * 
FROM employees e
INNER JOIN (SELECT * FROM region
		    WHERE region IN ('Bali','Yogyakarta') 
		   ) r
ON e.store_city_id = r.store_city_id
ORDER BY 1


--5
SELECT provinsi,
	   SUM(quantity*price_per_kg) AS total_penjualan
FROM sales s
INNER JOIN (
			SELECT *,
				  CASE
					WHEN region IN ('Sumatera','Sulawesi',
									'Bali','Kalimantan')THEN 'Luar Jawa'
					ELSE 'Jawa'
				  END as provinsi
			FROM region
			) r
ON s.store_city_id = r.store_city_id
GROUP BY 1
ORDER BY 2 DESC



		   