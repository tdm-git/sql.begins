CREATE DATABASE IF NOT EXISTS my_library;

USE my_library; 
/* 
-- ��-�� ������������� ������� ������ ������ ������� �������� � �������� ������
-- ��������� ���� ��� �������� ������ 
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

-- �������� ������ �� �������� ������
-- 2. ������� �������
DROP TABLE IF EXISTS writers;
CREATE TABLE writers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  name VARCHAR(255) COMMENT "���",
  `text` TEXT COMMENT "������� ���������",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  UNIQUE unique_name(name(50))
) COMMENT "���������� ������"; 
-- 3. ������� �����������
DROP TABLE IF EXISTS publishers;
CREATE TABLE publishers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  name VARCHAR(255) COMMENT "������������",
  `text` TEXT COMMENT "��������",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  UNIQUE unique_name(name(50))
) COMMENT "���������� ������������"; 
-- 1.�������� ������� ����
DROP TABLE IF EXISTS books;
CREATE TABLE books (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  name VARCHAR(255) COMMENT "������������",
  id_writer INT UNSIGNED NOT NULL COMMENT "�����(�)",
  id_publisher INT UNSIGNED NOT NULL COMMENT "������������",
  `year` YEAR NOT NULL COMMENT "��� ������",
  book_size INT UNSIGNED COMMENT "������(�������)",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  KEY index_of_year (`year`),
  FOREIGN KEY (id_writer) REFERENCES writers(id),
  FOREIGN KEY (id_publisher) REFERENCES publishers(id)
) COMMENT "���������� �����";
-- 4. ������� ��������-������
DROP TABLE IF EXISTS outer_links;
CREATE TABLE outer_links (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  id_book INT UNSIGNED NOT NULL COMMENT "������ �� �����",
  link TEXT COMMENT "������ �� ���-��������",
  site VARCHAR(255) COMMENT "����-��������",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  FOREIGN KEY (id_book) REFERENCES books(id)  
) COMMENT "���������� ������";
-- 6. ������� ����� ������ (�������, �����, ���������� � ��.)
DROP TABLE IF EXISTS type_files;
CREATE TABLE type_files (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  name VARCHAR(255) COMMENT "������������",
  UNIQUE unique_name(name(50))
) COMMENT "���������� ����� ������"; 
-- 5. ������� ������
DROP TABLE IF EXISTS books_files;
CREATE TABLE books_files (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  id_book INT UNSIGNED NOT NULL COMMENT "������ �� �����",
  id_file_type INT UNSIGNED NOT NULL COMMENT "������ �� ��� �����",
  name VARCHAR(255) COMMENT "��������",
  link TEXT COMMENT "������ ���� �� �����",
  extension VARCHAR(255) COMMENT "����������",
  `size` INT COMMENT "������ ����� � ��",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  FOREIGN KEY (id_book) REFERENCES books(id),
  FOREIGN KEY (id_file_type) REFERENCES type_files(id)
) COMMENT "���������� ������"; 
-- 8. ������� ����� �����
DROP TABLE IF EXISTS hashtags_table;
CREATE TABLE hashtags_table (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  name VARCHAR(255) NOT NULL COMMENT "������������",
  group_name VARCHAR(255) COMMENT "��� ������",
  UNIQUE unique_name(name(100))
) COMMENT "���������� ����� �����"; -- 7. ������� ����� ���� 
DROP TABLE IF EXISTS hashtags;
CREATE TABLE hashtags (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  id_book INT UNSIGNED NOT NULL COMMENT "������ �� �����",
  id_tag INT UNSIGNED NOT NULL COMMENT "������ �� ���",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  FOREIGN KEY (id_book) REFERENCES books(id),
  FOREIGN KEY (id_tag) REFERENCES hashtags_table(id)
) COMMENT "���������� �����"; 
-- 10. ������� ����� ������������
DROP TABLE IF EXISTS comments_type;
CREATE TABLE comments_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  name VARCHAR(255) COMMENT "������������",
  `text` TEXT COMMENT "��������...",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  UNIQUE unique_name(name(100))
) COMMENT "���������� ����� ������������"; 
-- 9. ������� ��������� ������������ (�������, ������, ������, ����������, ��.�������� � ��.) 
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  id_book INT UNSIGNED NOT NULL COMMENT "������ �� �����",
  id_type INT UNSIGNED NOT NULL COMMENT "������ �� ���",
  `text` TEXT COMMENT "����������...",
  date_create DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  FOREIGN KEY (id_book) REFERENCES books(id),
  FOREIGN KEY (id_type) REFERENCES comments_type(id)
) COMMENT "���������� ������������"; 

