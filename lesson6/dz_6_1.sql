1.Проанализировать запросы, которые выполнялись на занятии, 
определить возможные корректировки и/или улучшения (JOIN пока не применять).

-- повторил тексты запросов урока на копии базы, вопросов и замечаний не возникло
-- разве что я бы поменял немного синтаксис запроса - 
SELECT
  first_name,
  last_name,
  (SELECT name FROM cities WHERE id = 
    (SELECT city_id FROM profiles WHERE user_id = 9)) AS city,
  (SELECT filename FROM media WHERE id = 
    (SELECT photo_id FROM profiles WHERE user_id = 9)
  ) AS file_path
  FROM users
    WHERE id = 9;   
-- я бы переписал на одноразовое указание внешней переменной "9", 
-- т.к. если потребуется переписать запрос такой вариант проще исправить для другого id
SELECT
  first_name,
  last_name,
  (SELECT name FROM cities WHERE id = 
    (SELECT city_id FROM profiles WHERE user_id = users.id)) AS city,
  (SELECT filename FROM media WHERE id = 
    (SELECT photo_id FROM profiles WHERE user_id = users.id)
  ) AS file_path
  FROM users
    WHERE id = 9; 

2.Пусть задан некоторый пользователь.Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

-- список пользователей кто больше всего писал выбранному пользователю, по убыванию
SELECT
  COUNT(id) AS kol_message,
  from_user_id 
FROM messages
WHERE to_user_id = 74
GROUP BY from_user_id 
ORDER BY kol_message DESC;
-- если мы хотим видеть ТОЛЬКО того кто больше всех общался
-- LIMIT 1;

3.Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- за основу берем таблицу profiles которую сортуруем по дню рождения, берем 10 записей
-- эти записи добавляем счетчиками лайков
SELECT user_id,
    birthday,
	(SELECT first_name FROM users WHERE id = profiles.user_id) AS name,
	(SELECT COUNT(id) FROM likes WHERE target_id = profiles.user_id) AS kol_likes
FROM profiles
ORDER BY birthday DESC 
LIMIT 10;

4.Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- добавлем таблицу лайков полом юзера и группируем по нему кол-во записей
SELECT 
    COUNT(id), 
	(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender
FROM likes
ORDER BY gender;

5.Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

-- берем за основу таблицу юзеров, т.к. может не быть никакой активности
-- добавляем к ней счетчики лайков,сообщений и постов 
SELECT id,
       first_name AS name,
       (SELECT COUNT(id) FROM likes WHERE user_id = users.id) AS kol_likes,
       (SELECT COUNT(id) FROM messages WHERE from_user_id = users.id) AS kol_message,      
       (SELECT COUNT(id) FROM posts WHERE user_id = users.id) AS kol_posts
FROM users

-- используем полученную в предыдущем запросе таблицу за основу
-- складываем все активности, сортуруем по ним и выводим первые 10 записей
SELECT 
    tab.id,
    tab.name,
    (tab.kol_likes + tab.kol_message + tab.kol_posts) AS act
FROM 
	(SELECT id,
	       first_name AS name,
	       (SELECT COUNT(id) FROM likes WHERE user_id = users.id) AS kol_likes,
	       (SELECT COUNT(id) FROM messages WHERE from_user_id = users.id) AS kol_message,      
	       (SELECT COUNT(id) FROM posts WHERE user_id = users.id) AS kol_posts
	FROM users) AS tab
ORDER BY act
LIMIT 10;
