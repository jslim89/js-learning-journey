# Lessons

## Create user and grant permission
```sql
# Create a database called 'db_foo'
CREATE DATABASE db_foo;
# Create a user 'foo' which only allowed access via 'localhost'
# i.e. mysql -u foo -p
CREATE USER 'foo'@'localhost' IDENTIFIED BY 'password';
# Grant all privileges to user 'foo' only for database 'db_foo'
# if want to allowed for ALL database, just change 'db_foo.*' to '*.*'
GRANT ALL PRIVILEGES ON db_foo.* TO 'foo'@'localhost' WITH GRANT OPTION;
# Create a user 'foo' which allowed access remotely
# i.e. mysql -u foo -h 192.168.1.xxx -p
CREATE USER 'foo'@'%' IDENTIFIED BY 'another_or_same_password';
# Grant all privileges to user 'foo' only for database 'db_foo'
GRANT ALL PRIVILEGES ON db_foo.* TO 'foo'@'%' WITH GRANT OPTION;
```

Reference: [MySQL: 6.3.2. Adding User Accounts] (http://dev.mysql.com/doc/refman/5.5/en//adding-users.html)

## Dump database to sql file
```sh
$ mysqldump -u root -p database_name > filename.sql
# enter password
```
`-u` - refer to user (normally use root)  
`-p` - will prompt you password

## Select current DateTime
```sql
mysql > SELECT NOW();
```
Output:
```
+---------------------+
| NOW()               |
+---------------------+
| 2012-12-11 17:28:30 |
+---------------------+
1 row in set (0.00 sec)
```

Reference: [Mysql/Php - Current date and time](http://stackoverflow.com/questions/3618401/mysql-php-current-date-and-time#answers)
