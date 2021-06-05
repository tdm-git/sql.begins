-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: my_library
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) DEFAULT NULL COMMENT 'Наименование',
  `id_writer` int unsigned NOT NULL COMMENT 'Автор(ы)',
  `id_publisher` int unsigned NOT NULL COMMENT 'Издательство',
  `year` year NOT NULL COMMENT 'Год выхода',
  `book_size` int unsigned DEFAULT NULL COMMENT 'Размер(страниц)',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  KEY `index_of_year` (`year`),
  KEY `id_writer` (`id_writer`),
  KEY `id_publisher` (`id_publisher`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_writer`) REFERENCES `writers` (`id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`id_publisher`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1697 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник книги';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1476,'Angular 4. Pocket Primer',1,1,2018,20,'2021-06-04 22:08:19'),(1480,'Эффективный Spark. Масштабирование и оптимизация',3,1,2018,1045,'2021-06-04 22:08:19'),(1483,'Designing Machine Learning Systems with Python',5,1,2016,224,'2021-06-04 22:08:19'),(1486,'Angular 5 Projects',7,1,2018,727,'2021-06-04 22:08:19'),(1489,'Введение в ECMAScript 6',8,1,2016,392,'2021-06-04 22:08:19'),(1491,'Bootstrap: Быстрое создание современных сайтов',9,1,2016,749,'2021-06-04 22:08:19'),(1493,'Data Science Fundamentals for Python and MongoDB',11,1,2018,955,'2021-06-04 22:08:19'),(1496,'Скрапинг веб-сайтов с помощью Python',13,1,2016,103,'2021-06-04 22:08:19'),(1499,'Изучаем React',14,1,2019,473,'2021-06-04 22:08:19'),(1502,'SQL: полное руководство, 3-е изд.',15,1,2015,1166,'2021-06-04 22:08:19'),(1505,'Data Wrangling with Python',16,1,2018,980,'2021-06-04 22:08:19'),(1507,'Стандартная библиотека Python 3',17,1,2019,444,'2021-06-04 22:08:19'),(1510,'PostgreSQL for Data Architects',18,1,2015,1493,'2021-06-04 22:08:19'),(1513,'Build Your Own AngularJS',19,1,2015,1325,'2021-06-04 22:08:19'),(1516,'The Python Workbook: A Brief Introduction with Exercises and Solutions, Second Edition',21,1,2019,972,'2021-06-04 22:08:19'),(1518,'PHP & MySQL: Novice to Ninja, 6th Edition',22,1,2017,1148,'2021-06-04 22:08:19'),(1521,'Data Analysis Using SQL and Excel, Second Edition',24,1,2016,83,'2021-06-04 22:08:19'),(1524,'The Practice of Computing Using Python, 3rd Edition',25,1,2017,1381,'2021-06-04 22:08:19'),(1527,'Django - The Easy Way (2nd Edition)',26,1,2018,1345,'2021-06-04 22:08:19'),(1533,'Pro Angular, Second Edition',28,1,2017,452,'2021-06-04 22:08:19'),(1535,'Программирование для нормальных с нуля на языке Python: В двух частях. Часть 1',29,1,2018,223,'2021-06-04 22:08:19'),(1537,'Program Arcade Games: With Python and Pygame, Fourth Edition',31,1,2016,1222,'2021-06-04 22:08:19'),(1540,'Изучаем TypeScript 3',32,1,2019,61,'2021-06-04 22:08:19'),(1543,'Pro HTML5 with CSS, JavaScript, and Multimedia: Complete Website Development and Best Practices',33,1,2018,88,'2021-06-04 22:08:19'),(1546,'Automate the Boring Stuff with Python, 2nd Edition',34,1,2018,1228,'2021-06-04 22:08:19'),(1550,'Python и машинное обучение',35,1,2017,32,'2021-06-04 22:08:19'),(1555,'Веб-разработка с применением Node и Express. Полноценное использование стека JavaScript',36,1,2017,120,'2021-06-04 22:08:19'),(1558,'MongoDB in Action, 2nd edition',37,1,2016,507,'2021-06-04 22:08:19'),(1561,'Building REST APIs with Flask: Create Python Web Services with MySQL',39,1,2018,714,'2021-06-04 22:08:19'),(1565,'Bioinformatics with Python Cookbook',42,1,2015,1187,'2021-06-04 22:08:19'),(1567,'Python на примерах. Практический курс · по программированию',44,1,2016,738,'2021-06-04 22:08:19'),(1570,'ng-book 2. The Complete Guide to Angular',45,1,2017,441,'2021-06-04 22:08:19'),(1573,'The Definitive Guide to MongoDB: A complete guide to dealing with Big Data using MongoDB, Third Edition',46,1,2015,1345,'2021-06-04 22:08:19'),(1576,'Essential TypeScript',28,1,2019,618,'2021-06-04 22:08:19'),(1579,'Работа с MySQL, MS SQL Server и Oracle в примерах',50,1,2019,674,'2021-06-04 22:08:19'),(1583,'Introducing JavaScript Game Development',51,1,2017,90,'2021-06-04 22:08:19'),(1585,'Hands-On Software Engineering with Python',53,1,2018,326,'2021-06-04 22:08:19'),(1587,'Романтика искусственного интеллекта',54,1,2017,617,'2021-06-04 22:08:19'),(1590,'Machine Learning by Tutorials',56,1,2019,500,'2021-06-04 22:08:19'),(1593,'Python GUI Programming Cookbook, Second Edition',57,1,2017,1059,'2021-06-04 22:08:19'),(1597,'Python. Уроки. 1-е издание',59,1,2017,948,'2021-06-04 22:08:19'),(1600,'Изучаем JavaScript: руководство по созданию современных веб-сайтов, 3-е изд.',61,1,2017,924,'2021-06-04 22:08:19'),(1602,'SQL - язык реляционных баз данных',62,1,2016,185,'2021-06-04 22:08:19'),(1606,'Python Programming for Biology',63,1,2015,515,'2021-06-04 22:08:19'),(1609,'Вероятностное программирование на Python: байесовский вывод и алгоритмы',65,1,2019,232,'2021-06-04 22:08:19'),(1613,'PostgreSQL Replication, Second Edition',66,1,2016,1413,'2021-06-04 22:08:19'),(1616,'Data Visualization with Python and JavaScript',68,1,2016,1487,'2021-06-04 22:08:19'),(1619,'SQL on Big Data: Technology, Architecture, and Innovation',69,1,2016,982,'2021-06-04 22:08:19'),(1621,'Mastering Python Scripting for System Administrators',71,1,2019,1255,'2021-06-04 22:08:19'),(1624,'Pro JavaScript Techniques, 2nd Edition',73,1,2015,860,'2021-06-04 22:08:19'),(1626,'SQL и процедурно-ориентированные языки программирования',74,1,2016,1140,'2021-06-04 22:08:19'),(1627,'Django for Beginners',75,1,2018,1254,'2021-06-04 22:08:19'),(1631,'AngularJS Directives Cookbook',76,1,2015,301,'2021-06-04 22:08:19'),(1633,'Javascript на примерах',77,1,2017,1069,'2021-06-04 22:08:19'),(1634,'Python Projects for Beginners',78,1,2020,179,'2021-06-04 22:08:19'),(1636,'Легкий способ выучить Python',79,1,2017,1096,'2021-06-04 22:08:19'),(1639,'Машинное обучение с использованием библиотеки Н2О',80,1,2018,633,'2021-06-04 22:08:19'),(1640,'Язык SQL. Базовый курс: учеб.-практ. пособие',81,1,2017,994,'2021-06-04 22:08:19'),(1643,'Mastering Python Data Visualization',82,1,2015,59,'2021-06-04 22:08:19'),(1644,'Python Web Scraping, Second Edition',83,1,2017,195,'2021-06-04 22:08:19'),(1646,'Python 3. Самое необходимое, 2-е издание',84,1,2016,769,'2021-06-04 22:08:19'),(1648,'PostgreSQL Administration Cookbook',85,1,2017,787,'2021-06-04 22:08:19'),(1651,'Django 2 by Example',87,1,2018,1480,'2021-06-04 22:08:19'),(1653,'Developing SQL Databases',88,1,2017,1395,'2021-06-04 22:08:19'),(1655,'Inside The Python Virtual Machine',90,1,2017,647,'2021-06-04 22:08:19'),(1657,'Python Recipes Handbook: A Problem-Solution Approach',91,1,2016,1053,'2021-06-04 22:08:19'),(1658,'Essential Algorithms: A Practical Approach to Computer Algorithms Using Python ® and C#',92,1,2019,873,'2021-06-04 22:08:19'),(1660,'Bayesian Reasoning and Machine Learning',93,1,2016,117,'2021-06-04 22:08:19'),(1662,'PostgreSQL 11 Мастерство разработки',94,1,2019,951,'2021-06-04 22:08:19'),(1664,'Numerical Python: Scientific Computing and Data Science Applications with Numpy, SciPy and Matplotlib',95,1,2019,387,'2021-06-04 22:08:19'),(1667,'Визуализация данных с помощью библиотеки D3.js 4.x',97,1,2017,888,'2021-06-04 22:08:19'),(1669,'Data Analysis and Visualization Using Python',98,1,2018,440,'2021-06-04 22:08:19'),(1672,'Python. Экспресс-курс. 3-е изд.',99,1,2019,503,'2021-06-04 22:08:19'),(1675,'Introducing Python: Modern Computing in Simple Packages, 2nd Edition',100,1,2020,668,'2021-06-04 22:08:19'),(1676,'Машинное обучение',101,1,2017,1069,'2021-06-04 22:08:19'),(1679,'SQL — язык реляционных баз данных',62,1,2018,651,'2021-06-04 22:08:19'),(1682,'Data Mining for Business Analytics',103,1,2020,763,'2021-06-04 22:08:19'),(1683,'Programming Google App Engine with Python',104,1,2015,199,'2021-06-04 22:08:19'),(1685,'Python и анализ данных',105,1,2015,298,'2021-06-04 22:08:19'),(1686,'SQL Server Big Data Clusters: Data Virtualization, Data Lake, and AI Platform, Second Edition',106,1,2020,114,'2021-06-04 22:08:19'),(1688,'Learning OpenCV 3 Computer Vision with Python, Second Edition',107,1,2015,814,'2021-06-04 22:08:19'),(1690,'Getting Started with TypeScript',108,1,2017,615,'2021-06-04 22:08:19'),(1692,'Learning Python',110,1,2019,110,'2021-06-04 22:08:19'),(1696,'Progressive Web Apps with Angular',111,1,2019,1239,'2021-06-04 22:08:19');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_files`
--

DROP TABLE IF EXISTS `books_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `id_book` int unsigned NOT NULL COMMENT 'Ссылка на книгу',
  `id_file_type` int unsigned NOT NULL COMMENT 'Ссылка на тип файла',
  `name` varchar(255) DEFAULT NULL COMMENT 'Описание',
  `link` text COMMENT 'Полный путь до файла',
  `extension` varchar(255) DEFAULT NULL COMMENT 'Расширение',
  `size` int DEFAULT NULL COMMENT 'Размер файла в Мб',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`),
  KEY `id_file_type` (`id_file_type`),
  CONSTRAINT `books_files_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`),
  CONSTRAINT `books_files_ibfk_2` FOREIGN KEY (`id_file_type`) REFERENCES `type_files` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник файлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_files`
--

LOCK TABLES `books_files` WRITE;
/*!40000 ALTER TABLE `books_files` DISABLE KEYS */;
INSERT INTO `books_files` VALUES (1,1476,2,'текст книги','files/ANGULAR 4 Pocket Primer.pdf','pdf',4184,'2021-06-04 22:08:19'),(2,1476,1,'обложка книги','photos/photo_131@02-01-2021_12-05-00.jpg','jpg',943,'2021-06-04 22:08:19'),(3,1480,1,'обложка книги','photos/photo_132@04-01-2021_13-35-00.jpg','jpg',589,'2021-06-04 22:08:19'),(4,1480,2,'текст книги','files/Карау_Х_,_Уоррен_Р_Эффективный_Spark.pdf','pdf',9607,'2021-06-04 22:08:19'),(5,1483,1,'обложка книги','photos/photo_133@06-01-2021_13-55-00.jpg','jpg',597,'2021-06-04 22:08:19'),(6,1483,2,'текст книги','files/Designing Machine Learning Systems with Python (en).epub','pdf',1246,'2021-06-04 22:08:19'),(7,1486,1,'обложка книги','photos/photo_134@08-01-2021_11-55-00.jpg','jpg',906,'2021-06-04 22:08:19'),(8,1489,1,'обложка книги','photos/photo_135@10-01-2021_13-10-00.jpg','jpg',564,'2021-06-04 22:08:19'),(9,1491,1,'обложка книги','photos/photo_136@10-01-2021_13-15-00.jpg','jpg',739,'2021-06-04 22:08:19'),(10,1491,2,'текст книги','files/Bootstrap_Быстрое_создание_современных_сайтов_2016.pdf','pdf',2217,'2021-06-04 22:08:19'),(11,1493,1,'обложка книги','photos/photo_137@12-01-2021_11-35-00.jpg','jpg',590,'2021-06-04 22:08:19'),(12,1493,2,'текст книги','files/Data Science Fundamentals for Python and MongoDB.pdf','pdf',8722,'2021-06-04 22:08:19'),(13,1496,1,'обложка книги','photos/photo_138@14-01-2021_13-00-04.jpg','jpg',762,'2021-06-04 22:08:19'),(14,1499,1,'обложка книги','photos/photo_139@16-01-2021_12-00-04.jpg','jpg',453,'2021-06-04 22:08:19'),(15,1502,1,'обложка книги','photos/photo_140@18-01-2021_12-00-04.jpg','jpg',692,'2021-06-04 22:08:19'),(16,1505,1,'обложка книги','photos/photo_141@20-01-2021_21-00-04.jpg','jpg',330,'2021-06-04 22:08:19'),(17,1507,1,'обложка книги','photos/photo_142@22-01-2021_12-00-05.jpg','jpg',781,'2021-06-04 22:08:19'),(18,1510,1,'обложка книги','photos/photo_143@24-01-2021_13-15-00.jpg','jpg',342,'2021-06-04 22:08:19'),(19,1513,1,'обложка книги','photos/photo_144@26-01-2021_12-40-00.jpg','jpg',643,'2021-06-04 22:08:19'),(20,1513,2,'текст книги','files/Build Your Own Angular (en).pdf','pdf',2605,'2021-06-04 22:08:19'),(21,1516,1,'обложка книги','photos/photo_145@27-01-2021_21-40-00.jpg','jpg',863,'2021-06-04 22:08:19'),(22,1518,1,'обложка книги','photos/photo_146@28-01-2021_11-55-00.jpg','jpg',800,'2021-06-04 22:08:19'),(23,1518,2,'текст книги','files/PHP & MySQL_ Novice to Ninja, 6th Edition.pdf','pdf',9974,'2021-06-04 22:08:19'),(24,1521,1,'обложка книги','photos/photo_147@28-01-2021_23-05-00.jpg','jpg',501,'2021-06-04 22:08:19'),(25,1524,1,'обложка книги','photos/photo_148@29-01-2021_17-30-03.jpg','jpg',409,'2021-06-04 22:08:19'),(26,1527,1,'обложка книги','photos/photo_149@30-01-2021_13-40-00.jpg','jpg',415,'2021-06-04 22:08:19'),(27,1527,2,'текст книги','files/Django_The_Easy_Way__A_step_by_step.pdf','pdf',2077,'2021-06-04 22:08:19'),(28,1533,1,'обложка книги','photos/photo_150@02-02-2021_16-30-00.jpg','jpg',928,'2021-06-04 22:08:19'),(29,1535,1,'обложка книги','photos/photo_151@04-02-2021_12-45-00.jpg','jpg',328,'2021-06-04 22:08:19'),(30,1535,2,'текст книги','files/Сысоева_Программирование_для_нормальных.pdf','pdf',9280,'2021-06-04 22:08:19'),(31,1537,1,'обложка книги','photos/photo_152@06-02-2021_11-55-00.jpg','jpg',348,'2021-06-04 22:08:19'),(32,1540,1,'обложка книги','photos/photo_153@08-02-2021_11-40-00.jpg','jpg',656,'2021-06-04 22:08:19'),(33,1543,1,'обложка книги','photos/photo_154@10-02-2021_12-00-06.jpg','jpg',317,'2021-06-04 22:08:19'),(34,1546,1,'обложка книги','photos/photo_155@12-02-2021_13-00-06.jpg','jpg',750,'2021-06-04 22:08:19'),(35,1550,1,'обложка книги','photos/photo_156@14-02-2021_12-10-00.jpg','jpg',576,'2021-06-04 22:08:19'),(36,1555,1,'обложка книги','photos/photo_157@16-02-2021_13-05-00.jpg','jpg',745,'2021-06-04 22:08:19'),(37,1558,1,'обложка книги','photos/photo_158@18-02-2021_12-20-00.jpg','jpg',960,'2021-06-04 22:08:19'),(38,1558,2,'текст книги','files/MongoDB-in-Action-2nd-Edition.pdf','pdf',9872,'2021-06-04 22:08:19'),(39,1561,1,'обложка книги','photos/photo_159@20-02-2021_12-10-00.jpg','jpg',832,'2021-06-04 22:08:19'),(40,1561,2,'текст книги','files/Building REST APIs with Flask.epub','pdf',1368,'2021-06-04 22:08:19'),(41,1561,2,'текст книги','files/Building_REST_APIs_with_Flask_Create_Python_Web_Services_with_MySQL.pdf','pdf',1887,'2021-06-04 22:08:19'),(42,1565,1,'обложка книги','photos/photo_160@20-02-2021_19-00-04.jpg','jpg',670,'2021-06-04 22:08:19'),(43,1565,2,'текст книги','files/Bioinformatics with Python Cookbook.pdf','pdf',9340,'2021-06-04 22:08:19'),(44,1567,1,'обложка книги','photos/photo_161@22-02-2021_13-00-03.jpg','jpg',881,'2021-06-04 22:08:19'),(45,1570,1,'обложка книги','photos/photo_162@26-02-2021_12-55-00.jpg','jpg',662,'2021-06-04 22:08:19'),(46,1573,1,'обложка книги','photos/photo_163@28-02-2021_13-40-00.jpg','jpg',311,'2021-06-04 22:08:19'),(47,1573,2,'текст книги','files/The Definitive Guide to MongoDB, Third Edition.pdf','pdf',4581,'2021-06-04 22:08:19'),(48,1576,1,'обложка книги','photos/photo_164@02-03-2021_12-00-07.jpg','jpg',321,'2021-06-04 22:08:19'),(49,1576,2,'текст книги','files/Essential TypeScript.epub','pdf',4560,'2021-06-04 22:08:19'),(50,1579,1,'обложка книги','photos/photo_165@04-03-2021_12-20-00.jpg','jpg',846,'2021-06-04 22:08:19'),(51,1583,1,'обложка книги','photos/photo_166@05-03-2021_11-00-08.jpg','jpg',816,'2021-06-04 22:08:19'),(52,1583,2,'текст книги','files/Introducing JS Game Development (en).pdf','pdf',4967,'2021-06-04 22:08:19'),(53,1585,1,'обложка книги','photos/photo_167@06-03-2021_12-00-05.jpg','jpg',692,'2021-06-04 22:08:19'),(54,1587,1,'обложка книги','photos/photo_168@08-03-2021_12-00-08.jpg','jpg',844,'2021-06-04 22:08:19'),(55,1587,2,'текст книги','files/Романтика_искусственного_интеллекта.pdf','pdf',9156,'2021-06-04 22:08:19'),(56,1590,1,'обложка книги','photos/photo_169@10-03-2021_12-00-08.jpg','jpg',311,'2021-06-04 22:08:19'),(57,1593,1,'обложка книги','photos/photo_170@12-03-2021_12-40-00.jpg','jpg',832,'2021-06-04 22:08:19'),(58,1593,2,'текст книги','files/[Burkhard_A._Meier]_Python_GUI_Programming_Cookboo.pdf','pdf',8915,'2021-06-04 22:08:19'),(59,1597,1,'обложка книги','photos/photo_171@14-03-2021_12-00-05.jpg','jpg',959,'2021-06-04 22:08:19'),(60,1597,2,'текст книги','files/М.И. Абдрахманов_2017_Python.Lessons_ч.1..pdf','pdf',5577,'2021-06-04 22:08:19'),(61,1600,1,'обложка книги','photos/photo_172@16-03-2021_12-20-00.jpg','jpg',593,'2021-06-04 22:08:19'),(62,1602,1,'обложка книги','photos/photo_173@18-03-2021_13-05-00.jpg','jpg',385,'2021-06-04 22:08:19'),(63,1606,1,'обложка книги','photos/photo_174@20-03-2021_11-30-00.jpg','jpg',897,'2021-06-04 22:08:19'),(64,1606,2,'текст книги','files/[Tim_J._Stevens,_Wayne_Boucher]_Python_Programming.pdf','pdf',6228,'2021-06-04 22:08:19'),(65,1609,1,'обложка книги','photos/photo_175@22-03-2021_11-40-00.jpg','jpg',796,'2021-06-04 22:08:19'),(66,1613,1,'обложка книги','photos/photo_176@23-03-2021_17-00-06.jpg','jpg',334,'2021-06-04 22:08:19'),(67,1613,2,'текст книги','files/PostgreSQL Replication.pdf','pdf',6063,'2021-06-04 22:08:19'),(68,1616,1,'обложка книги','photos/photo_177@26-03-2021_13-00-04.jpg','jpg',586,'2021-06-04 22:08:19'),(69,1619,1,'обложка книги','photos/photo_178@28-03-2021_12-00-07.jpg','jpg',427,'2021-06-04 22:08:19'),(70,1619,2,'текст книги','files/SQL on Big Data.pdf','pdf',2466,'2021-06-04 22:08:19'),(71,1621,1,'обложка книги','photos/photo_179@30-03-2021_13-40-00.jpg','jpg',302,'2021-06-04 22:08:19'),(72,1621,2,'текст книги','files/[Ganesh_Sanjiv_Naik]_Mastering_Python_Scripting_fo.epub','pdf',5063,'2021-06-04 22:08:19'),(73,1624,1,'обложка книги','photos/photo_180@02-04-2021_12-55-00.jpg','jpg',642,'2021-06-04 22:08:19'),(74,1626,1,'обложка книги','photos/photo_181@04-04-2021_14-20-00.jpg','jpg',457,'2021-06-04 22:08:19'),(75,1627,1,'обложка книги','photos/photo_182@06-04-2021_13-05-01.jpg','jpg',489,'2021-06-04 22:08:19'),(76,1631,1,'обложка книги','photos/photo_183@08-04-2021_17-43-21.jpg','jpg',654,'2021-06-04 22:08:19'),(77,1633,1,'обложка книги','photos/photo_184@10-04-2021_13-00-39.jpg','jpg',422,'2021-06-04 22:08:19'),(78,1634,1,'обложка книги','photos/photo_185@12-04-2021_13-25-00.jpg','jpg',894,'2021-06-04 22:08:19'),(79,1636,1,'обложка книги','photos/photo_186@14-04-2021_13-30-01.jpg','jpg',573,'2021-06-04 22:08:19'),(80,1639,1,'обложка книги','photos/photo_187@17-04-2021_12-45-00.jpg','jpg',334,'2021-06-04 22:08:19'),(81,1640,1,'обложка книги','photos/photo_188@18-04-2021_13-45-00.jpg','jpg',844,'2021-06-04 22:08:19'),(82,1643,1,'обложка книги','photos/photo_189@19-04-2021_21-15-00.jpg','jpg',680,'2021-06-04 22:08:19'),(83,1646,1,'обложка книги','photos/photo_191@22-04-2021_13-15-00.jpg','jpg',531,'2021-06-04 22:08:19'),(84,1648,1,'обложка книги','photos/photo_192@24-04-2021_11-10-00.jpg','jpg',321,'2021-06-04 22:08:19'),(85,1651,1,'обложка книги','photos/photo_194@27-04-2021_17-20-00.jpg','jpg',799,'2021-06-04 22:08:19'),(86,1653,1,'обложка книги','photos/photo_195@28-04-2021_12-05-00.jpg','jpg',904,'2021-06-04 22:08:19'),(87,1655,1,'обложка книги','photos/photo_196@29-04-2021_18-06-00.jpg','jpg',831,'2021-06-04 22:08:19'),(88,1657,1,'обложка книги','photos/photo_197@30-04-2021_01-00-01.jpg','jpg',861,'2021-06-04 22:08:19'),(89,1658,1,'обложка книги','photos/photo_198@30-04-2021_12-05-00.jpg','jpg',425,'2021-06-04 22:08:19'),(90,1660,1,'обложка книги','photos/photo_199@02-05-2021_11-15-00.jpg','jpg',564,'2021-06-04 22:08:19'),(91,1662,1,'обложка книги','photos/photo_200@04-05-2021_12-15-00.jpg','jpg',913,'2021-06-04 22:08:19'),(92,1664,1,'обложка книги','photos/photo_201@06-05-2021_12-40-00.jpg','jpg',453,'2021-06-04 22:08:19'),(93,1667,1,'обложка книги','photos/photo_203@10-05-2021_12-00-07.jpg','jpg',691,'2021-06-04 22:08:19'),(94,1669,1,'обложка книги','photos/photo_204@12-05-2021_11-30-01.jpg','jpg',998,'2021-06-04 22:08:19'),(95,1672,1,'обложка книги','photos/photo_205@14-05-2021_13-15-00.jpg','jpg',763,'2021-06-04 22:08:19'),(96,1675,1,'обложка книги','photos/photo_206@15-05-2021_16-20-00.jpg','jpg',596,'2021-06-04 22:08:19'),(97,1676,1,'обложка книги','photos/photo_207@16-05-2021_12-35-00.jpg','jpg',321,'2021-06-04 22:08:19'),(98,1679,1,'обложка книги','photos/photo_208@18-05-2021_12-40-00.jpg','jpg',772,'2021-06-04 22:08:19'),(99,1682,1,'обложка книги','photos/photo_209@19-05-2021_23-40-00.jpg','jpg',981,'2021-06-04 22:08:19'),(100,1683,1,'обложка книги','photos/photo_210@20-05-2021_13-00-04.jpg','jpg',499,'2021-06-04 22:08:19'),(101,1685,1,'обложка книги','photos/photo_211@22-05-2021_16-20-00.jpg','jpg',766,'2021-06-04 22:08:19'),(102,1686,1,'обложка книги','photos/photo_212@24-05-2021_11-00-10.jpg','jpg',842,'2021-06-04 22:08:19'),(103,1688,1,'обложка книги','photos/photo_213@24-05-2021_23-45-00.jpg','jpg',664,'2021-06-04 22:08:19'),(104,1690,1,'обложка книги','photos/photo_214@26-05-2021_12-25-00.jpg','jpg',326,'2021-06-04 22:08:19'),(105,1692,1,'обложка книги','photos/photo_216@30-05-2021_13-30-00.jpg','jpg',372,'2021-06-04 22:08:19'),(106,1696,1,'обложка книги','photos/photo_218@02-06-2021_11-00-06.jpg','jpg',619,'2021-06-04 22:08:19');
/*!40000 ALTER TABLE `books_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!50001 DROP VIEW IF EXISTS `catalog`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `catalog` AS SELECT 
 1 AS `group_name`,
 1 AS `tag`,
 1 AS `book_name`,
 1 AS `year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `id_book` int unsigned NOT NULL COMMENT 'Ссылка на книгу',
  `id_type` int unsigned NOT NULL COMMENT 'Ссылка на вид',
  `text` text COMMENT 'Содержание...',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `comments_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник комментариев';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1518,3,'Install PHP & MySQL on Windows, Mac OS X, or Linux\r\nGain a thorough understanding of PHP syntax\r\nUse object oriented programming techniques\r\nMaster database design principles and SQL\r\nDevelop robust websites that can handle high levels of traffic\r\nBuild a working content management system (CMS)\r\nAnd much more!','2021-06-04 22:08:21'),(2,1518,4,'PHP & MySQL: Novice to Ninja, 6th Edition is a hands-on guide to learning all the tools, principles, and techniques needed to build a fully functional application using PHP & MySQL. Comprehensively updated to cover PHP 7 and modern best practice, this practical and fun book covers everything from installing PHP and MySQL through to creating a complete online content management system.','2021-06-04 22:08:21'),(3,1518,1,'\"PHP и MySQL. От новичка к профессионалу\" - это практическое руководство, отличный помощник для всех, кто хочет заниматься созданием сайтов на основе базы данных. PHP— скриптовый язык программирования общего назначения, который в настоящее время поддерживается абсолютным большинством хостинг-провайдеров, является главным языком для создания динамических веб-сайтов. В новом издании бестселлера Янка, рассказывается, как с помощью языка PHP (который применяется в 20 миллионах сайтов по всему миру), разработать собственную систему для эффективного управления содержимым (CMS). Причем исключительно на основе бесплатного программного обеспечения.','2021-06-04 22:08:21');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_type`
