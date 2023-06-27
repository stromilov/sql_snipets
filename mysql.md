#### MySQL

1. SHOW
    1.  ```SHOW DATABASES;                             список баз данных```
    2.  ```SHOW TABLES [FROM db_name];                 список таблиц в базе```
    3.  ```SHOW COLUMNS FROM таблица [FROM db_name]; или DESC таблица;  список столбцов в таблице```
    4.  ```SHOW CREATE TABLE table_name;               показать структуру таблицы в формате «CREATE TABLE»```
    5.  ```SHOW INDEX FROM tbl_name;                   список индексов```
    6.  ```SHOW GRANTS FOR user [FROM db_name];        привилегии для пользователя.```
    7.  ```SHOW VARIABLES;                             значения системных переменных```
    8.  ```SHOW [FULL] PROCESSLIST;                    статистика по mysqld процессам```
    9.  ```SHOW STATUS;                                общая статистика```
    10. ```SHOW TABLE STATUS [FROM db_name];           статистика по всем таблицам в базе```
2. CREATE
3. INSERT
4. SELECT
    1. * 
    2. SELECT столбец
    3. AS новое_имя_столбец FROM таблица
    4. столбец * 10 FROM
    5. Математические функции
    6. IF
    7. WHERE
    8. AND, OR, NOT
    9. BETWEEN, IN
    10. ORDER BY (ASC, DESC)
    11. LIKE  
    Групповые запросы
    13. DISTINCT
    14. SUM и COUNT






#### 2. CREATE
```sql
CREATE TABLE таблица(
  id INT PRIMARY KEY AUTO_INCREMENT,
  field_1 VARCHAR(30),
  field_2 DECIMAL(8,2),
);
```

#### 3. INSERT
```sql
INSERT [INTO] таблица (столбец_1, столбец_2, ...)
VALUES (значение_1, значение_2, ...);
```

#### 4. SELECT
##### 4.1 SELECT *
Выборка всех данных из таблицы
```sql
SELECT * FROM таблица;
```

##### 4.2 SELECT столбец
Выборка отдельных столбцов
```sql
SELECT столбец_1, столбец_2, ... 
FROM таблица;
```

##### 4.3 SELECT столбец AS
Присвоение новых имен столбцам при формировании выборки
```sql
SELECT столбец AS новое_имя_столбца
FROM таблица;
```

##### 4.4 SELECT
Выборка данных с созданием вычисляемого столбца
```sql
SELECT столбец_1, столбец_2, столбец_3
    столбец_3 * столбец_2
FROM таблица;
```

##### 4.5 Математические функции
Выборка данных, вычисляемые столбцы, математические функции 

Функция | Описание                                                                                              | Пример                  
---------- | ----------------------------------------------------------------------------------------------------- | ---------
CEILING(x) |возвращает наименьшее целое число, большее или равное x (округляет до целого числа в большую сторону)|CEILING(4.2)=5 CEILING(-5.8)=-5                                       
ROUND(x, k)|округляет значение x до k знаков после запятой, если k не указано – x округляется до целого| ROUND(4.361)=4 ROUND(5.86592,1)=5.9          
FLOOR(x)|возвращает наибольшее целое число, меньшее или равное x (округляет до  целого числа в меньшую сторону)|FLOOR(4.2)=4 FLOOR(-5.8)=-6
POWER(x, y) | возведение x в степень y	                                                                            | POWER(3,4)=81.0
SQRT(x)	    | квадратный корень из x	                                                                    | SQRT(4)=2.0 SQRT(2)=1.41...
DEGREES(x)  | конвертирует значение x из радиан в градусы	                                                        | DEGREES(3) = 171.8...
RADIANS(x)  | конвертирует значение x из градусов в радианы	                                                        | RADIANS(180)=3.14...
ABS(x)	    | модуль числа x	                                                                                    | ABS(-1) = 1 ABS(1) = 1
PI()        | pi = 3.1415926...

```sql
SELECT title, price, 
    (price*18/100)/(1+18/100) AS tax, 
    price/(1+18/100) AS price_tax 
FROM book;
```
##### 4.6 IF
Логические функции
```sql
SELECT title, amount, price, 
    IF(amount<4, price*0.5, price*0.7) AS sale
FROM book;
```

##### 4.7 WHERE
Выборка данных по условию
```sql
SELECT title, price 
FROM book
WHERE price < 600;
```

##### 4.8 AND, OR, NOT
Логические операции

    Приоритеты операций:  
    1. круглые скобки  
    2. умножение  (*),  деление (/)  
    3. сложение  (+), вычитание (-)  
    4. операторы сравнения (=, >, <, >=, <=, <>)  
    5. NOT  
    6. AND  
    7. OR  

```sql
SELECT title, author, price 
FROM book
WHERE price > 600 AND author = 'Булгаков М.А.';
```

##### 4.9 BETWEEN, IN
```sql
SELECT title, amount 
FROM book
WHERE amount BETWEEN 5 AND 14;
```

```sql
SELECT title, price 
FROM book
WHERE author IN ('Булгаков М.А.', 'Достоевский Ф.М.');
```

##### 4.10 ORDER BY
Выборка данных с сортировкой
```sql
SELECT title, author, price
FROM book
ORDER BY title DESC;
```

##### 4.11 LIKE
Регулярные выражения

Символ-шаблон |	Описание |	Пример
------------- | -------- | --------
%             | Любая строка, содержащая ноль или более символов | SELECT * FROM book WHERE author LIKE '%М.%' выполняет поиск и выдает все книги, инициалы авторов которых содержат «М.»
_ (подчеркивание) |	Любой одиночный символ	| SELECT * FROM book WHERE title LIKE 'Поэм_' выполняет поиск и выдает все книги, названия которых либо «Поэма», либо «Поэмы» и пр.
```sql
SELECT title 
FROM book
WHERE title LIKE 'Б%';
```
##### Групповые запросы
##### 4.12 DISTINCT
Выборка уникальных элементов
```sql
SELECT DISTINCT author
FROM book;
```

##### 4.13 SUM and COUNT

