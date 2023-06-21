#### MySQL

1. SHOW
    1.  ```SHOW DATABASES;                             список баз данных```
    2.  ```SHOW TABLES [FROM db_name];                 список таблиц в базе```
    3.  ```SHOW COLUMNS FROM таблица [FROM db_name];   список столбцов в таблице```
    4.  ```SHOW CREATE TABLE table_name;               показать структуру таблицы в формате «CREATE TABLE»```
    5.  ```SHOW INDEX FROM tbl_name;                   список индексов```
    6.  ```SHOW GRANTS FOR user [FROM db_name];        привилегии для пользователя.```
    7.  ```SHOW VARIABLES;                             значения системных переменных```
    8.  ```SHOW [FULL] PROCESSLIST;                    статистика по mysqld процессам```
    9.  ```SHOW STATUS;                                общая статистика```
    10. ```SHOW TABLE STATUS [FROM db_name];           статистика по всем таблицам в базе```
3. CREATE
4. SELECT






#### 2. CREATE
```sql
CREATE TABLE table_name(
  id INT PRIMARY KEY AUTO_INCREMENT,
  field_1 VARCHAR(30),
  field_2 DECIMAL(8,2),
);
```
