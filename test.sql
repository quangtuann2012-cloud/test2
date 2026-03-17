CREATE DATABASE QL_NHA_THUE
USE QL_NHA_THUE


CREATE TABLE KHACH (
    MaK CHAR(5) PRIMARY KEY,
    TenK NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    SoDT VARCHAR(15)
)

CREATE TABLE NHA (
    MaN CHAR(5) PRIMARY KEY,
    TenChuNha NVARCHAR(50),
    GiaThue INT,
    DiaChiNha NVARCHAR(100)
)

CREATE TABLE HOPDONG (
    SoHD CHAR(5) PRIMARY KEY,
    MaN CHAR(5),
    MaK CHAR(5),
    NgayBD DATE,
    NgayKT DATE,
    CONSTRAINT FK_HD_NHA FOREIGN KEY (MaN) REFERENCES NHA(MaN),
    CONSTRAINT FK_HD_KHACH FOREIGN KEY (MaK) REFERENCES KHACH(MaK)
)

INSERT INTO KHACH VALUES
('K01', N'Phạm Nhật Vượng', N'Hà Tĩnh', '0912345678'),
('K02', N'Tô Lâm', N'Hưng Yên', '0987654321'),
('K03', N'Lương Cường', N'Phú Thọ', '0909123456');
INSERT INTO NHA VALUES
('N101', N'Quang', 250000, N'Hà Tĩnh'),
('N105', N'Thắng', 350000, N'Hưng Yên'),
('N110', N'Việt', 450000, N'Phú Thọ');

INSERT INTO HOPDONG VALUES
('HD01', 'N105', 'K01', '2025-01-01', '2025-06-01'),
('HD02', 'N101', 'K02', '2025-02-01', '2025-08-01');

ALTER TABLE KHACH
ADD CONSTRAINT UQ_Ten_DiaChi UNIQUE (TenK, DiaChi);

ALTER TABLE HOPDONG
ADD CONSTRAINT CK_Ngay
CHECK (NgayBD < NgayKT);

SELECT K.TenK, K.DiaChi, K.SoDT, N.GiaThue, H.NgayBD, H.NgayKT
FROM KHACH K
JOIN HOPDONG H ON K.MaK = H.MaK
JOIN NHA N ON H.MaN = N.MaN
WHERE H.MaN = 'N105';

SELECT *
FROM NHA
WHERE MaN NOT IN (
    SELECT MaN FROM HOPDONG
)

SELECT *
FROM NHA
WHERE GiaThue > 300000
  AND TenChuNha LIKE N'T%';


SELECT 
    H.SoHD,
    K.MaK,
    K.TenK,
    N.TenChuNha,
    N.GiaThue,
    H.NgayBD,
    H.NgayKT,
    DATEDIFF(DAY, H.NgayBD, H.NgayKT) AS Songaythue
FROM HOPDONG H
JOIN KHACH K ON H.MaK = K.MaK
JOIN NHA N ON H.MaN = N.MaN;


create trigger trg_check_MaN
on NHA
for insert
as
begin
	if exists(
		select *
		from inserted
		where man not like 'N[0-9][0-9][0-9]'
	)
	begin
		raiserror (N'Mã nhà phải có dạng Nxxx',16,1)
		rollback transaction; 
	end
end
insert into NHA 
values('N104','Huang',30000,'')
insert into NHA 
values('M103','Huang',30000,'')
select *
from NHA


