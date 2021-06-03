use my_library;
-- основная таблица книг 
select 
b.name as book_name,
w.name as writer,
b.`year`,
CONCAT('#',ht.group_name,' ',ht.name) as tag 
From books b
join writers w on b.id_writer = w.id
join hashtags h on b.id = h.id_book 
join hashtags_table ht on h.id_tag = ht.id 
Where 
    b.name LIKE '%Python%'
ORDER by b.`year` ;
-- таблица по автору -- добавить теги
SELECT 
w.name,
b.`year`,
b.name 
From writers w
join books b on b.id_writer = w.id
Where 
    -- w.id = 28
    w.name LIKE '%Hawkins%'
ORDER by b.`year`;
-- таблица по книге -- добавить теги
select 
'book',
b.name
from books b 
where 
    b.id = 1518
UNION 
SELECT
'link',
l.link 
from outer_links l 
where 
    l.id_book = 1518
UNION 
SELECT
'file',
bf.link 
from books_files bf 
where 
    bf.id_book = 1518
UNION 
SELECT
'comment',
c.`text` 
from comments c 
where 
    c.id_book = 1518;
-- таблица хештегов
select * 
from hashtags_table ht;

