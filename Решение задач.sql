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

create table buy2(
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
insert 
