create database ss3_student_manager;

create table class
(
    class_id   int         not null auto_increment primary key,
    class_name varchar(60) not null,
    start_date datetime    not null,
    Status    bit
);

insert into class
values (1, 'A1', '2008-12-20', 1);
insert into class
values (2, 'A2', '2008-12-22', 1);
insert into class
values (3, 'B3', current_date, 0);

create table student
(
    student_id   int         not null auto_increment primary key,
    student_name varchar(30) not null,
    address     varchar(50),
    phone       varchar(20),
    Status      bit,
    class_id     int         not null,
    foreign key (class_id) references class (class_id)
);

insert into student (student_name, address, phone, status, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (student_name, address, status, class_id)
values ('Hoa', 'Hai phong', 1, 1);
insert into student (student_name, address, phone, status, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);

create table subject
(
    sub_id   int         not null auto_increment primary key,
    sub_name varchar(30) not null,
    credit  tinyint     not null default 1 check ( credit >= 1 ),
    status  bit                  default 1
);

insert into subject
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

create table mark
(
    mark_id    int not null auto_increment primary key,
    sub_id     int not null,
    student_id int not null,
    mark      float   default 0 check ( mark between 0 and 100),
    exam_times tinyint default 1,
    unique (sub_id, student_id),
    foreign key (sub_id) references subject (sub_id),
    foreign key (student_id) references student (student_id)
);

insert into mark(sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’      
SELECT 
    *
FROM
    student where student_name like 'h%';
    
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit between 3 and 5 ;

-- Thay đổi mã lớp(classID) của sinh viên có tên ‘hung’ là 2.
SET sql_safe_update = 0;
update student set class_id = 2 where student_name = 'hung';
select * from student; 

-- Hiển thị các thông tin: studentName, SubName, Mark. dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT 
    student.student_name, mark.mark, subject.sub_name
FROM
    mark
        INNER JOIN
    student ON mark.student_id = student.student_id
        JOIN
    subject ON mark.sub_id = subject.sub_id
ORDER BY mark.mark DESC , student.student_name ASC;