--

DROP TABLE IF EXISTS `comments_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) DEFAULT NULL COMMENT 'Наименование',
  `text` text COMMENT 'Описание...',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник видов комментариев';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_type`
--

LOCK TABLES `comments_type` WRITE;
/*!40000 ALTER TABLE `comments_type` DISABLE KEYS */;
INSERT INTO `comments_type` VALUES (1,'Комментарий',NULL,'2021-06-04 22:08:21'),(2,'Цитата',NULL,'2021-06-04 22:08:21'),(3,'Оглавление',NULL,'2021-06-04 22:08:21'),(4,'Заметки',NULL,'2021-06-04 22:08:21');
/*!40000 ALTER TABLE `comments_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtags`
--

DROP TABLE IF EXISTS `hashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `id_book` int unsigned NOT NULL COMMENT 'Ссылка на книгу',
  `id_tag` int unsigned NOT NULL COMMENT 'Ссылка на тэг',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`),
  KEY `id_tag` (`id_tag`),
  CONSTRAINT `hashtags_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`),
  CONSTRAINT `hashtags_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `hashtags_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник тэгов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtags`
--

LOCK TABLES `hashtags` WRITE;
/*!40000 ALTER TABLE `hashtags` DISABLE KEYS */;
INSERT INTO `hashtags` VALUES (1,1480,3,'2021-06-04 22:08:21'),(2,1476,1,'2021-06-04 22:08:21'),(3,1483,5,'2021-06-04 22:08:21'),(4,1486,1,'2021-06-04 22:08:21'),(5,1489,8,'2021-06-04 22:08:21'),(6,1491,9,'2021-06-04 22:08:21'),(7,1493,5,'2021-06-04 22:08:21'),(8,1496,5,'2021-06-04 22:08:21'),(9,1499,14,'2021-06-04 22:08:21'),(10,1502,15,'2021-06-04 22:08:21'),(11,1505,5,'2021-06-04 22:08:21'),(12,1507,5,'2021-06-04 22:08:21'),(13,1510,18,'2021-06-04 22:08:21'),(14,1513,1,'2021-06-04 22:08:21'),(15,1516,5,'2021-06-04 22:08:21'),(16,1518,22,'2021-06-04 22:08:21'),(17,1521,15,'2021-06-04 22:08:21'),(18,1524,5,'2021-06-04 22:08:21'),(19,1527,26,'2021-06-04 22:08:21'),(20,1533,1,'2021-06-04 22:08:21'),(21,1535,5,'2021-06-04 22:08:21'),(22,1537,5,'2021-06-04 22:08:21'),(23,1540,32,'2021-06-04 22:08:21'),(24,1543,33,'2021-06-04 22:08:21'),(25,1546,5,'2021-06-04 22:08:21'),(26,1550,5,'2021-06-04 22:08:21'),(27,1555,36,'2021-06-04 22:08:21'),(28,1558,37,'2021-06-04 22:08:21'),(29,1561,5,'2021-06-04 22:08:21'),(30,1565,5,'2021-06-04 22:08:21'),(31,1567,5,'2021-06-04 22:08:21'),(32,1570,1,'2021-06-04 22:08:21'),(33,1573,37,'2021-06-04 22:08:21'),(34,1576,32,'2021-06-04 22:08:21'),(35,1579,22,'2021-06-04 22:08:21'),(36,1583,36,'2021-06-04 22:08:21'),(37,1585,5,'2021-06-04 22:08:21'),(38,1587,54,'2021-06-04 22:08:21'),(39,1590,56,'2021-06-04 22:08:21'),(40,1593,5,'2021-06-04 22:08:21'),(41,1597,5,'2021-06-04 22:08:21'),(42,1600,36,'2021-06-04 22:08:21'),(43,1602,15,'2021-06-04 22:08:21'),(44,1606,5,'2021-06-04 22:08:21'),(45,1609,5,'2021-06-04 22:08:21'),(46,1613,18,'2021-06-04 22:08:21'),(47,1616,5,'2021-06-04 22:08:21'),(48,1619,15,'2021-06-04 22:08:21'),(49,1621,5,'2021-06-04 22:08:21'),(50,1624,36,'2021-06-04 22:08:21'),(51,1626,15,'2021-06-04 22:08:21'),(52,1627,5,'2021-06-04 22:08:21'),(53,1631,76,'2021-06-04 22:08:21'),(54,1633,36,'2021-06-04 22:08:21'),(55,1634,5,'2021-06-04 22:08:21'),(56,1636,5,'2021-06-04 22:08:21'),(57,1639,56,'2021-06-04 22:08:21'),(58,1640,15,'2021-06-04 22:08:21'),(59,1643,5,'2021-06-04 22:08:21'),(60,1644,5,'2021-06-04 22:08:21'),(61,1646,5,'2021-06-04 22:08:21'),(62,1648,18,'2021-06-04 22:08:21'),(63,1651,26,'2021-06-04 22:08:21'),(64,1653,15,'2021-06-04 22:08:21'),(65,1655,5,'2021-06-04 22:08:21'),(66,1657,5,'2021-06-04 22:08:21'),(67,1658,5,'2021-06-04 22:08:21'),(68,1660,56,'2021-06-04 22:08:21'),(69,1662,18,'2021-06-04 22:08:21'),(70,1664,5,'2021-06-04 22:08:21'),(71,1667,36,'2021-06-04 22:08:21'),(72,1669,5,'2021-06-04 22:08:21'),(73,1672,5,'2021-06-04 22:08:21'),(74,1675,5,'2021-06-04 22:08:21'),(75,1676,56,'2021-06-04 22:08:21'),(76,1679,15,'2021-06-04 22:08:21'),(77,1682,5,'2021-06-04 22:08:21'),(78,1683,5,'2021-06-04 22:08:21'),(79,1685,5,'2021-06-04 22:08:21'),(80,1686,15,'2021-06-04 22:08:21'),(81,1688,5,'2021-06-04 22:08:21'),(82,1690,1,'2021-06-04 22:08:21'),(83,1692,5,'2021-06-04 22:08:21'),(84,1696,1,'2021-06-04 22:08:21');
/*!40000 ALTER TABLE `hashtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtags_table`
--

DROP TABLE IF EXISTS `hashtags_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtags_table` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) NOT NULL COMMENT 'Наименование',
  `group_name` varchar(255) DEFAULT NULL COMMENT 'Имя группы',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник видов тэгов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtags_table`
--

LOCK TABLES `hashtags_table` WRITE;
/*!40000 ALTER TABLE `hashtags_table` DISABLE KEYS */;
INSERT INTO `hashtags_table` VALUES (1,'#angular','coding'),(3,'#spark','coding'),(5,'#python','coding'),(8,'#ecmascript','coding'),(9,'#bootstrap','coding'),(14,'#react','coding'),(15,'#sql','dbms'),(18,'#postgresql','dbms'),(22,'#mysql','dbms'),(26,'#django','coding'),(32,'#typescript','coding'),(33,'#css','coding'),(36,'#javascript','coding'),(37,'#mongodb','dbms'),(54,'#ai','coding'),(56,'#machine_learning','coding'),(76,'#angularjs','coding');
/*!40000 ALTER TABLE `hashtags_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `list_book`
--

DROP TABLE IF EXISTS `list_book`;
/*!50001 DROP VIEW IF EXISTS `list_book`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_book` AS SELECT 
 1 AS `book_name`,
 1 AS `writer`,
 1 AS `year`,
 1 AS `tag`,
 1 AS `has_photo`,
 1 AS `has_text`,
 1 AS `book_size`,
 1 AS `date_create`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `outer_links`
--

DROP TABLE IF EXISTS `outer_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outer_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `id_book` int unsigned NOT NULL COMMENT 'Ссылка на книгу',
  `link` text COMMENT 'Ссылка на веб-страницу',
  `site` varchar(255) DEFAULT NULL COMMENT 'Сайт-источник',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  KEY `id_book` (`id_book`),
  CONSTRAINT `outer_links_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник ссылок';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outer_links`
--

LOCK TABLES `outer_links` WRITE;
/*!40000 ALTER TABLE `outer_links` DISABLE KEYS */;
INSERT INTO `outer_links` VALUES (1,1480,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1480}]}','telegram','2021-06-04 22:08:20'),(2,1476,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1476}]}','telegram','2021-06-04 22:08:20'),(3,1483,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1483}]}','telegram','2021-06-04 22:08:20'),(4,1486,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1486}]}','telegram','2021-06-04 22:08:20'),(5,1489,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1489}]}','telegram','2021-06-04 22:08:20'),(6,1491,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1491}]}','telegram','2021-06-04 22:08:20'),(7,1493,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1493}]}','telegram','2021-06-04 22:08:20'),(8,1496,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1496}]}','telegram','2021-06-04 22:08:20'),(9,1499,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1499}]}','telegram','2021-06-04 22:08:20'),(10,1502,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1502}]}','telegram','2021-06-04 22:08:20'),(11,1505,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1505}]}','telegram','2021-06-04 22:08:20'),(12,1507,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1507}]}','telegram','2021-06-04 22:08:20'),(13,1510,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1510}]}','telegram','2021-06-04 22:08:20'),(14,1513,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1513}]}','telegram','2021-06-04 22:08:20'),(15,1516,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1516}]}','telegram','2021-06-04 22:08:20'),(16,1518,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1518}]}','telegram','2021-06-04 22:08:20'),(17,1521,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1521}]}','telegram','2021-06-04 22:08:20'),(18,1524,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1524}]}','telegram','2021-06-04 22:08:20'),(19,1527,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1527}]}','telegram','2021-06-04 22:08:20'),(20,1533,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1533}]}','telegram','2021-06-04 22:08:20'),(21,1535,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1535}]}','telegram','2021-06-04 22:08:20'),(22,1537,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1537}]}','telegram','2021-06-04 22:08:20'),(23,1540,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1540}]}','telegram','2021-06-04 22:08:20'),(24,1543,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1543}]}','telegram','2021-06-04 22:08:20'),(25,1546,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1546}]}','telegram','2021-06-04 22:08:20'),(26,1550,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1550}]}','telegram','2021-06-04 22:08:20'),(27,1555,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1555}]}','telegram','2021-06-04 22:08:20'),(28,1558,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1558}]}','telegram','2021-06-04 22:08:20'),(29,1561,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1561}]}','telegram','2021-06-04 22:08:20'),(30,1565,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1565}]}','telegram','2021-06-04 22:08:20'),(31,1567,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1567}]}','telegram','2021-06-04 22:08:20'),(32,1570,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1570}]}','telegram','2021-06-04 22:08:20'),(33,1573,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1573}]}','telegram','2021-06-04 22:08:20'),(34,1576,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1576}]}','telegram','2021-06-04 22:08:20'),(35,1579,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1579}]}','telegram','2021-06-04 22:08:20'),(36,1583,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1583}]}','telegram','2021-06-04 22:08:20'),(37,1585,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1585}]}','telegram','2021-06-04 22:08:20'),(38,1587,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1587}]}','telegram','2021-06-04 22:08:20'),(39,1590,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1590}]}','telegram','2021-06-04 22:08:20'),(40,1593,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1593}]}','telegram','2021-06-04 22:08:20'),(41,1597,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1597}]}','telegram','2021-06-04 22:08:20'),(42,1600,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1600}]}','telegram','2021-06-04 22:08:20'),(43,1602,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1602}]}','telegram','2021-06-04 22:08:20'),(44,1606,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1606}]}','telegram','2021-06-04 22:08:20'),(45,1609,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1609}]}','telegram','2021-06-04 22:08:20'),(46,1613,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1613}]}','telegram','2021-06-04 22:08:20'),(47,1616,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1616}]}','telegram','2021-06-04 22:08:20'),(48,1619,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1619}]}','telegram','2021-06-04 22:08:20'),(49,1621,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1621}]}','telegram','2021-06-04 22:08:20'),(50,1624,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1624}]}','telegram','2021-06-04 22:08:20'),(51,1626,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1626}]}','telegram','2021-06-04 22:08:20'),(52,1627,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1627}]}','telegram','2021-06-04 22:08:20'),(53,1631,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1631}]}','telegram','2021-06-04 22:08:20'),(54,1633,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1633}]}','telegram','2021-06-04 22:08:20'),(55,1634,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1634}]}','telegram','2021-06-04 22:08:20'),(56,1636,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1636}]}','telegram','2021-06-04 22:08:20'),(57,1639,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1639}]}','telegram','2021-06-04 22:08:20'),(58,1640,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1640}]}','telegram','2021-06-04 22:08:20'),(59,1643,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1643}]}','telegram','2021-06-04 22:08:20'),(60,1644,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1644}]}','telegram','2021-06-04 22:08:20'),(61,1646,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1646}]}','telegram','2021-06-04 22:08:20'),(62,1648,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1648}]}','telegram','2021-06-04 22:08:20'),(63,1651,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1651}]}','telegram','2021-06-04 22:08:20'),(64,1653,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1653}]}','telegram','2021-06-04 22:08:20'),(65,1655,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1655}]}','telegram','2021-06-04 22:08:20'),(66,1657,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1657}]}','telegram','2021-06-04 22:08:20'),(67,1658,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1658}]}','telegram','2021-06-04 22:08:20'),(68,1660,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1660}]}','telegram','2021-06-04 22:08:20'),(69,1662,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1662}]}','telegram','2021-06-04 22:08:20'),(70,1664,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1664}]}','telegram','2021-06-04 22:08:20'),(71,1667,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1667}]}','telegram','2021-06-04 22:08:20'),(72,1669,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1669}]}','telegram','2021-06-04 22:08:20'),(73,1672,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1672}]}','telegram','2021-06-04 22:08:20'),(74,1675,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1675}]}','telegram','2021-06-04 22:08:20'),(75,1676,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1676}]}','telegram','2021-06-04 22:08:20'),(76,1679,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1679}]}','telegram','2021-06-04 22:08:20'),(77,1682,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1682}]}','telegram','2021-06-04 22:08:20'),(78,1683,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1683}]}','telegram','2021-06-04 22:08:20'),(79,1685,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1685}]}','telegram','2021-06-04 22:08:20'),(80,1686,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1686}]}','telegram','2021-06-04 22:08:20'),(81,1688,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1688}]}','telegram','2021-06-04 22:08:20'),(82,1690,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1690}]}','telegram','2021-06-04 22:08:20'),(83,1692,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1692}]}','telegram','2021-06-04 22:08:20'),(84,1696,'{\"name\": \"Книги по программированию\",\"type\": \"public_channel\",\"id\": 1425821275,\"messages\":[{\"id\": 1696}]}','telegram','2021-06-04 22:08:20');
/*!40000 ALTER TABLE `outer_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) DEFAULT NULL COMMENT 'Наименование',
  `text` text COMMENT 'Описание',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник издательства';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'channel1425821275',NULL,'2021-06-04 22:08:19');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_files`
--

DROP TABLE IF EXISTS `type_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) DEFAULT NULL COMMENT 'Наименование',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(50))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник типов файлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_files`
--

LOCK TABLES `type_files` WRITE;
/*!40000 ALTER TABLE `type_files` DISABLE KEYS */;
INSERT INTO `type_files` VALUES (1,'обложка'),(2,'текст книги'),(3,'аудиокнига');
/*!40000 ALTER TABLE `type_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writers`
--

DROP TABLE IF EXISTS `writers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) DEFAULT NULL COMMENT 'ФИО',
  `text` text COMMENT 'Краткая биография',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(50))
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник авторы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writers`
--

LOCK TABLES `writers` WRITE;
/*!40000 ALTER TABLE `writers` DISABLE KEYS */;
INSERT INTO `writers` VALUES (1,'Oswald Campesato','Oswald Campesato is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(3,'Холден Карау, Рейчел Уоррен','Холден Карау, Рейчел Уоррен is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(5,'David Julian','David Julian is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(7,'Mark Clow','Mark Clow is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(8,'Нараян Прасти','Нараян Прасти is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(9,'Тимур Машнин','Тимур Машнин is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(11,'David Paper','David Paper is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(13,'Р. Митчелл','Р. Митчелл is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(14,'Кирупа Чиннатамби','Кирупа Чиннатамби is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(15,'Джеймс Грофф, Пол Вайнберг, Эндрю Оппель','Джеймс Грофф, Пол Вайнберг, Эндрю Оппель is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(16,'Jacqueline Kazil and Katharine Jarmul','Jacqueline Kazil and Katharine Jarmul is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(17,'Даг Хеллман','Даг Хеллман is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(18,'Jayadevan Maymala','Jayadevan Maymala is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(19,'Tero Parviainen','Tero Parviainen is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(21,'Ben Stephenson','Ben Stephenson is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(22,'Butler and Kevin Yank','Butler and Kevin Yank is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(24,'Gordon S. Linoff','Gordon S. Linoff is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(25,'William F. Punch, Richard Enbody','William F. Punch, Richard Enbody is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(26,'Samuli Natri','Samuli Natri is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(28,'Adam Freeman','Adam Freeman is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(29,'Сысоева М.В., Сысоев И.В -','Сысоева М.В., Сысоев И.В - is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(31,'Paul Vincent Craven','Paul Vincent Craven is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(32,'Натан Розенталс','Натан Розенталс is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(33,'2017','2017 is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(34,'2020','2020 is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(35,'Рашка С.','Рашка С. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(36,'Браун Итан','Браун Итан is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(37,'Kyle Banker, Peter Bakkum, Shaun Verch, Douglas Garrett, Tim Hawkins','Kyle Banker, Peter Bakkum, Shaun Verch, Douglas Garrett, Tim Hawkins is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(39,'2019','2019 is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(42,'Tiago Antao','Tiago Antao is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(44,'Васильев А.Н.','Васильев А.Н. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(45,'Nate Murray, Felipe Coury, Ari Lerner, and Carlos Taborda','Nate Murray, Felipe Coury, Ari Lerner, and Carlos Taborda is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(46,'David Hows, Peter Membrey, Eelco Plugge, Tim Hawkins','David Hows, Peter Membrey, Eelco Plugge, Tim Hawkins is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(50,'Святослав Куликов','Святослав Куликов is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(51,'Graeme Stuart','Graeme Stuart is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(53,'Brian Allbee','Brian Allbee is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(54,'Потопахин В.В.','Потопахин В.В. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(56,'Matthijs Hollemans, Chris LaPollo & Audrey Tam','Matthijs Hollemans, Chris LaPollo & Audrey Tam is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(57,'Burkhard A. Meier','Burkhard A. Meier is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(59,'Абдрахманов М.И.','Абдрахманов М.И. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(61,'Этан Браун','Этан Браун is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(62,'В. Ю. Кара-Ушанов','В. Ю. Кара-Ушанов is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(63,'Tim J. Stevens, Wayne Bouch','Tim J. Stevens, Wayne Bouch is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(65,'Дэвидсон-Пайлон Кэмерон','Дэвидсон-Пайлон Кэмерон is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(66,'Hans-J?rgen Sch?nig','Hans-J?rgen Sch?nig is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(68,'Kyran Dale','Kyran Dale is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(69,'Sumit Pal','Sumit Pal is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(71,'Ganesh Sanjiv Naik','Ganesh Sanjiv Naik is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(73,'John Resig, Russ Ferguson, John Paxton','John Resig, Russ Ferguson, John Paxton is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(74,'И.Ю. Баженова','И.Ю. Баженова is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(75,'William S. Vincent','William S. Vincent is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(76,'Fernando Monteiro','Fernando Monteiro is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(77,'Никольский А.П.','Никольский А.П. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(78,'Connor P. Milliken','Connor P. Milliken is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(79,'Зед Шоу','Зед Шоу is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(80,'Кук Д.','Кук Д. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(81,'Моргунов, Е. П.','Моргунов, Е. П. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(82,'Kirthi Raman','Kirthi Raman is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(83,'Katharine Jarmul, Richard Lawson','Katharine Jarmul, Richard Lawson is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(84,'Н. А. Прохоренок, В. А. Дронов','Н. А. Прохоренок, В. А. Дронов is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(85,'Simon Riggs, Gianni Ciolli, Gabriele Bartolini','Simon Riggs, Gianni Ciolli, Gabriele Bartolini is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(87,'Antonio Mel?','Antonio Mel? is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(88,'Louis Davidson, Stacia Varga','Louis Davidson, Stacia Varga is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(90,'Obi Ike-Nwosu','Obi Ike-Nwosu is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(91,'Joey Bernard','Joey Bernard is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(92,'Rod Stephens','Rod Stephens is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(93,'David Barber','David Barber is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(94,'Ганс-Юрген Шёниг','Ганс-Юрген Шёниг is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(95,'Robert Johansson','Robert Johansson is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(97,'Рининсланд Э., Теллер С.','Рининсланд Э., Теллер С. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(98,'Dr. Ossama Embarak','Dr. Ossama Embarak is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(99,'Седер Наоми','Седер Наоми is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(100,'Bill Lubanovic','Bill Lubanovic is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(101,'Бринк Х., Ричардс Дж., Феверолф М.','Бринк Х., Ричардс Дж., Феверолф М. is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(103,'Galit Shmueli, Peter C. Bruce, Nitin R. Patel','Galit Shmueli, Peter C. Bruce, Nitin R. Patel is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(104,'Dan Sanderson','Dan Sanderson is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(105,'Уэс Маккинли','Уэс Маккинли is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(106,'Benjamin Weissman, Enrico van de Laar','Benjamin Weissman, Enrico van de Laar is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(107,'Joe Minichino, Joseph Howse','Joe Minichino, Joseph Howse is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(108,'Thomas Claudius Huber','Thomas Claudius Huber is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(110,'Oliver Soranson','Oliver Soranson is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(111,'Majid Hajian','Majid Hajian is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-04 22:08:18'),(200,'Jack Jackson',' is a computer programmer who has spent much of the last 20 years writing books about programming languages.','2021-06-05 11:08:14');
/*!40000 ALTER TABLE `writers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biografy` BEFORE INSERT ON `writers` FOR EACH ROW BEGIN
  IF NEW.`text` is NULL THEN  
	SET NEW.`text` = ' is a computer programmer who has spent much of the last 20 years writing books about programming languages.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `catalog`
--

/*!50001 DROP VIEW IF EXISTS `catalog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `catalog` AS select `ht`.`group_name` AS `group_name`,`ht`.`name` AS `tag`,`b`.`name` AS `book_name`,`b`.`year` AS `year` from ((`books` `b` left join `hashtags` `h` on((`b`.`id` = `h`.`id_book`))) left join `hashtags_table` `ht` on((`ht`.`id` = `h`.`id_tag`))) order by `ht`.`group_name`,`ht`.`name`,`b`.`year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `list_book`
--

/*!50001 DROP VIEW IF EXISTS `list_book`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `list_book` AS select `b`.`name` AS `book_name`,`w`.`name` AS `writer`,`b`.`year` AS `year`,`ht`.`name` AS `tag`,`has_file`(`b`.`id`,1) AS `has_photo`,`has_file`(`b`.`id`,2) AS `has_text`,`b`.`book_size` AS `book_size`,`b`.`date_create` AS `date_create` from (((`books` `b` left join `writers` `w` on((`b`.`id_writer` = `w`.`id`))) left join `hashtags` `h` on((`b`.`id` = `h`.`id_book`))) left join `hashtags_table` `ht` on((`ht`.`id` = `h`.`id_tag`))) order by `b`.`year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-05 11:31:53
