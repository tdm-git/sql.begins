mysqldump -u root -p --where="true limit 100" mysql help_keyword > mysql_table.sql

mysqladmin -u root -p create sample
mysql -u root -p sample < mysql_table.sql