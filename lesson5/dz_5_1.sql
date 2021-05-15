--Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

-- 1.Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

-- создадим таблицу согласно условиям дз
CREATE TABLE user1 (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "Название статуса (уникально)",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник users 1";
SELECT * from user1;
INSERT IGNORE INTO user1 (name) VALUES ('John'),('Alice'),('Ben');
UPDATE user1 SET created_at = NULL , updated_at = NULL;

-- заполним пустые значения
UPDATE user1 SET updated_at = NOW() WHERE updated_at IS NULL; 
UPDATE user1 SET created_at = NOW() WHERE created_at IS NULL;

-- 2.Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое 
-- время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

-- создадим таблицу согласно условиям дз
CREATE TABLE user2 (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "Название статуса (уникально)",
  created_at VARCHAR(20)  DEFAULT "20.10.2017 8:10" COMMENT "Время создания строки",  
  updated_at VARCHAR(20)  DEFAULT "20.10.2017 8:10" COMMENT "Время обновления строки"
) COMMENT "Справочник users 2";
SELECT * from user2;
INSERT IGNORE INTO user2 (name) VALUES ('John'),('Alice'),('Ben');

-- добавим новые колонки и перенесём туда значения
ALTER TABLE user2 
      ADD COLUMN created_at2 VARCHAR(20),
      ADD COLUMN updated_at2 VARCHAR(20);
UPDATE user2 SET created_at2 = created_at , updated_at2 = updated_at; 
-- очистим и модифицируем тип колонок
UPDATE user2 SET created_at = NULL , updated_at = NULL;
ALTER TABLE user2 MODIFY COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
ALTER TABLE user2 MODIFY COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
-- трансформируем данные и перенесём значения
UPDATE user2 SET created_at = STR_TO_DATE(created_at2, '%d.%m.%Y %h:%i');
UPDATE user2 SET updated_at = STR_TO_DATE(updated_at2, '%d.%m.%Y %h:%i');
-- удалим служебные колонки
ALTER TABLE user2 DROP created_at2;
ALTER TABLE user2 DROP updated_at2;

-- 3.В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, 
-- если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
-- Однако нулевые запасы должны выводиться в конце, после всех записей.

-- создадим таблицу согласно условиям дз
CREATE TABLE storehouses_products (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "запас",
  value INT NOT NULL COMMENT "количество"
) COMMENT "таблица складских запасов";
INSERT IGNORE INTO storehouses_products (name, value) VALUES 
('товар1', 0),
('товар2', 2500),
('товар3', 0),
('товар4', 30),
('товар5', 500),
('товар6', 1);
SELECT * from storehouses_products;

-- сформируем вывод согласно требованиям задачи
SELECT * FROM storehouses_products order by case when VALUE = 0 then 99999999 end, value;

-- 4.(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)


-- 5.(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.


