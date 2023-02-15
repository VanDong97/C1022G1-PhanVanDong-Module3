create database demo;
use demo;
create table users(
id int not null auto_increment,
name varchar(120) not null,
email varchar(220) not null,
country varbinary(120),
primary key (id)
);