create database IF NOT EXISTS baitap2;
use baitap2;
create table IF NOT EXISTS khachhang(
MaKH varchar(4) not null,
TenKH varchar(30) not null,
DiaChi varchar(50),
NgaySinh date,
SoDT varchar(15), 
primary key(MaKH)
);
create table IF NOT EXISTS NhanVien (
MaNV varchar(4) not null,
HoTen varchar(30) not null,
GioiTinh bit default 1 not null,
DiaChi varchar (50) not null,
NgaySinh datetime not null,
DienThoai varchar (15),
Email varchar(255),
NoiSinh varchar(20) not null,
NgayVaoLam date,
MaNQL varchar(4),
primary key(MaNV)
);
create table IF NOT EXISTS NhaCungCap(
MaNCC varchar(5) primary key,
TenNCC varchar(50),
DiaChi varchar(50),
DienThoai varchar(15),
Email varchar(30),
website varchar(30)
);
create table IF NOT EXISTS LoaiSanPham (
MaLoaiSP varchar(4) primary key,
TenLoaiSP varchar(50),
GhiChu varchar(100)
);
create table IF NOT EXISTS SanPham(
MaSP varchar(4) primary key,
MaloaiSP varchar(4),
TenSP varchar(30),
DonViTinh varchar(100),
GhiChu varchar(100)
);
create table IF NOT EXISTS PhieuNhap(
SoPN varchar(4) primary key,
MaNV varchar(4),
MaNCC varchar(5),
NgayNhap date,
GhiChu varchar(100)
);
create table IF NOT EXISTS CTPHIEUNHAP(
MaSP varchar(4),
SoPN varchar(4),
SoLuong smallint,
GiaNhap real,
primary key(MaSP,SoPN)
);
create table IF NOT EXISTS PHIEUXUAT(
SoPX varchar(4) primary key,
MaNV varchar(5),
MaKH varchar(4),
NgayBan date,
GhiChu text
);
create table IF NOT EXISTS CTPHIEUXUAT(
SoPX varchar(4),
MaSP varchar(4),
SoLuong smallint,
GiaBan real,
primary key (SoPX, MaSP)
);
-- bai 2 
alter table PhieuNhap add foreign key (MaNCC) references NhaCungCap(MaNCC);
alter table PhieuNhap add foreign key (MaNV) references nhanvien(MaNV);
alter table CTPHIEUNHAP add foreign key (MaSP) references SanPham(MaSP);
alter table CTPHIEUNHAP add foreign key (SoPN) references PhieuNhap(SoPN);
alter table SanPham add foreign key(MaLoaiSP) references LoaiSanPham(MaLoaiSP);
alter table PHIEUXUAT add foreign key (MaNV) references nhanvien(MaNV);
alter table PHIEUXUAT add foreign key (MaKH) references khachhang(MaKH);
alter table CTPHIEUXUAT add foreign key(SoPX) references PHIEUXUAT(SoPX);
alter table CTPHIEUXUAT add foreign key (MaSP) references SanPham(MaSP);
insert into khachhang (makh,tenkh,soDt) value
('KH01','Nguyễn Văn A','0984727353'),
('KH02','Nguyễn Văn B','0984227353'),
('KH03','Nguyễn Văn C','0984527353'),
('KH04','Nguyễn Văn D','0984627353'),
('KH05','Nguyễn Văn E','0984827353');
-- thêm dữ liệu bảng nhân viên
insert into nhanvien value
('N001','Hồ Xuân Hùng',1,'Nghệ An','1999-06-18','0974364738','hung@gmail.com','Nghệ An',null,null),
('N002','Trịnh công Phúc',1,'Hồ Chí Minh','2000-02-18','0974364928','phuc@gmail.com','Hồ Chí Minh',null,'N001'),
('N003','Cao Cường',1,'Hà Nam','2001-06-20','0974937738','cuong@gmail.com','Hà Nam',null,'N002'),
('N004','Lê Đức Phát',1,'Hồ Chí Minh','2004-05-30','097439473','phat@gmail.com','Hồ CHí Minh',null,'N001'),
('N005','Nguyễn Thị Minh Châu',1,'Hồ Chí Minh','1998-1-18','097438756','Chau@gmail.com','Hồ chí Minh',null,'N001');
insert into nhacungcap value
('NCC01','TenNCC01','HCM','0987654321','tenncc@gmail.com',null),
('NCC02','TenNCC02','HN','0986654321','tenncc1@gmail.com',null),
('NCC03','TenNCC03','HCM','0957654321','tenncc2@gmail.com',null),
('NCC04','TenNCC04','HCM','0947654321','tenncc3@gmail.com',null),
('NCC05','TenNCC05','HCM','0937654321','tenncc4@gmail.com',null);
insert into loaisanpham value 
('ML01','Ma van loai','abc'),
('ML02','Ma van loai2','abc'),
('ML03','Ma van loai3','abc'),
('ML04','Ma van loai4','abc'),
('ML05','Ma van loai5','abc');
insert	into sanpham value
('SP01', 'ML01','San van pham1',null,'bbbbb'),
('SP02', 'ML02','San van pham2',null,'bbbbb'),
('SP03', 'ML03','San van pham3',null,'bbbbb'),
('SP04', 'ML04','San van pham4',null,'bbbbb'),
('SP05', 'ML05','San van pham5',null,'bbbbb');
-- bai 3
insert into phieunhap values('PN01','NV01','NCC01','1999-03-01 23:59:59','ttttt') ,
('PN02','NV02','NCC01','1999-03-01 23:59:59','vvvvv');
insert into phieuxuat values('PX01','NV01','KH01','1999-03-01 23:59:59','ccccc'),
('PX02','NV02','KH01','1999-03-01 23:59:59','bbbb');
insert into nhanvien value
('N006','Xuan Dong',1,'Nam Dinh','1994-10-09','097658538','dong@gmail.com','Nghệ An',null,null);
-- bai 4
update khachhang set sodt = '0987654321' where makh like 'kh03';
update nhanvien  set diachi = 'Hà nội' where manv like 'N001';  
-- bai 5
delete from  nhanvien where manv like 'N006';
delete from sanpham where masp like 'SP04'