-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT "quantity","description", "order_date"
FROM "line_items"
JOIN "orders" ON "line_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "line_items"."product_id";

-- 3. Which warehouses have cheetos?
SELECT "warehouse","description" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse","description" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name","last_name",sum("quantity") FROM "orders"
JOIN "addresses" ON "orders"."address_id" = "addresses"."id"
JOIN "customers" ON "addresses"."customer_id" = "customers"."id"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
GROUP BY "customers"."first_name", "customers"."last_name";

-- 6. How many customers do we have?
SELECT count(*) FROM "customers";

-- 7. How many products do we carry?
SELECT count(*) FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT sum("on_hand") FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "description" = 'diet pepsi';

-- STRETCH GOALS --

-- 9. How much was the total cost for each order?

-- 10. How much has each customer spent in total?

-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
