# Домашнее задание к занятию "`Работа с данными (DDL/DML)`" - `Пфанненштиль Евгений`


### Задание 1
Для получения уникальных названий районов из таблицы с адресами, которые начинаются на "K" и заканчиваются на "a", и не содержат пробелов, можно использовать следующий SQL-запрос:

    SELECT DISTINCT district
    FROM address
    WHERE district LIKE 'K%a' 
      AND district NOT LIKE '% %';
  
### Задание 2
Для получения информации по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года включительно и стоимость которых превышает 10.00, можно использовать следующий SQL-запрос:


    SELECT *
    FROM payment
    WHERE payment_date BETWEEN '2005-06-15' AND '2005-06-18 23:59:59'
      AND amount > 10.00;
  
### Задание 3
Для получения последних пяти аренд фильмов можно использовать следующий SQL-запрос:


SELECT *
FROM rental
ORDER BY rental_date DESC
LIMIT 5;

### Задание 4
Для получения активных покупателей, имена которых "Kelly" или "Willie", с преобразованием букв в нижний регистр и заменой 'll' на 'pp' в именах, можно использовать следующий SQL-запрос:


    SELECT 
        LOWER(first_name) AS first_name, 
        LOWER(last_name) AS last_name,
        REPLACE(LOWER(first_name), 'll', 'pp') AS modified_first_name
    FROM customer
    WHERE active = 1 
          AND (first_name = 'Kelly' OR first_name = 'Willie');

