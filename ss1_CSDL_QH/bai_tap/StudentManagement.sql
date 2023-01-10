create database c1022g1_module3;

create table class(
	id int,
    `name` varchar(45)

);

insert into class (id,`name`) value (1,'c1022g1');

select * from class;

select id as 'Mã Số', name 'Tên Lớp' from class;

create table teacher(
	id int,
	`name` varchar(45),
	age int,
	country varchar(45)
);

insert into teacher(id,`name`,age,country) value(2,'Nguyễn Văn A',45,'Việt Nam');

select * from teacher;