create database case_study;

CREATE TABLE vi_tri (
    ma_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);
insert into vi_tri(ten_vi_tri) value ('Quản Lí');
insert into vi_tri(ten_vi_tri) value ('Nhân Viên');

create table trinh_do(
	ma_trinh_do int auto_increment primary key,
    ten_trinh_do varchar(45)
);
insert into trinh_do(ten_trinh_do) value ('Trung Cấp');
insert into trinh_do(ten_trinh_do) value ('Cao Đẳng');
insert into trinh_do(ten_trinh_do) value ('Đại Học');
insert into trinh_do(ten_trinh_do) value ('Sau Đại Học');

create table bo_phan (
	ma_bo_phan int auto_increment primary key,
    ten_bo_phan varchar(45)
);
insert into bo_phan(ten_bo_phan) value ('Sale-Marketing');
insert into bo_phan(ten_bo_phan) value ('Hành Chính');
insert into bo_phan(ten_bo_phan) value ('Phục vụ');
insert into bo_phan(ten_bo_phan) value ('Quản Lí');

create table nhan_vien(
	ma_nhan_vien int auto_increment primary key,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    so_cmnd varchar(45) not null,
    luong double not null,
    so_dien_thoai varchar(45) not null,
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int not null,
    ma_trinh_do int not null,
    ma_bo_phan int not null,
    
		foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
		foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
		foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Hồ Thị Yến','1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','24 Nguyễn Chí Thanh, Huế',2,3,2);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) value ('Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);

create table loai_khach(
	ma_loai_khach int auto_increment primary key,
    ten_loai_khach varchar(45)
);
	insert into loai_khach(ten_loai_khach) value ('Diamond');
	insert into loai_khach(ten_loai_khach) value ('Platinium');
	insert into loai_khach(ten_loai_khach) value ('Gold');
	insert into loai_khach(ten_loai_khach) value ('Silver');
	insert into loai_khach(ten_loai_khach) value ('Member');

create table khach_hang(
	ma_khach_hang int auto_increment primary key,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    gioi_tinh bit(1) not null,
    so_cmnd varchar(45) not null,
    so_dien_thoai varchar(45) not null,
    email varchar(45),
    dia_chi varchar(45),
    ma_loai_khach int not null,
    
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',1);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1);
	insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) value ('Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);

create table loai_dich_vu(
	ma_loai_dich_vu int auto_increment primary key,
    ten_loai_dich_vu varchar(45)
);
	insert into loai_dich_vu (ten_loai_dich_vu) value ('Villa');
	insert into loai_dich_vu (ten_loai_dich_vu) value ('House');
	insert into loai_dich_vu (ten_loai_dich_vu) value ('Room');

create table kieu_thue(
	ma_kieu_thue int auto_increment primary key,
    ten_kieu_thue varchar(45)
);

	insert into kieu_thue (ten_kieu_thue) value ('Year');
	insert into kieu_thue (ten_kieu_thue) value ('Month');
	insert into kieu_thue (ten_kieu_thue) value ('Day');
	insert into kieu_thue (ten_kieu_thue) value ('Hour');

create table dich_vu(
	ma_dich_vu int auto_increment primary key,
    ten_dich_vu varchar (45) not null,
    dien_tich int ,
    chi_phi_thue double not null,
    so_nguoi_toi_da int,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    dich_vu_mien_phi_di_kem text,
    ma_kieu_thue int not null,
    ma_loai_dich_vu int  not null,
    foreign key (ma_kieu_thue) references kieu_thue (ma_kieu_thue),
    foreign key (ma_loai_dich_vu) references loai_dich_vu (ma_loai_dich_vu)
);

	insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) value ('Villa Beach Front',25000,'1000000',10,'vip','Có hồ bơi','500',4,null,3,1);
	insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) value ('House Princess 01',14000,'5000000',7,'vip','Có thêm bếp nướng',null,3,null,2,2);
	insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) value ('Room Twin 01',5000,'1000000',2,'normal','Có tivi',null,null,'1 Xe máy, 1 Xe Đạp',4,3);
	insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) value ('Villa No Beach Front',22000,'9000000',8,'normal','Có hồ bơi','300',3,null,3,1);
	insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) value ('House Princess 02',10000,'4000000',5,'normal','Có thêm bếp nướng',null,2,null,3,2);
	insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) value ('Room Twin 02',3000,'900000',2,'normal','Có tivi',null,null,'1 Xe máy',4,3);
    
create table dich_vu_di_kem(
	ma_dich_vu_di_kem int auto_increment primary key,
    ten_dich_vu_di_kem varchar(45) not null,
    gia double not null,
    don_vi varchar(45) not null,
    trang_thai varchar(45)
);

insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) value ('Karaoke','10000','giờ','tiện nghi, hiện đại');
insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) value ('Thuê xe máy','10000','chiếc','hỏng 1 chiếc xe');
insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) value ('Thuê xe đạp','20000','chiếc','tốt');
insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) value ('Buffet buổi sáng','15000','suất','đầy đủ đồ ăn, tráng miệng');
insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) value ('Buffet buổi trưa','90000','suât','đầy đủ đồ ăn, tráng miệng');
insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) value ('Buffet buổi tối','16000','suất','đầy đủ đồ ăn, tráng miệng');
    
