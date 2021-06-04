CREATE DATABASE IF NOT EXISTS my_library;

USE my_library; 
/* 
-- из-за использования внешних ключей разный порядок создания и удаления таблиц
-- служебный блок для удаления таблиц 
USE my_library; 

DROP TABLE IF EXISTS outer_links;

DROP TABLE IF EXISTS books_files;
DROP TABLE IF EXISTS type_files;

DROP TABLE IF EXISTS hashtags;
DROP TABLE IF EXISTS hashtags_table;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS comments_type;

DROP TABLE IF EXISTS books;

DROP TABLE IF EXISTS writers;
DROP TABLE IF EXISTS publishers; */

-- основной скрипт по созданию таблиц
-- 2. таблица авторов
DROP TABLE IF EXISTS writers;
CREATE TABLE writers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(255) COMMENT "ФИО",
  `text` TEXT COMMENT "Краткая биография",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания записи",
  UNIQUE unique_name(name(50))
) COMMENT "Справочник авторы"; 
-- 3. таблица издательств
DROP TABLE IF EXISTS publishers;
CREATE TABLE publishers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(255) COMMENT "Наименование",
  `text` TEXT COMMENT "Описание",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания записи",
  UNIQUE unique_name(name(50))
) COMMENT "Справочник издательства"; 
-- 1.основная таблица книг
DROP TABLE IF EXISTS books;
CREATE TABLE books (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(255) COMMENT "Наименование",
  id_writer INT UNSIGNED NOT NULL COMMENT "Автор(ы)",
  id_publisher INT UNSIGNED NOT NULL COMMENT "Издательство",
  `year` YEAR NOT NULL COMMENT "Год выхода",
  book_size INT UNSIGNED COMMENT "Размер(страниц)",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания записи",
  KEY index_of_year (`year`),
  FOREIGN KEY (id_writer) REFERENCES writers(id),
  FOREIGN KEY (id_publisher) REFERENCES publishers(id)
) COMMENT "Справочник книги";
-- 4. таблица интернет-ссылок
DROP TABLE IF EXISTS outer_links;
CREATE TABLE outer_links (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  id_book INT UNSIGNED NOT NULL COMMENT "Ссылка на книгу",
  link TEXT COMMENT "Ссылка на веб-страницу",
  site VARCHAR(255) COMMENT "Сайт-источник",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания записи",
  FOREIGN KEY (id_book) REFERENCES books(id)  
) COMMENT "Справочник ссылок";
-- 6. таблица типов файлов (обложка, текст, аудиокнига и пр.)
DROP TABLE IF EXISTS type_files;
CREATE TABLE type_files (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(255) COMMENT "Наименование",
  UNIQUE unique_name(name(50))
) COMMENT "Справочник типов файлов"; 
-- 5. таблица файлов
DROP TABLE IF EXISTS books_files;
CREATE TABLE books_files (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  id_book INT UNSIGNED NOT NULL COMMENT "Ссылка на книгу",
  id_file_type INT UNSIGNED NOT NULL COMMENT "Ссылка на тип файла",
  name VARCHAR(255) COMMENT "Описание",
  link TEXT COMMENT "Полный путь до файла",
  extension VARCHAR(255) COMMENT "Расширение",
  `size` INT COMMENT "Размер файла в Мб",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания записи",
  FOREIGN KEY (id_book) REFERENCES books(id),
  FOREIGN KEY (id_file_type) REFERENCES type_files(id)
) COMMENT "Справочник файлов"; 
-- 8. таблица видов тэгов
DROP TABLE IF EXISTS hashtags_table;
CREATE TABLE hashtags_table (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(255) NOT NULL COMMENT "Наименование",
  group_name VARCHAR(255) COMMENT "Имя группы",
  UNIQUE unique_name(name(100))
) COMMENT "Справочник видов тэгов"; -- 7. таблица тэгов книг 
DROP TABLE IF EXISTS hashtags;
CREATE TABLE hashtags (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  id_book INT UNSIGNED NOT NULL COMMENT "Ссылка на книгу",
  id_tag INT UNSIGNED NOT NULL COMMENT "Ссылка на тэг",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания записи",
  FOREIGN KEY (id_book) REFERENCES books(id),
  FOREIGN KEY (id_tag) REFERENCES hashtags_table(id)
) COMMENT "Справочник тэгов"; 
-- 10. таблица видов комментариев
DROP TABLE IF EXISTS comments_type;
CREATE TABLE comments_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(255) COMMENT "Наименование",
  `text` TEXT COMMENT "Описание...",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания записи",
  UNIQUE unique_name(name(100))
) COMMENT "Справочник видов комментариев"; 
-- 9. таблица текстовых комментариев (заметки, цитаты, оценки, оглавление, кр.описание и пр.) 
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  id_book INT UNSIGNED NOT NULL COMMENT "Ссылка на книгу",
  id_type INT UNSIGNED NOT NULL COMMENT "Ссылка на вид",
  `text` TEXT COMMENT "Содержание...",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания записи",
  FOREIGN KEY (id_book) REFERENCES books(id),
  FOREIGN KEY (id_type) REFERENCES comments_type(id)
) COMMENT "Справочник комментариев"; 

