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
    3. AS
    4. столбец * 10 FROM
    5. Математические функции
    6. IF
    7. WHERE
    8. AND, OR, NOT
    9. BETWEEN, IN
    10. ORDER BY [ASC, DESC]
    11. LIKE
    12. ROUND()  
    Групповые запросы
    13. DISTINCT
    14. SUM() и COUNT()
    15. MIN(), MAX(), AVG()
5. Вложенные запросы
    1. IN
    2. ANY и ALL
    3. SELECT (SELECT...)
6. Корректировка данных
    1. Добавление записей из другой таблицы
    2. UPDATE
    3. Обновление нескольких столбцов
    4. Обновление в нескольких таблицах
    5. DELETE
    6. DELETE ... WHERE ...
    7. CREATE
7. Связь между таблицами
    1. FOREIGN KEY REFERENCES
    2. ON DELETE
        1. CASCADE
        2. SET NULL
        3. SET DEFAULT
        4. RESTRICT
    3. JOIN
        1. INNER JOIN

Порядок выполнения  SQL запроса на выборку на СЕРВЕРЕ:

FROM  
WHERE  
GROUP BY  
HAVING  
SELECT  
ORDER BY  



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
Присвоение новых имен(алиас) столбцам или таблицам при формировании выборки
```sql
SELECT столбец AS новое_имя_столбца
FROM таблица;
```
Или занесения значения во все поля столбца
```sql
SELECT 5 AS amount
FROM book;
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

##### 4.10 ORDER BY [ASC, DESC]
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

##### 4.12 ROUND()
Округление (само число, чисел после запятой)
```sql
SELECT ROUND(price * count) 
FROM book;
```

##### Групповые запросы
##### 4.13 DISTINCT
Выборка уникальных элементов
```sql
SELECT DISTINCT author
FROM book;
```

##### 4.14 SUM() and COUNT()
Сумма элементов и количество элементов
```sql
SELECT author, sum(amount)
FROM book
GROUP BY author;
```

##### 4.15 MIN(), MAX(), AVG()
Минималный элемент, максимальный элемент, среднее арифметическое
```sql
SELECT author, min(price)
FROM book
GROUP BY author;
```

##### 4.16 HAVING
Используется вместо WHERE в групповых запросах
```sql
SELECT MIN(price)
FROM book
GROUP BY author
HAVING (price * amount) > 5000;
```
#### 5 Вложенные запросы
```sql
SELECT title, author, price, amount
FROM book
WHERE price = (
         SELECT MIN(price) 
         FROM book
);
```
##### 5.1 IN
```sql
SELECT title, author, amount, price
FROM book
WHERE author IN (
        SELECT author 
        FROM book 
        GROUP BY author 
        HAVING SUM(amount) >= 12
);
```      

##### 5.2 ANY и ALL
```sql
SELECT title, author, amount, price
FROM book
WHERE amount < ALL (
        SELECT AVG(amount) 
        FROM book 
        GROUP BY author 
);
```

##### 5.3 SELECT (SELECT ...)
Вложенный запрос как ещё один столбец в выводе
```sql
SELECT title, author, amount, 
    (
     SELECT AVG(amount) 
     FROM book
    ) AS Среднее_количество 
FROM book
WHERE abs(amount - (SELECT AVG(amount) FROM book)) >3;
```

#### 6 Корректировка данных
```sql
INSERT INTO book (title, author, price, amount) 
SELECT title, author, price, amount 
FROM supply;
```

##### 6.1 UPDATE
Обновление данных
```sql
UPDATE book 
SET price = 0.7 * price;
```

##### 6.2 UPDATE
Обновление несколькоих столбцов
UPDATE таблица SET поле1 = выражение1, поле2 = выражение2
```sql
UPDATE book 
SET amount = amount - buy,
    buy = 0;
```

##### 6.4 Обновление в нескольких таблицах
```sql
UPDATE book, supply 
SET book.amount = book.amount + supply.amount
WHERE book.title = supply.title AND book.author = supply.author;
```

##### 6.5 DELETE
```sql
DELETE FROM supply;
```

##### 6.6 DELETE ... WHERE ...
```sql
DELETE FROM supply 
WHERE title IN (
        SELECT title 
        FROM book
);
```

##### 6.7 CREATE
Создание новой таблицы на основе старой
```sql
CREATE TABLE ordering AS
SELECT author, title, 5 AS amount
FROM book
WHERE amount < 4;
```

#### 7 Связь с другими таблицами
    Один ко многим   <----
    Многие ко многим <--->
    
###### 7.1 FOREIGN KEY REFERENCES 
```sql
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id) 
);
```

###### 7.2 ON DELETE
Действия при удалении
    
###### 7.2.1 CASCADE
Автоматически удаляет строки из зависимой таблицы при удалении  связанных строк в главной таблице
```sql
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id) ON DELETE CASCADE
);
```

###### 7.2.2 SET NULL
При удалении  связанной строки из главной таблицы устанавливает для столбца внешнего ключа значение NULL
```sql
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id) ON DELETE SET NULL
);
```

###### 7.2.3 SET DEFAULT
Значение внешнего ключа устанавливается в значение по умолчанию для данного столбца.
```sql
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id) ON DELETE SET DEFAULT
);
```

###### 7.2.4 RESTRICT
Отклоняет удаление строк в главной таблице при наличии связанных строк в зависимой таблице
```sql
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id) ON DELETE RESTRICT
);
```

#### 7.3 JOIN
###### 7.3.1 INNER JOIN
```sql
SELECT title, name_author
FROM 
    author INNER JOIN book
    ON author.author_id = book.author_id;
```

###### 7.3.2 LEFT или RIGHT JOIN
```sql
SELECT name_author, title 
FROM author LEFT JOIN book
     ON author.author_id = book.author_id
ORDER BY name_author; 
```

###### 7.3.3 CROSS JOIN
Декартово произведение таблиц
```sql
SELECT name_author, name_genre
FROM 
    author, genre;

или

SELECT name_author, name_genre
FROM 
    author CROSS JOIN genre;
```
