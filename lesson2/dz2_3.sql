mysqldump -u root -p example > example_backup.sql

mysqladmin -u root -p create sample
mysql -u root -p sample < example_backup.sql