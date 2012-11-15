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
