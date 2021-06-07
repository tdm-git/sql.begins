use my_library;

-- статистика по категориям
-- количество книг 
SELECT
	ht.name as tag,
	count(h.id_book) as `count`
FROM hashtags h
LEFT JOIN hashtags_table ht ON h.id_tag = ht.id 
GROUP by tag
ORDER BY `count` desc;

-- выборка информации по одной книги, для страницы книги
SELECT 
	'book','name', b.name
	FROM books b 
	WHERE b.id = 1518
UNION 
SELECT 
	'book','writer', w.name
	FROM books_writer wb 
	LEFT JOIN writers w ON wb.id_writer = w.id
	WHERE wb.id_book = 1518
UNION 
SELECT 
	'book','year', b.year
	FROM books b 
	WHERE b.id = 1518
UNION 
SELECT
	'link', l.site ,l.link 
	FROM outer_links l 
	WHERE l.id_book = 1518
UNION 
SELECT
	'file',bf.name,bf.link 
	FROM books_files bf 
	WHERE bf.id_book = 1518
UNION 
SELECT
	'comment',ct.name ,c.`text` 
	FROM comments c 
	LEFT JOIN comments_type ct ON c.id_type = ct.id
	WHERE c.id_book = 1518
UNION 
SELECT
	'hashtag',ht.group_name,ht.name 
	FROM hashtags h 
	LEFT JOIN hashtags_table ht ON h.id_tag = ht.id
	WHERE h.id_book = 1518;

-- выборка по автору
SELECT 
	w.name as writer,
	b.`year`,
	b.name,
	ht.name as tag
FROM books_writer wb
LEFT JOIN writers w on wb.id_writer = w.id 
LEFT JOIN books b on wb.id_book = b.id 
LEFT JOIN hashtags h on wb.id_book  = h.id_book 
LEFT JOIN hashtags_table ht on ht.id  = h.id_tag
-- пример возможных отборов - по значению, списку, неточному совпадению
WHERE 
    -- w.id = 28
    w.id IN (28, 62, 80)
    -- w.name LIKE '%Adam%'
ORDER by writer, b.`year`;