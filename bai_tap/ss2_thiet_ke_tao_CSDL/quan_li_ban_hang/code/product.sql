create database ss2_product_manager;

CREATE TABLE customer (
    cid INT AUTO_INCREMENT PRIMARY KEY,
    cname VARCHAR(50),
    cage INT
);

CREATE TABLE `order` (
    oid INT AUTO_INCREMENT PRIMARY KEY,
    odate DATE,
    ototalprice DOUBLE,
    cid INT,
    FOREIGN KEY (cid)
        REFERENCES customer (cid)
);

CREATE TABLE product (
    pid INT AUTO_INCREMENT PRIMARY KEY,
    pname VARCHAR(45),
    pprice DOUBLE
);

CREATE TABLE order_detail (
    odqty VARCHAR(50),
    oid INT,
    pid INT AUTO_INCREMENT,
    PRIMARY KEY (oid , pid),
    FOREIGN KEY (oid)
        REFERENCES `order` (oid),
    FOREIGN KEY (pid)
        REFERENCES product (pid)
);
