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

## String concatenation with IF condition
This is to avoid the **extra comma** appear if some of the component doesn't exist.
```sql
SELECT CONCAT(
    address
    , IF(address2 IS NULL OR address2 = '', '', CONCAT(', ', address2))
    , IF(address3 IS NULL OR address3 = '', '', CONCAT(', ', address3))
    , IF(postcode IS NULL OR postcode = '', '', CONCAT(', ', postcode))
    , IF(state IS NULL OR state = '', '', CONCAT(', ', state))
) AS full_address
FROM what_ever;
```

Reference: [MySQL Forums :: Views :: IF and CONCAT](http://forums.mysql.com/read.php?100,94227,94227)

## Dump a specific table
```sh
$ mysqldump -u user -p db_name table_name1 table_name2 > file.sql
```

Reference: [How do you mysqldump specific table(s)?](http://dba.stackexchange.com/questions/9306/how-do-you-mysqldump-specific-tables#answer-9309)

## Get a specific opponent from explode equivalent string
```sql
SELECT SUBSTRING_INDEX(
    SUBSTRING_INDEX('123-456-789-abc-this_is_what_we_want-xyz', '-',5)
    , '-', -1
);
```

Look at the inner `SUBSTRING_INDEX`, we explode by **-** _(dash)_, so the **5** is to take from the **1st** to **5th** opponent.  
So we get **123-456-789-abc-this_is_what_we_want**.

Now the outer `SUBSTRING_INDEX` is to get **1** opponent start from the left, which is the **last** opponent, is what we want **this_is_what_we_want**.

## Migrate data form table A to table B
```sql
INSERT INTO table_b (col_1, col_2, col_3)
(SELECT col_1, col_2, col_3
FROM table_a
WHERE col_1 = 'foo');
```

Reference: [MySQL : perform a big data migration between tables](http://dba.stackexchange.com/questions/24116/mysql-perform-a-big-data-migration-between-tables)

## `printf` like in MySQL

```sql
mysql> SELECT LPAD(`id` , 4, '0') FROM `table_name` LIMIT 10;
+---------------------+
| LPAD(`id` , 4, '0') |
+---------------------+
| 0001                |
| 0002                |
| 0003                |
| 0004                |
| 0005                |
| 0006                |
| 0007                |
| 0008                |
| 0009                |
| 0010                |
+---------------------+
```
Which is similar to `printf("%04d", value);`

Reference: [printf or similar inside an SQL query?](http://stackoverflow.com/questions/7266031/printf-or-similar-inside-an-sql-query/7266053#7266053)

## Copy a table structure from a database to another database
```sql
mysql> CREATE TABLE source_database.foo_table LIKE dest_database.foo_table;
```

Reference: [Copy an existing MySQL table to a new table](http://www.tech-recipes.com/rx/1487/copy-an-existing-mysql-table-to-a-new-table/)
