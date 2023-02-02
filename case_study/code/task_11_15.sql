use case_study;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi 
-- những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT 
    dvdk.ma_dich_vu_di_kem,
    lk.ten_loai_khach,
    dvdk.ten_dich_vu_di_kem,
    kh.dia_chi
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
        AND kh.dia_chi LIKE '% Vinh'
        OR kh.dia_chi LIKE '% Quảng Ngãi';
-- 12: so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt 
-- vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select 
  hd.ma_hop_dong, 
  nv.ho_ten, 
  kh.ho_ten, 
  kh.so_dien_thoai, 
  dv.ten_dich_vu, 
  sum(
    ifnull(hdct.so_luong, 0)
  ) as so_luong_dich_vu_di_kem, 
  hd.tien_dat_coc 
from 
  hop_dong hd 
  join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien 
  join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
  join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
  left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
where 
  hd.ma_hop_dong in (
    select 
      hd.ma_hop_dong 
    from 
      hop_dong 
    where 
      (
        month(hd.ngay_lam_hop_dong) between 10 
        and 12
      ) 
      and year(hd.ngay_lam_hop_dong)= 2020
  ) 
  and hd.ma_hop_dong not in (
    select 
      hd.ma_hop_dong 
    from 
      hop_dong 
    where 
      (
        month(hd.ngay_lam_hop_dong) between 1 
        and 6
      ) 
      and year(hd.ngay_lam_hop_dong)= 2021
  ) 
group by 
  hd.ma_hop_dong;
  
  -- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
  -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
  
  select dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem, sum(ifnull(hdct.so_luong,0)) as số_lần_sử_dụng_nhiều_nhất
  from dich_vu_di_kem dvdk
  join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
  group by hdct.ma_dich_vu_di_kem
  having 
  sum(
    ifnull(hdct.so_luong, 0)
  ) >= (
    select 
      max(hop_dong_chi_tiet.so_luong) 
    from 
      hop_dong_chi_tiet
  );
  
  -- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
  -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
  
  set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
  select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as số_lần_sử_dụng
  from hop_dong hd
  join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
  join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
  join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
  join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
  group by  dvdk.ten_dich_vu_di_kem
  having số_lần_sử_dụng = 1
  order by hd.ma_hop_dong asc;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, 
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
group by nv.ma_nhan_vien
having count(hd.ma_hop_dong) < 4;
