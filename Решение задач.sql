1.1
--MySQL
create table DBs(
  id      int          primary key auto_increment,
  name    varchar(30),
  version varchar(30)
);

1.2

1.4
--MySQL
create table TV(
  id       int           primary key auto_increment,
  model    varchar(30),
  maker    varchar(30),
  diagonal decimal(3,2),
  price    decimal(12,2)
);
