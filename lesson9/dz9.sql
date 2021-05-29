----------------------------------------------------------------------
-- ПРАКТИЧЕСКОЕ ЗАДАНИЕ ПО ТЕМЕ “Транзакции, переменные, представления”
----------------------------------------------------------------------
1.В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.*/
------------------------------------------------ 
-- подготовим таблицу 
------------------------------------------------ 
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
------------------------------------------------ 
-- выполняем задание 
------------------------------------------------ 
START TRANSACTION;  -- начинаем транзакцию

INSERT INTO sample.users (name, birthday_at)   -- добавляем строку в таблицу
	SELECT u.name, u.birthday_at FROM shop.users as u WHERE u.id = 1;
DELETE FROM shop.users as u WHERE u.id = 1;  -- удаляем строку

COMMIT;  -- завершаем 

-- 2.Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
------------------------------------------------ 
-- подготовим таблицу 
------------------------------------------------ 
use shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
  
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, desription, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);
  
------------------------------------------------ 
-- выполняем задание 
------------------------------------------------ 
  
 CREATE VIEW name_cat_prod AS  -- создаём представление
 	SELECT p.name as p_name, c.name as c_name 
  	FROM products p 
 	JOIN catalogs c ON p.catalog_id = c.id;
 
 SELECT * FROM name_cat_prod;  -- демонстрируем созданную таблицу

/*3.(по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', 
'2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует 
в исходном таблице и 0, если она отсутствует. */

------------------------------------------------ 
-- подготовим таблицы 
------------------------------------------------

CREATE TABLE price (
  id SERIAL PRIMARY KEY,
  price INT COMMENT 'Цена',
  created_at DATE 
) COMMENT = 'История цен';

INSERT INTO price (price, created_at) VALUES
  (12, '2018-08-01'),
  (23, '2018-08-04'),
  (34, '2018-08-16'),
  (24, '2018-08-17');
 
SELECT * FROM price;

------------------------------------------------ 
-- выполняем задание 
------------------------------------------------
CREATE TEMPORARY TABLE days (d DATE NOT NULL PRIMARY KEY);  -- создадим временную таблицу

INSERT INTO days
VALUES  ('2018-08-01'),('2018-08-02'),('2018-08-03'),('2018-08-04'),('2018-08-05'),
		('2018-08-06'),('2018-08-07'),('2018-08-08'),('2018-08-09'),('2018-08-10'),
		('2018-08-11'),('2018-08-12'),('2018-08-13'),('2018-08-14'),('2018-08-15'),
		('2018-08-16'),('2018-08-17'),('2018-08-18'),('2018-08-19'),('2018-08-20'),
		('2018-08-21'),('2018-08-22'),('2018-08-23'),('2018-08-24'),('2018-08-25'),
		('2018-08-26'),('2018-08-27'),('2018-08-28'),('2018-08-29'),('2018-08-30'),('2018-08-31');  -- наполним её датами

SELECT * from days;
-- выведем результат согласно задачи
SELECT d.d, p.created_at is not null
from days d
LEFT JOIN price p ON d.d = p.created_at;

/*4.(по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей. */

--  поместим id последних 5 записей во временную таблицу
CREATE TEMPORARY TABLE last_str (id INT NOT NULL PRIMARY KEY);

INSERT INTO last_str
	SELECT id FROM price ORDER BY created_at DESC LIMIT 5;	
SELECT * from last_str;
-- удалим записи из таблицы за исключением этих записей
DELETE FROM price WHERE id not in (SELECT id from last_str);

/* 
При попытке удалить записи без промежуточной таблицы получил интересное сообщение - что подобные запросы не поддерживаются "пока что":
This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'
*/

----------------------------------------------------------------------
-- ПРАКТИЧЕСКОЕ ЗАДАНИЕ ПО ТЕМЕ “Администрирование MySQL” (эта тема изучается по вашему желанию)
----------------------------------------------------------------------

1.Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
второму пользователю shop — любые операции в пределах базы данных shop.*/

CREATE USER shop;
GRANT ALL ON shop.* TO shop;  -- любые операции
GRANT GRANT OPTION ON shop.* TO shop;  -- назначение прав 

CREATE USER shop_read;
GRANT SELECT ON shop.* TO shop_read; -- только просмотр

/*2.(по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, имя пользователя и его пароль. 
Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. Создайте пользователя user_read, который бы не имел доступа к таблице accounts,
однако, мог бы извлекать записи из представления username. */

CREATE VIEW username AS
	SELECT id, name FROM accounts;
	
CREATE USER user_read;
GRANT SELECT ON shop.* TO user_read;
REVOKE SELECT ON shop.accounts TO user_read;	

----------------------------------------------------------------------
-- ПРАКТИЧЕСКОЕ ЗАДАНИЕ ПО ТЕМЕ “Хранимые процедуры и функции, триггеры"
----------------------------------------------------------------------

/*1.Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/

CREATE FUNCTION shop.hello()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE H INT DEFAULT 0;
	SET H = HOUR(NOW());
	IF H < 6 THEN
		RETURN 'Доброй ночи';
	ELSE
		IF H < 12 THEN
			RETURN 'Доброе утро';
		ELSE
			IF H < 18 THEN
				RETURN 'Добрый день';
			ELSE
				RETURN 'Добрый вечер';
			END IF;
		END IF;
	END IF; 
END

/*2.В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. 
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
При попытке присвоить полям NULL-значение необходимо отменить операцию. */

CREATE DEFINER=`root`@`%` TRIGGER `products_test` BEFORE INSERT ON `products` FOR EACH ROW BEGIN
  IF NEW.name is NULL THEN
	  IF NEW.desription is NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Не заполнены поля name и description';
	  END IF;
  END IF;
END

/*3.(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. Числами Фибоначчи называется последовательность в которой
 число равно сумме двух предыдущих чисел. Вызов функции FIBONACCI(10) должен возвращать число 55. */



