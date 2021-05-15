--Практическое задание теме «Агрегация данных»

-- 1.Подсчитайте средний возраст пользователей в таблице users.

-- создаём и заполняем таблицу
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
 
-- первый запрос считает возраст  
SELECT name, birthday_at, timestampdiff(year, birthday_at, NOW()) as age from users;
-- считаем средний возраст по таблице с точностью 1 знак после запятой
SELECT ROUND( AVG(timestampdiff(year, birthday_at, NOW())) ,1) from users;

-- 2.Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
-- используем таблицу из предыдущего задания

-- промежуточный запрос - с датой рождения, днем рождения в этом году и днем недели этого дня
SELECT 
	name, 
	birthday_at, 
	DATE_FORMAT(birthday_at, "2021-%m-%d") as bith_day, 
	DAYNAME(DATE_FORMAT(birthday_at, "2021-%m-%d")) as week_day 
from users;

-- финальный запрос с группировкой по дню недели 
SELECT 
	COUNT(name), 
	DAYNAME(DATE_FORMAT(birthday_at, "2021-%m-%d")) as week_day 
from users
group by 
	DAYNAME(DATE_FORMAT(birthday_at, "2021-%m-%d"));

-- 3.(по желанию) Подсчитайте произведение чисел в столбце таблицы.

-- нагуглил что в интернете предлагют решить задачу подобного типа с помощью логарифма:
select exp(sum(log(value))) from table;
-- сам честно говоря не понимаю как можно решить такую задачу внутри запроса без подзапросов, 
-- я бы решал уже вне запроса в коде через цикл по результат запроса))



