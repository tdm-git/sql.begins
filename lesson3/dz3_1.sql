-- по созданой структуре БД всё понятно, повторил на своей копии, вопросов не возникло

-- для ДЗ решил повторить предложения с урока - выделить страны и города в отдельные таблицы

-- Таблица стран 
CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Код страны",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название Страны",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Список выбора стран";

-- Таблица городов  
CREATE TABLE cities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Код города",
  country_id INT UNSIGNED NOT NULL COMMENT "Ссылка на страну",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название Города",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  FOREIGN KEY (country_id) REFERENCES countries(id)
) COMMENT "Список выбора городов";

-- и немного отрадактировал таблицу профилей
-- Таблица профилей
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  gender CHAR(1) NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  photo_id INT UNSIGNED COMMENT "Ссылка на основную фотографию пользователя",
  status VARCHAR(30) COMMENT "Текущий статус",
  city_id INT UNSIGNED COMMENT "Ссылка на Город проживания",
  country_id INT UNSIGNED COMMENT "Ссылка на Страна проживания",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (city_id) REFERENCES cities(id),
  FOREIGN KEY (country_id) REFERENCES countries(id)
) COMMENT "Профили"; 
