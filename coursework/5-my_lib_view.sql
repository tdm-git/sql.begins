use my_library;


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


SELECT 
	ht.group_name,
	ht.name as tag,
	b.name as book_name,
	b.`year`
FROM books b
LEFT JOIN hashtags h ON b.id = h.id_book
LEFT JOIN hashtags_table ht ON ht.id = h.id_tag
/*WHERE 
	ht.name = '#python' */
ORDER BY ht.group_name, ht.name, b.`year`;

-- добавить теги
SELECT 
	'book', b.name
	FROM books b 
	WHERE b.id = 1518
UNION 
SELECT
	'link', l.link 
	FROM outer_links l 
	WHERE l.id_book = 1518
UNION 
SELECT
	'file',bf.link 
	FROM books_files bf 
	WHERE bf.id_book = 1518
UNION 
SELECT
	'comment',c.`text` 
	FROM comments c 
	WHERE c.id_book = 1518;

SELECT 
	w.name,
	b.`year`,
	b.name 
FROM writers w
JOIN books b on b.id_writer = w.id
WHERE 
    -- w.id = 28
    w.name LIKE '%Adam%'
ORDER by b.`year`;	


CREATE FUNCTION my_library.has_file(target_id INT, target_type_id INT)
RETURNS BOOLEAN READS SQL DATA
BEGIN
	RETURN EXISTS(SELECT 1 FROM books_files WHERE id_book = target_id AND id_file_type = target_type_id);
END