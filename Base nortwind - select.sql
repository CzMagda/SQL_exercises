-- 1.Lista produktów o cenie wyższej niż 100:

SELECT product_id, product_name, unit_price 
FROM products
WHERE unit_price > 100;

-- 2.Lista pracowników posortowana rosnąco po imieniu:

SELECT employee_id, last_name, first_name
FROM employees
ORDER BY first_name;

-- 3.Lista nazw klientów i osób kontaktowych posortowana po nazwie klienta:

SELECT company_name, contact_name
FROM customers
ORDER BY company_name;

-- 4.Lista pracowników pogrupowana po kraju. 
-- Pola kraj i ilość osób z danego kraju:

SELECT count (*) quantity, country
FROM employees
GROUP BY  country;

-- 5.Lista zamówień z ilością pozycji na zamówieniu:

SELECT order_id, COUNT (*)
FROM order_details
GROUP BY order_id;

-- 6.Lista 10 najdroższych pozycji ze wszystkich zamówień:

SELECT SUM (order_details.unit_price * order_details.quantity * (1- order_details.discount)) 
AS total_price, order_id
FROM order_details
GROUP BY order_id
ORDER BY total_price DESC
LIMIT 10;