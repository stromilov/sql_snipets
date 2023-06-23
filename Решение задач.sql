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

1.4
--MySQL
create table TV(
  id       int           primary key auto_increment,
  model    varchar(30),
  maker    varchar(30),
  diagonal decimal(3,2),
  price    decimal(12,2)
);
