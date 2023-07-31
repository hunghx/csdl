CREATE DATABASE quanlybanhang;
USE quanlybanhang;

CREATE TABLE nhanvien (
  manv VARCHAR(4) PRIMARY KEY,
  hoten VARCHAR(30),
  gioitinh BIT,
  diachi VARCHAR(50),
  ngaysinh DATE,
  dienthoai VARCHAR(15),
  email VARCHAR(50),
  noisinh VARCHAR(20),
  ngayvaolam DATETIME,
  manql VARCHAR(4),
  FOREIGN KEY (manql) REFERENCES nhanvien(manv)
);

CREATE TABLE khachhang (
  makh VARCHAR(4) PRIMARY KEY,
  tenkh VARCHAR(30),
  diachi VARCHAR(50),
  ngaysinh DATE,
  sodt VARCHAR(15)
);

CREATE TABLE nhacungcap (
  mancc VARCHAR(5) PRIMARY KEY,
  tenncc VARCHAR(50),
  diachi VARCHAR(50),
  dienthoai VARCHAR(15),
  email VARCHAR(50),
  website VARCHAR(30)
);

CREATE TABLE loaisp (
  maloaisp VARCHAR(4) PRIMARY KEY,
  tenloaisp VARCHAR(30),
  ghichu VARCHAR(100)
);

CREATE TABLE sanpham (
  masp VARCHAR(4) PRIMARY KEY,
  maloaisp VARCHAR(4),
  FOREIGN KEY (maloaisp) REFERENCES loaisp(maloaisp),
  tensp VARCHAR(50),
  donvitinh VARCHAR(10),
  ghichu VARCHAR(100)
);

CREATE TABLE phieunhap (
  sopn VARCHAR(5) PRIMARY KEY,
  manv VARCHAR(4),
  FOREIGN KEY (manv) REFERENCES nhanvien(manv),
  mancc VARCHAR(5),
  FOREIGN KEY (mancc) REFERENCES nhacungcap(mancc),
  ngaynhap DATETIME,
  ghichu VARCHAR(100)
);

CREATE TABLE ctphieunhap (
  id INT PRIMARY KEY AUTO_INCREMENT,
  masp VARCHAR(4),
  FOREIGN KEY (masp) REFERENCES sanpham(masp),
  sopn VARCHAR(5),
  FOREIGN KEY (sopn) REFERENCES phieunhap(sopn),
  soluong INT DEFAULT 0,
  gianhap DOUBLE CHECK (gianhap >= 0)
);

CREATE TABLE phieuxuat (
  sopx varchar(5) primary key,
  manv varchar(4),
  foreign key  (manv) references nhanvien(manv),
  makh VARCHAR(4),
  foreign key  (makh) references khachhang(makh),
  ngayban datetime,
  ghichu varchar(255),
  ngayhientai datetime  default now(),
  check (ngayban >= ngayhientai)
);

CREATE TABLE ctphieuxuat (
  id INT PRIMARY KEY AUTO_INCREMENT,
  sopx VARCHAR(5),
  FOREIGN KEY (sopx) REFERENCES phieuxuat(sopx),
  masp VARCHAR(4),
  FOREIGN KEY (masp) REFERENCES sanpham(masp),
  soluong INT CHECK (soluong > 0),
  giaban DOUBLE CHECK (giaban > 0)
);

insert into NhanVien values ("NV04","Nguyen Thi D",0,"My Dinh,Ha Noi","19960427","0967585702","ntd@gmail.com","Ha Noi","20210927",NULL);
insert into NhaCungCap (mancc,tenncc,diachi,dienthoai,email) values 
("NCC01","Nha Cung Cap 1","Ha Noi","123456789","ncc1@gmail.com"),
("NCC02","Nha Cung Cap 2","Ho Chi Minh","123456789","ncc2@gmail.com"),
("NCC03","Nha Cung Cap 3","Da Nang","123456789","ncc3@gmail.com");
insert into LoaiSP values 
  ('LSP01','Điện thoại', 'Loại sản phẩm điện thoại di động'),
  ('LSP02','Laptop', 'Loại sản phẩm máy tính xách tay'),
  ('LSP03','Máy tính bảng', 'Loại sản phẩm máy tính bảng');
 INSERT INTO SanPham VALUES
  ('SP01','LSP01', 'IPHONE 15', 'Cái', NULL),
  ('SP02','LSP01', 'Samsung s9', 'Cái', 'Điện thoại mới nhất'),
  ('SP03','LSP02', 'Laptop Acer Nitro 6', 'Cái', NULL),
  ('SP04','LSP02', 'Laptop Alienware MR15', 'Cái', 'Laptop cao cấp'),
  ('SP05','LSP03', 'Apple Pro 1080', 'Cái', 'Máy tính bảng giá rẻ');
  insert into PhieuNhap values
("PN01","NV01","NCC01","20230715","Phieu Nhap 01"),
("PN02","NV02","NCC01","20230715","Phieu Nhap 02"),
("PN03","NV02","NCC01","20230715","Phieu Nhap 03");
insert into CTPhieuNhap values
(1,'SP01','PN01',10,15000000),
(2,'SP02','PN02',10,8000000),
(3,'SP03','PN03',5,25000000),
(4,'SP03','PN01',5,25000000),
(5,'SP03','PN02',5,25000000);
insert into PhieuXuat values
('PX01','NV01','KH01',now(),'Phieu Xuat 01',now()),
('PX02','NV02','KH02',now(),'Phieu Xuat 02',now()),
('PX03','NV03','KH03','20230725','Phieu Xuat 03',now());
insert into CTPhieuXuat values
(4,'PX01','SP04',2,20000000),
(5,'PX02','SP05',3,10000000),
(6,'PX01','SP02',2,20000000),
(7,'PX02','SP01',3,10000000),
(1,'PX01','SP01',2,20000000),
(2,'PX02','SP02',3,10000000),
(3,'PX03','SP03',1,30000000);


