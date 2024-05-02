create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;



create table if not exists STUDENT
(
    studentId   varchar(4) primary key not null,
    studentName varchar(100)           not null,
    birthday    date                   not null,
    gender      bit(1)                 not null,
    address     text                   not null,
    phoneNumber varchar(45) unique

);



create table if not exists SUBJECT
(
    subjectId   varchar(4) primary key not null,
    subjectName varchar(45)            not null,
    priority    int(11)                not null
);


create table if not exists MARK
(
    subjectId varchar(4) not null,
    studentId varchar(4) not null,
    point     float      not null,
    foreign key (subjectId) references SUBJECT (subjectId),
    foreign key (studentId) references STUDENT (studentId)
);

insert into STUDENT (studentId, studentName, birthday, gender, address, phoneNumber)
values ('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
       ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
       ('S003', 'Tran Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
       ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
       ('S005', 'Pham Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
       ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Dinh', '982654268'),
       ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Tho', '982364753'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
       ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274673'),
       ('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');

insert into SUBJECT (subjectId, subjectName, priority)
values ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hóa Học', 1),
       ('MH04', 'Ngữ Văn ', 1),
       ('MH05', 'Tiếng Anh', 2);


insert into MARK (subjectId, studentId, point)
values ('MH01', 'S001', 8.5),
       ('MH02', 'S001', 7),
       ('MH03', 'S001', 9),
       ('MH04', 'S001', 9),
       ('MH05', 'S001', 5),
       ('MH01', 'S002', 9),
       ('MH02', 'S002', 8),
       ('MH03', 'S002', 6.5),
       ('MH04', 'S002', 8),
       ('MH05', 'S002', 6),
       ('MH01', 'S003', 7.5),
       ('MH02', 'S003', 6.5),
       ('MH03', 'S003', 8),
       ('MH04', 'S003', 7),
       ('MH05', 'S003', 7),
       ('MH01', 'S004', 6),
       ('MH02', 'S004', 7),
       ('MH03', 'S004', 5),
       ('MH04', 'S004', 6.5),
       ('MH05', 'S004', 8),
       ('MH01', 'S005', 5.5),
       ('MH02', 'S005', 8),
       ('MH03', 'S005', 7.5),
       ('MH04', 'S005', 8.5),
       ('MH05', 'S005', 9),
       ('MH01', 'S006', 8),
       ('MH02', 'S006', 10),
       ('MH03', 'S006', 9),
       ('MH04', 'S006', 7.5),
       ('MH05', 'S006', 6.5),
       ('MH01', 'S007', 9.5),
       ('MH02', 'S007', 9),
       ('MH03', 'S007', 6),
       ('MH04', 'S007', 9),
       ('MH05', 'S007', 4),
       ('MH01', 'S008', 10),
       ('MH02', 'S008', 8.5),
       ('MH03', 'S008', 8.5),
       ('MH04', 'S008', 9.5),
       ('MH05', 'S008', 9),
       ('MH01', 'S009', 7.5),
       ('MH02', 'S009', 7),
       ('MH03', 'S009', 9),
       ('MH04', 'S009', 5),
       ('MH05', 'S009', 10),
       ('MH01', 'S010', 6.5),
       ('MH02', 'S010', 8),
       ('MH03', 'S010', 5.5),
       ('MH04', 'S010', 4),
       ('MH05', 'S010', 7);

#2. Cập nhật dữ liệu [10 điểm]:
#Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
update STUDENT
set studentName = 'Đỗ Đức Mạnh'
where studentId = 'S004';

#Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
update SUBJECT
set subjectName = 'Ngoại Ngữ',
    priority    = 1
where subjectId = 'MH05';

# Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,
#MH05 : 9)
update MARK
set point = case
                when subjectId = 'MH01' then 8.5
                when subjectId = 'MH02' then 7
                when subjectId = 'MH03' then 5.5
                when subjectId = 'MH04' then 6
                when subjectId = 'MH05' then 9
    end
where studentId = 'S009'
  and subjectId in ('MH01', 'MH02', 'MH03', 'MH04', 'MH05');

# Xoá Dữ liệu
#Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh
#này ở bảng STUDENT.

delete
from MARK
where studentId = 'S010';

delete
from STUDENT
where studentId = 'S010';

# 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]

select *
from STUDENT;

# 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]

select subjectId, subjectName
from SUBJECT
where priority = 1;

# 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
# năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]

select studentId,
       studentName,
       YEAR(CURDATE()) - YEAR(birthday) age,
       IF(gender = 1, 'Nam', 'Nữ')      gioitinh,
       address
from STUDENT;

# 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
# Toán và sắp xếp theo điểm giảm dần. [4 điểm]
select s.studentName,
       sj.subjectName,
       m.point
from STUDENT s
         join
     MARK m on s.studentId = m.studentId
         join
     SUBJECT sj on m.subjectId = sj.subjectId
where sj.subjectId = 'MH01'
order by m.point desc;

# 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
select IF(gender = 1, 'Nam', 'Nữ') gioitinh,
       COUNT(*)                    Tongso
from STUDENT
group by gender;

# 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
# để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
select STUDENT.studentId,
       STUDENT.studentName,
       SUM(MARK.point) tongdiem,
       AVG(MARK.point) trungbinhmon
from STUDENT
         join
     MARK on STUDENT.studentId = MARK.studentId
group by STUDENT.studentId, STUDENT.studentName;

# 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
# sinh, giới tính , quê quán . [3 điểm]
create view STUDENT_VIEW as
select studentId,
       studentName,
       IF(gender = 1, 'Nam', 'Nữ') gioitinh,
       address
from STUDENT;

# 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
# điểm trung bình các môn học . [3 điểm]
create view AVERAGE_MARK_VIEW as
select STUDENT.studentId,
       STUDENT.studentName,
       AVG(MARK.point) Diemtrungbinhmon
from STUDENT
         join
     MARK on STUDENT.studentId = MARK.studentId
group by STUDENT.studentId, STUDENT.studentName;

# 3. Đánh index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create index idex_phoneNumber on STUDENT (phoneNumber);

# - Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
# thông tin học sinh đó. [3 điểm]

delimiter //
create procedure PROC_INSERTSTUDENT(
    studentId_in varchar(4),
    studentName_in varchar(100),
    birthday_in date,
    gender_in bit(1),
    address_in text,
    phoneNumber_in varchar(45)
)
begin
    insert into STUDENT (studentId, studentName, birthday, gender, address, phoneNumber)
    values (studentId_in, studentName_in, birthday_in, gender_in, address_in, phoneNumber_in);
end //
delimiter ;


# - Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
# [3 điểm]

delimiter //
create procedure PROC_UPDATESUBJECT(
    subjectId_in varchar(4),
    newSubjectName_in varchar(45)
)
begin
    update SUBJECT
    set subjectName = newSubjectName_in
    where subjectId = subjectId_in;
end //
delimiter ;

#call PROC_UPDATESUBJECT('MH01','Mon gi day');

# - Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
# sinh. [3 điểm]
delimiter //
create procedure PROC_DELETEMARK(
    in studentId_in varchar(4)
)
begin
    delete
    from MARK
    where studentId = studentId_in;
end //
delimiter ;

#call PROC_DELETEMARK('S001');