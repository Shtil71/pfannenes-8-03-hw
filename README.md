# Домашнее задание к занятию "`SQL. Часть 2`" - `Пфанненштиль Евгений`


### Задание 1
Даны следующие таблицы:
stores (магазины): store_id, city
staff (сотрудники): staff_id, first_name, last_name, store_id
customers (покупатели): customer_id, store_id
Тогда решение задания следующее -

    SELECT 
        s.last_name, 
        s.first_name, 
        st.city, 
        COUNT(c.customer_id) AS customer_count
    FROM 
        stores st
    JOIN 
        staff s ON st.store_id = s.store_id
    JOIN 
        customers c ON st.store_id = c.store_id
    GROUP BY 
        st.store_id, s.staff_id
    HAVING 
        COUNT(c.customer_id) > 300;
  
### Задание 2
Представим, что есть таблица films с колонками film_id, title, length.
Тогда решение задания следующее -

    SELECT 
        COUNT(*) AS films_above_average_length
    FROM 
        films
    WHERE 
        length > (SELECT AVG(length) FROM films);
  
### Задание 3
Представим, что есть таблица payments с колонками payment_id, amount, payment_date, и таблица rentals с колонками rental_id, rental_date.
Тогда решение задания следующее -

    SELECT 
        EXTRACT(MONTH FROM p.payment_date) AS payment_month,
        SUM(p.amount) AS total_payments,
        COUNT(r.rental_id) AS rental_count
    FROM 
        payments p
    JOIN 
        rentals r ON p.rental_id = r.rental_id
    GROUP BY 
        EXTRACT(MONTH FROM p.payment_date)
    ORDER BY 
        total_payments DESC
    LIMIT 1;

