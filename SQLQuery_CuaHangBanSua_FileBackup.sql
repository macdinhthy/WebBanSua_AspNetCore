CREATE DATABASE CuaHangBanSua
GO
USE CuaHangBanSua
GO

CREATE TABLE RoleAccount
(
RoleID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
RoleName VARCHAR(12) NOT NULL,
Mota NVARCHAR(200) NOT NULL
)
GO

CREATE TABLE Account
(
AccountID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TaiKhoan VARCHAR(100) NOT NULL,
RoleID INT NOT NULL,
CreateDate DATE NOT NULL

FOREIGN KEY (RoleID) REFERENCES dbo.RoleAccount(RoleID)
)
GO

CREATE TABLE DanhMucSP
(
MaDM INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TenDM NVARCHAR(200) NOT NULL,
AnhDM NVARCHAR(MAX),
MoTaDM NVARCHAR(500),
TrangThai BIT
)
GO

CREATE TABLE SanPham
(
MaSP INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
MaDM INT,
TenSP NVARCHAR(200) NOT NULL,
AnhSP NVARCHAR(MAX) NOT NULL,
VideoSP NVARCHAR(MAX),
GiaSP INT NOT NULL,
TrangThai BIT NOT NULL,
SoLuong INT NOT NULL,
BestSeller BIT NOT NULL,
CreateDate DATE NOT NULL,
NgaySua DATE NOT NULL,
MotaSP NVARCHAR(MAX) NOT NULL

FOREIGN KEY (MaDM) REFERENCES DanhMucSP(MaDM)
)
GO


CREATE TABLE KhachHang
(
MaKH INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TenKH NVARCHAR(200) NOT NULL,
GioiTinh NVARCHAR(10) Not Null,
AvatarKH NVARCHAR(Max),
Diachi NVARCHAR(500),
Ngaysinh DATE NOT NULL,
Phone INT NOT NULL,
Email NVARCHAR(200) NOT NULL,
Password varchar(26) NOT NULL, 
CreateDate DATE NOT NULL

)
GO

CREATE TABLE DonHang
(
MaDH INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
MaKH INT NOT NULL,
NgayTao DATE NOT NULL,
TrangThaiHuyDon BIT NOT NULL,
ThanhToan BIT NOT NULL,
NgayThanhToan DATE NOT NULL,
Note NVARCHAR(MAX),
TongTien INT

FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH)
)
GO

CREATE TABLE ChiTietDonHang
(
MaCTDH INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
MaDH INT NOT NULL,
MaSP INT NOT NULL,
TongTien INT NOT NULL,
Ngaygiao INT NOT NULL,
SoLuong INT NOT NULL

FOREIGN KEY (MaDH) REFERENCES dbo.DonHang(MaDH),
FOREIGN KEY (MaSP) REFERENCES dbo.SanPham(MaSP)
)
GO

CREATE TABLE QuanLyShipper
(
MaShipper INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
MaDH INT NOT NULL,
TenShipper NVARCHAR(100) NOT NULL,
NgayLayHang DATE NOT NULL,
Phone INT NOT NULL,
TenCongty NVARCHAR(100) NOT NULL

FOREIGN KEY (MaDH) REFERENCES dbo.DonHang(MaDH)
)
GO

CREATE TABLE TrangThaiDH
(
MaTTDH INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
MaDH INT NOT NULL,
TrangThai NVARCHAR(200) NOT NULL,
Mota NVARCHAR(Max)

FOREIGN KEY (MaDH) REFERENCES dbo.DonHang(MaDH)
)
GO

CREATE TABLE TinTuc
(
MaTT INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TenTT NVARCHAR(200) NOT NULL,
AnhTT NVARCHAR(MAX) NOT NULL,
Motangan NVARCHAR(200) NOT NULL,
Motadai NVARCHAR(MAX) NOT NULL,
Tacgia NVARCHAR(100) NOT NULL,
CreateDate DATE NOT NULL,
LoaiTin bit NOT NULL
)
GO

SET IDENTITY_INSERT [dbo].[DanhMucSP] ON 

INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM], [AnhDM], [MoTaDM], [TrangThai]) VALUES (1, N'Sữa Chua', N'https://www.thmilk.vn/wp-content/uploads/2019/11/ic-suachua.png', NULL, 1)
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM], [AnhDM], [MoTaDM], [TrangThai]) VALUES (2, N'Sữa Tươi Tuyệt Trùng', N'https://www.thmilk.vn/wp-content/uploads/2019/11/ic-suatietrung.png', NULL, 1)
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM], [AnhDM], [MoTaDM], [TrangThai]) VALUES (3, N'Nước Giải Khát', N'https://www.thmilk.vn/wp-content/uploads/2020/09/icon-Beverage.png', NULL, 1)
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM], [AnhDM], [MoTaDM], [TrangThai]) VALUES (4, N'Sữa Hạt', N'https://www.thmilk.vn/wp-content/uploads/2019/11/ic-suahat.png', NULL, 1)
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM], [AnhDM], [MoTaDM], [TrangThai]) VALUES (5, N'Kem', N'https://www.thmilk.vn/wp-content/uploads/2019/11/ic-kem.png', NULL, 1)
INSERT [dbo].[DanhMucSP] ([MaDM], [TenDM], [AnhDM], [MoTaDM], [TrangThai]) VALUES (6, N'Bơ, Phomat', N'https://www.thmilk.vn/wp-content/uploads/2019/11/ic-phomat.png', NULL, 1)
SET IDENTITY_INSERT [dbo].[DanhMucSP] OFF
GO

SET IDENTITY_INSERT [dbo].[RoleAccount] ON 

INSERT [dbo].[RoleAccount] ([RoleID], [RoleName], [Mota]) VALUES (1, N'Admin', N'Quản Lý')
INSERT [dbo].[RoleAccount] ([RoleID], [RoleName], [Mota]) VALUES (2, N'Staff', N'Nhân Viên')
INSERT [dbo].[RoleAccount] ([RoleID], [RoleName], [Mota]) VALUES (3, N'User', N'Người dùng')
SET IDENTITY_INSERT [dbo].[RoleAccount] OFF
GO