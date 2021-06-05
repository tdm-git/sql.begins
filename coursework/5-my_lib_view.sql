use my_library;

-- таблица представление списка книг, с примером использования добавленой функции
CREATE VIEW list_book AS
SELECT 
	b.name as book_name,
	w.name as writer,
	b.`year`,
	ht.name as tag,
	has_file(b.id, 1) as has_photo,
	has_file(b.id, 2) as has_text,
	b.book_size,
	b.date_create 
FROM books b
LEFT JOIN writers w ON b.id_writer = w.id
LEFT JOIN hashtags h ON b.id = h.id_book
LEFT JOIN hashtags_table ht ON ht.id = h.id_tag
ORDER BY b.`year`;

-- каталог базы книг
CREATE VIEW catalog AS
SELECT 
	ht.group_name,
	ht.name as tag,
	b.name as book_name,
	b.`year`
FROM books b
LEFT JOIN hashtags h ON b.id = h.id_book
LEFT JOIN hashtags_table ht ON ht.id = h.id_tag
ORDER BY ht.group_name, ht.name, b.`year`;

