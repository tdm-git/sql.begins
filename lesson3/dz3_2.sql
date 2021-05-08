-- выбирал между двумя вариантами - решил остановиться всё таки на варианте создания одной таблицы
-- т.к. в структуре уже таблица с типами файлов и можно не создавать отдельные таблицы
-- кроме того такая структура позволит хранить лайки для "новых" типов данных, без добавления новых таблиц

-- Таблица лайков
CREATE TABLE like_table (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который поставил отметку",
  media_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип контента",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (media_type_id) REFERENCES media_types(id)
) COMMENT "Отметка понравилось";