-- câu 4 Dùng lệnh UPDATE cập nhật dữ liệu các bảng Trần Hữu Huy.
-- Cập nhật lại số điện thoại mới cho khách hàng mã KH10. (Tùy chọn các thông tin liên quan)
update khachhang
set sodt = "099999999"
where makh = "kh01";
--  Cập nhật lại địa chỉ mới của nhân viên mã NV05 (Tùy chọn các thông tin liên quan)
update nhanvien
set diachi = "hà nam"
where manv ="nv01";

-- câu 6
  -- 1
  select manv,hoten,gioitinh,diachi,ngaysinh,dienthoai,timestampdiff(year,ngaysinh,now())
  from nhanvien order by timestampdiff(year,ngaysinh,now());
  -- 2
  select pn.sopn,pn.manv,pn.mancc,pn.ngaynhap,pn.ghichu from phieunhap pn
  join nhanvien nv on nv.manv = pn.manv
  join nhacungcap ncc on ncc.mancc = pn.mancc	;
  
	  select pn.sopn, nv.manv, ncc.tenncc, pn.ngaynhap, pn.ghichu 
			from phieunhap pn 
			join  nhanvien nv on nv.manv = pn.manv 	
			join nhacungcap ncc on ncc.mancc = pn.mancc
			where pn.ngaynhap between '2018-06-01' and '2018-06-30' ;
	
    -- Nguyễn Quang Huy ý 3-4
-- 3. Liệt kê tất cả sản phẩm có đơn vị tính là chai, gồm tất cả thông tin về sản 
-- phẩm.
select * from sanpham where donvitinh = "chai";
-- 4. Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin: số phiếu 
-- nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá 
-- nhập, thành tiền.sanpham
select pn.sopn,sp.masp,sp.donvitinh,sp.tensp,lsp.tenloaisp,ctpn.soluong,ctpn.gianhap,(ctpn.soluong*ctpn.gianhap),  pn.ngaynhap from phieunhap pn 
join ctphieunhap ctpn on pn.sopn = ctpn.sopn 
join sanpham sp on ctpn.masp = sp.masp 
join loaisp lsp on sp.maloaisp = lsp.maloaisp
where month(pn.ngaynhap) = month(now()) and year(pn.ngaynhap) = year(now());

-- Nguyễn Tuấn Hưng ý 5-6
-- Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm 
-- thông tin: mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại, 
-- email, số phiếu nhập, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng

select ncc.mancc, ncc.tenncc, ncc.diachi, ncc.dienthoai, ncc.email, pn.sopn, pn.ngaynhap
from nhacungcap ncc
join phieunhap pn on pn.mancc = ncc.mancc
where month(pn.ngaynhap) = month(now()) and year(pn.ngaynhap) = year(now())
order by day (pn.ngaynhap);

-- 6. Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng đầu năm 2018 gồm thông tin: 
-- số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, 
-- đơn vị tính, số lượng, giá bán, doanh thu

select px.sopx, nv.hoten, px.ngayban, sp.masp, sp.tensp, sp.donvitinh, ctpx.soluong, ctpx.giaban, (ctpx.soluong*ctpx.giaban)
from phieuxuat px
join nhanvien nv on px.manv = nv.manv
join ctphieuxuat ctpx on ctpx.sopx = px.sopx 
join sanpham sp on ctpx.masp = sp.masp
-- where px.ngayban between '2023-01-01' and '2023-07-30'
 where month(px.ngayban) <= 7 and year(px.ngayban) = 2018;
 
 
 -- ý 7-8
 -- 7
select * from khachhang 
where month(ngaysinh) = month(now());
-- 8  Liệt kê các hóa đơn bán hàng từ ngày 15/04/2018 đến 15/05/2018 gồm các 
-- thông  tin: số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên 
-- sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu
select px.sopx, nv.hoten, px.ngayban, sp.masp, sp.tensp, sp.donvitinh, ctpx.soluong, ctpx.giaban,
sum(ctpx.soluong * ctpx.giaban) as doanhthu 
from phieuxuat px
join nhanvien nv on px.manv = nv.manv
join ctphieuxuat ctpx on ctpx.sopx = px.sopx 
join sanpham sp on ctpx.masp = sp.masp 
-- where px.ngayban between '2018-04-15' and '2018-05-15'
group by nv.manv, sopx;

-- ý  9-10: 
-- Liệt kê các hóa đơn mua hàng theo từng khách hàng, gồm các thông tin: số 
-- phiếu xuất, ngày bán, mã khách hàng, tên khách hàng, trị giá.
select px.sopx, px.ngayban, px.makh, sum(ctpx.soluong * ctpx.giaban) as Trịgiá
from phieuxuat px
join khachhang kh on px.makh = kh.makh
join ctphieuxuat ctpx on ctpx.sopx = px.sopx
join sanpham sp on ctpx.masp = sp.masp
group by kh.makh, sopx;
 -- Cho biết tổng số Sam Sung S9 đã bán trong 6 tháng đầu năm 
-- 2018. Thông tin hiển thị: tổng số lượng.
select sum(ctpx.soluong) 
	from ctphieuxuat ctpx 
    join sanpham sp on sp.masp = ctpx.masp 
    join phieuxuat px on ctpx.sopx = px.sopx 
    where sp.tensp = "Samsung s9" and px.ngayban between '2023-6-1' and '2023-12-30'