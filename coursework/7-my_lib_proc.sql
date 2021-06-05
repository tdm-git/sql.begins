use my_library;

-- функция проверки наличия файла определенного типа
-- используется в запросе для view catalog
CREATE FUNCTION my_library.has_file(target_id INT, target_type_id INT)
RETURNS BOOLEAN READS SQL DATA
BEGIN
	RETURN EXISTS(SELECT 1 FROM books_files WHERE id_book = target_id AND id_file_type = target_type_id);
END

-- тригер - дозаполнения поля биографии у писателей
CREATE DEFINER=`root`@`%` TRIGGER `biografy` BEFORE INSERT ON `writers` FOR EACH ROW BEGIN
  IF NEW.`text` is NULL THEN  
	SET NEW.`text` = ' is a computer programmer who has spent much of the last 20 years writing books about programming languages.';
  END IF;
END