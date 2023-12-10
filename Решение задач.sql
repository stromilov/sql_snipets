1.1
--MySQL
create table DBs(
  id      int          primary key auto_increment,
  name    varchar(30),
  version varchar(30)
);

1.2
--MySQL
insert DBs(name, version) values("MySQL", "8.0");
insert DBs(name, version) values("PostgreSQL", "15.3");
insert DBs(name, version) values("Oracle", "12.2.0.2");
insert DBs(name, version) values("SQLite", "3.42.0");
insert DBs(name, version) values("MongoDB", "6.0.5");
insert DBs(name, version) values("Microsoft SQL Server", "1.11");
insert DBs(name, version) values("Redis", "7.0.11");
insert DBs(name, version) values("MariaDB", "11.0.2");
insert DBs(name, version) values("Firebase", "12.3.1");
insert DBs(name, version) values("Elasticsearch", "8.8.0");
insert DBs(name, version) values("DynamoDB", "2019.11.21");
insert DBs(name, version) values("Cassandra", "4.1.2");

1.3
--MySQL
select * from DBs;

1.4
--MySQL
create table TV(
  id       int           primary key auto_increment,
  model    varchar(30),
  maker    varchar(30),
  diagonal decimal(3,2),
  price    decimal(12,2)
);

1.5
--MySQL
insert into TV(model, maker, diagonal, price) values
  ("MS-200", "SONY", 27.5, 4150),
  ("VR500", "JVC", 15, 520),
  ("SuperVega", "SHARP", 21, 800),
  ("HX24H", "DEXP", 24, 700),
  ("Smart M5", "SAMSUNG", 24, 900),
  ("UE43", "SAMSUNG", 43, 1100),
  ("MI TV A2", "Xiaomi", 32, 1500);

1.6
--MySQL




Создать таблицы интернет магазина книг:
--MySQL
create table author (
    author_id   int primary key auto_increment,
    name_author varchar(30)
    );

create table genre (
    genre_id   int primary key auto_increment,
    name_genre varchar(30)
    );

create table book(
    book_id   int          primary key auto_increment,
    title     varchar(30),
    author_id int          not null,
    genre_id  int          not null,
    price     decimal(8,2),
    amount    int, 
    foreign key (author_id) references author (author_id) on delete cascade,
    foreign key (genre_id)  references genre  (genre_id)  on delete cascade
    );

create table city(
    city_id       int primary key auto_increment,
    name_city     varchar(30),
    days_delivery int
    );

create table client(
    client_id   int primary key auto_increment,
    name_client varchar(50),
    city_id     int,
    email       varchar(30),
    foreign key (city_id) references city (city_id) on delete cascade
    );

create table buy(
    buy_id          int primary key auto_increment,
    buy_description varchar(100),
    client_id       int,
    foreign key (client_id) references client (client_id) on delete cascade
    );
    
create table buy_book(
    buy_book_id int primary key auto_increment,
    buy_id      int,
    book_id     int,
    amount      int,
    foreign key (buy_id) references buy (buy_id) on delete cascade,
    foreign key (book_id) references book (book_id) on delete cascade
    );
    
create table step(
    step_id   int primary key auto_increment,
    name_step varchar(30)
    );
    
create table buy_step(
    buy_step_id   int primary key auto_increment,
    buy_id        int,
    step_id       int,
    date_step_beg date,
    date_step_end date,
    foreign key (buy_id) references buy (buy_id) on delete cascade,
    foreign key (step_id) references step (step_id) on delete cascade
    );

Заполнить таблицы интернет магазина книг данными:
--MySQL
insert into author(name_author)
values("Булгаков М.А."), 
      ("Достоевский Ф.М."), 
      ("Есенин С.А."), 
      ("Пастернак Б.Л."),
      ("Лермонтов М.Ю.");
       
insert into genre(name_genre)
values("Роман"), 
      ("Поэзия"), 
      ("Приключения");

insert into book(title, author_id, genre_id, price, amount)
values("Мастер и маргарита", 1, 1, 670.99, 3),
      ("Белая гвардия", 1, 1, 540.50, 5),
      ("Идиот", 2, 1, 460.00, 10),
      ("Братья Каромазовы", 2, 1, 799.01, 2),
      ("Игрок", 2, 1, 480.50, 10),
      ("Ситхотворения и поэмы", 3, 2, 650.00, 15),
      ("Черный человек", 3, 2, 570.20, 6),
      ("Лирика", 4, 2, 518.99, 2);
      
insert into city(name_city, days_delivery)
values("Москва", 5),
      ("Санкт-Петербург", 3),
      ("Владивосток", 12);
      
insert into client(name_client, city_id, email)
values("Баранов Павел", 3, "baranov@test"),
      ("Абрамова Катя", 1, "abramova@test"),
      ("Семенов Иван", 2, "semenov@test"),
      ("Яковлева Галина", 1, "yakovleva@test");
      
insert into buy(buy_description, client_id)
values("Доставка только вечером", 1),
      (null, 3),
      ("Упаковать каждую книгу по отдельности", 1),
      (null, 1);
      
insert into buy_book(buy_id, book_id, amount)
values(1, 1, 1),
      (1, 7, 2),
      (1, 3, 1),
      (2, 8, 2),
      (3, 3, 2),
      (3, 2, 1),
      (3, 1, 1),
      (4, 5, 1);
      
