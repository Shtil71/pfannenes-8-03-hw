# Домашнее задание к занятию "`Защита Хоста`" - `Пфанненштиль Евгений`


### Задание 1

    sudo apt-get update
    sudo apt-get install ecryptfs-utils
    sudo adduser cryptouser
    sudo -i -u cryptouser
    ecryptfs-migrate-home -u cryptouser

![u1](https://github.com/user-attachments/assets/a695c0e0-9f06-43e8-a7cb-0efcc86bceb1)


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
