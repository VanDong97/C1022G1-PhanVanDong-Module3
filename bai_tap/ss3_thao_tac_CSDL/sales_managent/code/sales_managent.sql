create database ss3_sales_manager;


CREATE TABLE customer (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    c_name VARCHAR(50),
    c_age INT
);

insert into customer(c_name,c_age) value ('Minh Quan',10);
insert into customer(c_name,c_age) value ('Ngoc Oanh',20);
insert into customer(c_name,c_age) value ('Hong Ha',50);
SELECT 
    *
FROM
    customer;

CREATE TABLE `order` (
    o_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT,
    o_date DATE,
    o_totalprice DOUBLE,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);
insert into `order`(c_id,o_date,o_totalprice) value (1,'2006-3-21',null);
insert into `order`(c_id,o_date,o_totalprice) value (2,'2006-03-26',null);
insert into `order`(c_id,o_date,o_totalprice) value (1,'2006-03-16',null);
SELECT 
    *
FROM
    `order`;

CREATE TABLE product (
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(45),
    p_price DOUBLE
);

insert into product (p_name,p_price) value ('Máy Giặt','3');
insert into product (p_name,p_price) value ('Tủ Lạnh','5');
insert into product (p_name,p_price) value ('Điều Hòa','7');
insert into product (p_name,p_price) value ('Quạt','1');
insert into product (p_name,p_price) value ('Bếp Điện','2');

SELECT 
    *
FROM
    product;
    
create table order_detail (
	o_id int,
    p_id int,
    o_dqty varchar(50),
    primary key (o_id , p_id),
    foreign key (o_id)
        references `order` (o_id),
    foreign key (p_id)
        references product (p_id)
);

insert into order_detail (o_id,p_id,o_dqty) value (1,1,'3');
insert into order_detail (o_id,p_id,o_dqty) value (1,3,'7');
insert into order_detail (o_id,p_id,o_dqty) value (1,4,'2');
insert into order_detail (o_id,p_id,o_dqty) value (2,1,'1');
insert into order_detail (o_id,p_id,o_dqty) value (3,1,'8');
insert into order_detail (o_id,p_id,o_dqty) value (2,5,'4');
insert into order_detail (o_id,p_id,o_dqty) value (2,3,'3');

SELECT 
    *
FROM
    order_detail;
    
    -- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
    select `order`.o_id, `order`.o_date, `order`.o_totalprice from `order`;
    
    -- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
    select customer.c_name,`order`.o_id,product.p_name
    from customer join `order` on `order`.c_id = customer.c_id
    join order_detail on `order`.o_id = order_detail.o_id
    join product on order_detail.p_id = product.p_id;
    
    -- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
    SELECT 
    c.c_name
FROM
    customer c
        LEFT JOIN
    `order` o ON c.c_id = o.c_id
WHERE
    o.o_id IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)

SELECT 
    o.o_id,
    o.o_date,
    (SELECT 
            SUM(`order`.o_dqty * p.p_price)
        FROM
            order_detail `order`
                JOIN
            product p ON `order`.p_id = p.p_id
        WHERE
            `order`.o_id = o.o_id) AS o_totalprice
FROM
    `order` o;