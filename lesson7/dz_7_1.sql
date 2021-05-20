1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

-- за основу взял таблиру из ресурсов урока
SELECT DISTINCT u.name, u.birthday_at 
  FROM orders o
    JOIN users u
      ON o.user_id = u.id;
	  
2.Выведите список товаров products и разделов catalogs, который соответствует товару.

-- за основу взял таблиру из ресурсов урока
SELECT p.id, p.name, p.price, c.name 
  FROM products p
    JOIN catalogs c
      ON p.catalog_id = c.id;

3.(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.  
------------------------------------------------
-- создадим и заполним таблицы согласно заданию
------------------------------------------------
CREATE TABLE flihts (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(120),
  `to` VARCHAR(120)
) COMMENT = 'flihts';

INSERT INTO flihts 
  (id, `from`, `to`)
VALUES
  (1,'moscow','omsk'),
  (2,'novgorod','kazan'),
  (3,'irkutsk','moscow'),
  (4,'omsk','irkutsk'),
  (5,'moscow','kazan');

CREATE TABLE cities (
  label VARCHAR(120) PRIMARY KEY,
  name VARCHAR(120)
) COMMENT = 'cities';

INSERT INTO cities 
  (label, name)
VALUES
  ('moscow','Москва'),
  ('novgorod','Новгород'),
  ('irkutsk','Иркутск'),
  ('omsk','Омск'),
  ('kazan','Казань');
  
---------------------------------------------------------
-- выведем таблицу рейсов в руских наименованих городов
---------------------------------------------------------
SELECT 
  f.id, 
  c1.name as `from`,
  c2.name as `to`
FROM flihts f
    JOIN cities c1
      ON f.`from` = c1.label
    JOIN cities c2
      ON f.`to` = c2.label;