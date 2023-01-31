create database ss5_demo;

create table products(
	id int  primary key,
    product_code varchar(50),
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description varchar(50),
    product_status varchar(50)
);

insert into products (id,product_code, product_name, product_price, product_amount, product_description, product_status)
value (1,'aa','xe máy','10000',5,'honda','cũ'),
	(2,'bb','moto','15000',2,'z1000','mới'),
	(3,'cc','oto','20000',3,'audi','cũ'),
	(4,'dd','xe đạp','5000',10,'mini','mới'),
	(5,'ee','xe đap điện','12000',4,'xee','cũ');
    
create unique index index_unique on products (product_code);
create index index_composite on products (product_name, product_price);
explain select * from products where product_code = 'cc';
explain select * from products where product_name = 'oto';

-- Tạo view

create view view_products (`code`,`name`,price,`status`) as 
select product_code, product_name, product_price, product_status from products;
select * from view_products;

-- Sửa view
update view_products
set `name` = 'xe máy điện'
where `code` = 'aa';
select * from products;

-- Xóa view
drop view view_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter //
create procedure find_all_product()
begin
select * from products ;
end //
delimiter ;
call find_all_product();

-- Tạo store procedure thêm một sản phẩm mới

delimiter //
create procedure update_product()
begin
update products new_p
set
	new_p.product_code = code,
    new_p.product_name = name,
    new_p.product_price = price,
    new_p.product_amount = amount,
    new_p.product_description = description,
    new_p.product_status = status
    where new_p.id = id ;
end //
delimiter ;
call update_product (6,'ff','máy cày','20000',3,'abs','mới');

-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure adđ_product (id int, code varchar(50), name varchar(50), price int, amount varchar(50), description varchar(50), status varchar(50))
begin
insert into products (id,product_code,product_name,product_price,product_amount,product_description,product_status)
values (id,code,name,price,amount,description,status);
end //
delimiter ;
call adđ_product (7,'gg','xe rùa','10000',3,'cbs','mới');

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure delete_product (id int)
begin
delete from products p where p.id = id;
end //
delimiter ;
call delete_product(2);