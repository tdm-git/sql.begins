use my_library;

-- таблица представление списка книг, с примером использования добавленой функции
DROP VIEW IF EXISTS list_book;
CREATE VIEW list_book AS
SELECT 
	b.name as book_name,
	wr.writer_name,
    b.`year`,
	ht.name as tag,
	has_file(b.id, 1) as has_photo,
	has_file(b.id, 2) as has_text,
	b.book_size,
	b.date_create 
FROM books b
LEFT JOIN hashtags h ON b.id = h.id_book
LEFT JOIN hashtags_table ht ON ht.id = h.id_tag
LEFT JOIN (SELECT 
	GROUP_CONCAT(w.name,' ') as writer_name,
	bw.id_book as id_book
	FROM books_writer bw 
	LEFT JOIN writers w ON bw.id_writer = w.id
	GROUP by bw.id_book) as wr on wr.id_book = b.id
ORDER BY b.`year`;

-- каталог базы книг
DROP VIEW IF EXISTS catalog;
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

