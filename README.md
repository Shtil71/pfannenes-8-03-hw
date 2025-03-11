# Домашнее задание к занятию "`Индексы`" - `Пфанненштиль Евгений`


### Задание 1

Запрос:

    SELECT 
        (SUM(pg_total_relation_size(indexrelid)) * 100.0 / SUM(pg_total_relation_size(relid))) AS index_to_table_size_ratio
    FROM 
        pg_index
    JOIN 
        pg_class ON pg_index.indrelid = pg_class.oid
    WHERE 
        pg_class.relkind = 'r';  -- учитываем только таблицы (relkind = 'r')
  
### Задание 2

Узкие места - DISTINCT, Оконная функция SUM с PARTITION BY, Использование date(p.payment_date) и отсутсвие индексов.

Оптимизированная версия запроса:

    -- Создание индексов (если их нет)
    CREATE INDEX idx_payment_date ON payment(payment_date);
    CREATE INDEX idx_rental_date ON rental(rental_date);
    CREATE INDEX idx_customer_id ON customer(customer_id);
    CREATE INDEX idx_inventory_id ON inventory(inventory_id);

    -- Оптимизированный запрос
    EXPLAIN ANALYZE
    SELECT 
        concat(c.last_name, ' ', c.first_name) AS customer_name,
        SUM(p.amount) AS total_amount
    FROM 
        payment p
    JOIN 
        rental r ON p.payment_date = r.rental_date
    JOIN 
        customer c ON r.customer_id = c.customer_id
    JOIN 
        inventory i ON r.inventory_id = i.inventory_id
    WHERE 
        p.payment_date >= '2005-07-30' AND p.payment_date < '2005-07-31'
    GROUP BY 
        c.customer_id, c.last_name, c.first_name;
