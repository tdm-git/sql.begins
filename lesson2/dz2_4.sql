mysqldump --where="true limit 100" mysql help_keyword > mysql_table.sql

mysqladmin create sample
mysql sample < mysql_table.sql