insert into step(name_step)
values("Оплата"), ("Упаковка"), ("Транспортировка"), ("Доставка");
     
insert into buy_step(buy_id, step_id, date_step_beg, date_step_end)
values(1, 1, "2020-02-20", "2020-02-20"),
      (1, 2, "2020-02-20", "2020-02-21"),
      (1, 3, "2020-02-22", "2020-03-07"),
      (1, 4, "2020-03-08", "2020-03-08"),
      (2, 1, "2020-02-28", "2020-02-28"),
      (2, 2, "2020-02-29", "2020-03-01"),
      (2, 3, "2020-03-02", null        ),
      (2, 4, null,         null        ),
      (3, 1, "2020-03-05", "2020-03-05"),
      (3, 2, "2020-03-05", "2020-03-06"),
      (3, 3, "2020-03-06", "2020-03-10"),
      (3, 4, "2020-03-11", null        ),
      (4, 1, "2020-03-20", null        ),
      (4, 2, null,         null        ),
      (4, 3, null,         null        ),
      (4, 4, null,         null        );




Заполнить базу данных "Тестирование":
--MySQL
create table student(
    student_id   int primary key auto_increment,
    name_student varchar(30)
    );
    
create table subject(
    subject_id   int primary key auto_increment,
    name_subject varchar(50)
    );
    
create table question(
    question_id   int primary key auto_increment,
    name_question varchar(100),
    subject_id    int,
    foreign key (subject_id) references subject(subject_id) on delete cascade
    );
    
create table answer(
    answer_id   int primary key auto_increment,
    name_answer varchar(100),
    question_id int,
    is_correct  bool,
    foreign key (question_id) references question(question_id) on delete cascade
    );
    
create table attempt(
    attempt_id   int primary key auto_increment,
    student_id   int,
    subject_id   int,
    date_attempt date,
    result       int,
    foreign key (subject_id) references subject(subject_id) on delete cascade,
    foreign key (student_id) references student(student_id) on delete cascade
    );

create table testing(
    testing_id  int primary key auto_increment,
    attempt_id  int,
    question_id int,
    answer_id   int,
    foreign key (attempt_id) references attempt (attempt_id) on delete cascade
    );
    
insert student(name_student) values
    ("Баранов Павел"),
    ("Абрамова Катя"),
    ("Семенов Иван"),
    ("Яковлева Галина");

insert subject(name_subject) values
    ("Основы SQL"),
    ("Основы баз данных"),
    ("Физика");

insert attempt(student_id, subject_id, date_attempt, result) values
    (1, 2, "2020-03-23", 67),
    (3, 1, "2020-03-23", 100),
    (4, 2, "2020-03-26", 0),
    (1, 1, "2020-04-15", 33),
    (3, 1, "2020-04-15", 67),
    (4, 2, "2020-04-21", 100),
    (3, 1, "2020-05-17", 33);

insert question(name_question, subject_id) values
    ("Запрос на выборку начинается с ключевого слова:", 1),
    ("Условие, по которому отбираются записи, задается после ключевого слова:", 1),
    ("Для сортировки используется:", 1),
    ("Какой запрос выбирает все записи из таблицы student:", 1),
    ("Для внутреннего соединения таблиц используется оператор:", 1),
    ("База данных - это:", 2),
    ("Отношение - это:", 2),
    ("Концептуальная модель используется для", 2),
    ("Какой тип данных не допустим в реляционной таблице?", 2);

insert answer(name_answer, question_id, is_correct) values
    ("UPDATE",   1, false),
    ("SELECT",   1, true),
    ("INSERT",   1, false),
    ("GROUP BY", 2, false),
    ("FROM",     2, false),
    ("WHERE	",   2, true),
    ("SELECT",   2, false),
    ("SORT",     3, false),
    ("ORDER BY", 3, true),
    ("RANG BY",  3, false),
    ("SELECT * FROM student", 4, true),
    ("SELECT student", 4, false),
    ("INNER JOIN",     5, true),
    ("LEFT JOIN",      5, false),
    ("RIGHT JOIN",     5, false),
    ("CROSS JOIN",     5, false),
    ("совокупность данных, организованных по определенным правилам", 6, true),
    ("совокупность программ для хранения и обработки больших массивов информации",    6, false),
    ("строка",  7, false),
    ("столбец", 7, false),
    ("таблица", 7, true),
    ("обобщенное представление пользователей о данных ",   8, true),
    ("описание представления данных в памяти компьютера ", 8, false),
    ("база данных", 8, false),
    ("file",        9, true),
    ("INT",         9, false),
    ("VARCHAR",     9, false),
    ("DATE",        9, false);
    
insert testing(attempt_id, question_id, answer_id) values
    (1, 9, 25),
    (1, 7, 19),
    (1, 6, 17),
    (2, 3, 9),
    (2, 1, 2),
    (2, 4, 11),
    (3, 6, 18),
    (3, 8, 24),
    (3, 9, 28),
    (4, 1, 2),
    (4, 5, 16),
    (4, 3, 10),
    (5, 2, 6),
    (5, 1, 2),
    (5, 4, 12),
    (6, 6, 17),
    (6, 8, 22),
    (6, 7, 21),
    (7, 1, 3),
    (7, 4, 11),
    (7, 5, 16);
    
select * from student;
select * from subject;
select * from attempt;
select * from question;
select * from answer;
select * from testing;
