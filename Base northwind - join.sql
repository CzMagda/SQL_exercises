-- 1. Jakie są najwartościowsze zamówienia?
-- Wyświetl: identyfikator zamówienia, nazwę firmy klienta, datę zamówienia, ilość
-- pozycji zamówienia, kwotę zamówienia i pracownika wystawiającego
-- zamówienie. Pokaż wiersze o wartości większej i równej niż 10000, posortowane
-- od najświeższej daty.
SELECT 
orders.order_id, 
orders.order_date,
orders.employee_id, 
SUM (order_details.unit_price * order_details.quantity * (1- order_details.discount)) 
AS total_price,
customers.company_name,
COUNT(*)
FROM orders 
LEFT JOIN order_details ON orders.order_id = order_details.order_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY orders.order_id, orders.order_date, orders.employee_id,  customers.company_name
HAVING SUM (order_details.unit_price * order_details.quantity * (1- order_details.discount)) >= 10000
ORDER BY order_date DESC;


-- 2. Czyjego produktu sprzedajemy najwięcej?
-- Wyświetl: nazwę produktu, nazwę dostawcy, ilość produktu w magazynie,
-- wartość produktów w magazynie, ilość produktów na zamówieniach, wartość
-- produktów na zamówieniach. Pokaż tylko bieżące produkty, posortowane od
-- największej wartości produktów na zamówieniach.
SELECT 
products.product_name, 
suppliers.company_name, 
products.units_in_stock,
(products.unit_price * products.units_in_stock) AS stock_value_products,
products.units_on_order,
(products.units_on_order * products.unit_price) AS orders_value_products
FROM products 
LEFT JOIN suppliers ON products.supplier_id = suppliers.supplier_id
WHERE products.discontinued = 0
ORDER BY products.units_on_order * products.unit_price desc

-- 3. Czego może brakować w magazynie?
-- Wyświetl: nazwę kategorii, ilość produktów w kategorii w magazynie, wartość
-- produktów w kategorii w magazynie. Pokaż tylko aktywne produkty i o ilości
-- mniejszej od 11, posortowane od najmniejszej ilości.

SELECT categories.category_name,
products.units_in_stock,
(products.unit_price * products.units_in_stock) AS stock_value_products
FROM categories
LEFT JOIN products ON products.category_id = categories.category_id
WHERE products.discontinued = 0 AND products.units_in_stock < 11
ORDER BY products.units_in_stock;


-- 4. Dokąd wysyłamy poprzez “United Package”?
-- Wyświetl: identyfikator zamówienia, imię i nazwisko pracownika, kraj wysyłki,
-- region wysyłki, miasto wysyłki, nazwę firmy kurierskiej. Pokaż wszystkie
-- zamówienia wysłane poprzez “United Package”, posortowane od najświeższej daty
-- wysyłki.
SELECT 
orders.order_id, 
shippers.company_name,
employees.last_name,
employees.first_name,
orders.ship_country,
orders.ship_region,
orders.ship_city
FROM orders 
LEFT JOIN shippers ON orders.ship_via = shippers.shipper_id
LEFT JOIN employees ON orders.employee_id = employees.employee_id 
WHERE shippers.company_name = 'United Package'
ORDER BY orders.shipped_date DESC;






