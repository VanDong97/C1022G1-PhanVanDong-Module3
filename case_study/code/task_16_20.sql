use case_study;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

SELECT 
    *
FROM
    nhan_vien;
delete from nhan_vien nv
where nv.ma_nhan_vien not in (
	select ma_nhan_vien from hop_dong hd 
    where year(hd.ngay_lam_hop_dong) between 2019 and 2021
);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

create view view_tong_tien as
select kh.ma_khach_hang, lk.ten_loai_khach,
sum(ifnull(dv.chi_phi_thue,0) + ifnull(hdct.so_luong,0) * ifnull(dvdk.gia,0)) tong_tien
from khach_hang kh 
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Platinium'
and year(ngay_lam_hop_dong) = 2021
group by lk.ma_loai_khach, kh.ma_khach_hang;

select * from view_tong_tien;

update khach_hang
set ma_khach_hang = 1
where ma_khach_hang = (select view_tong_tien.ma_khach_hang
from view_tong_tien
where view_tong_tien.tong_tien > '1000000'
and ten_khach_hang = 'Platinium');

select kh.*, lk.* from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

set foreign_key_checks = 0 ;
SELECT 
    *
FROM
    khach_hang;
delete from khach_hang kh
where kh.ma_khach_hang in (
	select hd.ma_khach_hang from hop_dong hd
    where year(hd.ngay_lam_hop_dong) < 2021
);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem dvdk
set dvdk.gia = dvdk.gia * 2
where dvdk.ma_dich_vu_di_kem = (
select hdct.ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where hdct.so_luong > 10 and year(hd.ngay_lam_hop_dong) = 2020
);
select * from dich_vu_di_kem;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email,
-- so_dien_thoai, ngay_sinh, dia_chi.

select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from nhan_vien
union
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from khach_hang;