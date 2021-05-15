/* 1. Повторить все действия по доработке структуры БД vk (команды приложены в файле примеров).
Провести анализ своих данных и исправить недостатки и несоответствия, аналогично тому 
что мы делали на занятии. */

use vk;
--- |. Повторяем операции с урока

-- 1. users
SELECT * FROM users LIMIT 10;
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;  

-- 2. profiles
SELECT * FROM profiles LIMIT 10;
CREATE TEMPORARY TABLE genders (name CHAR(1));

INSERT INTO genders VALUES ('M'), ('F'); 
UPDATE profiles SET gender = (SELECT name FROM genders ORDER BY RAND() LIMIT 1);

-- 3. user_statuses
CREATE TABLE user_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "Название статуса (уникально)",
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Справочник статусов";  
INSERT INTO user_statuses (name) VALUES
 ('single'),
 ('friendship'),
 ('married');
SELECT * FROM user_statuses;
UPDATE profiles SET status = null;
ALTER TABLE profiles RENAME COLUMN status TO user_status_id; 
ALTER TABLE profiles MODIFY COLUMN user_status_id INT UNSIGNED; 
UPDATE profiles SET user_status_id = (SELECT id FROM user_statuses ORDER BY RAND() LIMIT 1);

-- 4. messages 
DESC messages;
SELECT * FROM messages LIMIT 10;

ALTER TABLE messages ADD COLUMN media_id INT UNSIGNED AFTER body; 
UPDATE messages SET 
  from_user_id = FLOOR(1 + RAND() * 100),
  to_user_id = FLOOR(1 + RAND() * 100);
UPDATE messages SET  media_id = FLOOR(1 + RAND() * 100);
UPDATE messages SET updated_at = NOW() WHERE updated_at < created_at;   

-- 5 media
DESC media;
SELECT * FROM media LIMIT 10;

UPDATE media SET user_id = FLOOR(1 + RAND() * 100);
DROP TABLE IF EXISTS extensions;
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('jpeg'), ('avi'), ('mpeg'), ('png');
SELECT * FROM extensions;
UPDATE media SET filename = CONCAT('http://googlecloud.net/', filename, '.', (SELECT name FROM extensions ORDER BY RAND() LIMIT 1) );
UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;
UPDATE media SET metadata = CONCAT('{"owner":"', (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id), '"}');  
ALTER TABLE media MODIFY COLUMN metadata JSON;


-- 6. media_types
SELECT * FROM media_types;
TRUNCATE media_types ;

INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio');
UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3);

-- 7. friendship
DESC friendship;
SELECT * FROM friendship LIMIT 10;

UPDATE friendship SET 
  user_id = FLOOR(1 + RAND() * 100),
  friend_id = FLOOR(1 + RAND() * 100);
UPDATE friendship SET friend_id = friend_id + 1 WHERE user_id = friend_id;

-- 8. friendship_statuses
SELECT * FROM friendship_statuses;
TRUNCATE friendship_statuses;

INSERT  INTO friendship_statuses (id, name) VALUES
  (1, 'Requested'),
  (2, 'Confirmed'),
  (3, 'Rejected')
  ON DUPLICATE KEY UPDATE name=VALUES(name);
UPDATE friendship SET status_id = FLOOR(1 + RAND() * 3); 

-- 9. communities && communities_users 
DESC communities;
SELECT * FROM communities;
DELETE FROM communities WHERE id > 20;

SELECT * FROM communities_users;
UPDATE communities_users SET community_id = FLOOR(1 + RAND() * 20);
DELETE FROM communities_users WHERE community_id > 100;


--- ||. Добавляем города и страны

-- добавляем и заполняем таблицу стран
CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Код страны",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название Страны"
) COMMENT "Список выбора стран";

INSERT INTO countries SET name = 'Russia';
INSERT INTO countries SET name = 'USA';
INSERT INTO countries SET name = 'GreatBritan';
INSERT INTO countries SET name = 'Italia';
INSERT INTO countries SET name = 'France';
INSERT INTO countries SET name = 'German';
INSERT INTO countries SET name = 'China';
INSERT INTO countries SET name = 'India';

SELECT * FROM countries;

-- добавляем и заполняем таблицу городов, с ссылкой на страну
CREATE TABLE cities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Код города",
  country_id INT UNSIGNED NOT NULL COMMENT "Ссылка на страну",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название Города"
) COMMENT "Список выбора городов";

INSERT IGNORE INTO cities (country_id, name) VALUES
  (8, 'Pekin'),
  (6, 'Paris'),
  (3, 'Vashington'),
  (1, 'Moscow'),
  (1, 'Ekaterinburg'),
  (1, 'Samara'),
  (5, 'Rim'),
  (9, 'Deli'),
  (4, 'London'),
  (7, 'Keln'),
  (7, 'Berlin');

SELECT * FROM cities;

-- изменяем и перезаполняем таблицу профилей 
UPDATE profiles SET city = null;
UPDATE profiles SET country = null;

ALTER TABLE profiles RENAME COLUMN city TO city_id; 
ALTER TABLE profiles RENAME COLUMN country TO country_id; 

ALTER TABLE profiles MODIFY COLUMN city_id INT UNSIGNED; 
ALTER TABLE profiles MODIFY COLUMN country_id INT UNSIGNED; 

UPDATE profiles SET city_id = (SELECT id FROM cities ORDER BY RAND() LIMIT 1);
UPDATE profiles SET country_id = (SELECT country_id FROM cities WHERE cities.id = city_id);

SELECT * FROM profiles; 
 
 
 


















-- 2.
