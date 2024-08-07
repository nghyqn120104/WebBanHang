create database WebBanHang
use WebBanHang
drop database WebBanHang

create table tblDangKyTaiKhoan (
	sTenDangNhap nvarchar(50) not null,
	sEmail nvarchar(50) not null,
	sPhone nvarchar(20) not null,
	sPassword nvarchar(20) not null,
	sAddress nvarchar(50) not null
)
drop table tblDangKyTaiKhoan
delete from tblDangKyTaiKhoan

create proc TaoTaiKhoan
@TenDangNhap nvarchar(50),@Email nvarchar(50),@Phone nvarchar(20),@PassWord nvarchar(20), @Address nvarchar(50)
as
begin
	insert into tblDangKyTaiKhoan values(@TenDangNhap,@Email,@Phone,@PassWord,@Address)
end


create table LapTop (
	sIDLapTop int primary key,
	sName nvarchar(100),
	sPictureSource nvarchar(max),
	sWarranty nvarchar(100), ---bảo hành---
	iOldPrice bigint, --giá cũ--
	iNewPrice bigint, --giá mới--
	sBoostRam nvarchar(100), --level ram--
	sCpu nvarchar(100), --cpu--
	sRam nvarchar(20), --ram--
	sBattery nvarchar(20), --pin--
	sGraphicCard nvarchar(20), --đồ họa--
	sWeight nvarchar(20), --cân nặng--
	sStorage nvarchar(20), --bộ nhớ--
	iQuantity int,  --số lượng --
	sDescribe nvarchar(1000)
)

drop table LapTop
select * from LapTop
delete from LapTop

insert into LapTop values(1,'Laptop gaming ASUS TUF Gaming F15 FX506HFHN014W','../Assets/img/laptopgaming/Laptop-Gaming-Asus-TUF.jpg'
								,N'Bảo hành 24 tháng',21990000,15990000,N'Nâng Ram lên 16GB miễn phí','i5 11400H','DDR4 8GB'
								,'48WHrs','RTX 2050','2.3 kg','512GB',1,N'Với bộ vi xử lý Intel Core i5 dòng H mạnh mẽ và card đồ họa rời NVIDIA GeForce RTX 2050 4 GB, laptop Asus TUF Gaming F15 FX506HF là một trong những lựa chọn tuyệt vời cho các game thủ và những người dùng làm việc đa tác vụ hoặc liên quan đến đồ họa, kỹ thuật.')

insert into LapTop values(2,'Laptop Gaming MSI Cyborg 15','../Assets/img/laptopgaming/Laptop-Gaming-MSI-Cyborg-15.jpg'
								,N'Bảo hành 24 tháng',30490000,25490000,N'Nâng Ram lên 16GB miễn phí','i7 12650H','DDR5 8GB'
								,'3 Cell, 53.5Whr','RTX 4050','1.98 kg','512GB',1,N'Khả năng xử lý trên MSI Cyborg 15 A12VE 240VN sẽ được đảm nhiệm bởi thế hệ thứ 12 từ Intel, i7-12650H đảm bảo một tốc độ xử lý tuyệt vời với mọi yêu cầu từ chủ nhân. Cùng với đó là công việc xử lý đồ họa được giao cho GPU RTX 4050 tân tiến từ thế hệ RTX 40 Series mới nhất từ NVIDIA. Kết hợp với nhau, MSI Cyborg 15 A12VE 240VN cho ra khả năng sử dụng đa tác vụ, từ chơi game đến làm việc, tất cả đều được chiếc laptop hoàn thành một cách xuất sắc.')

insert into LapTop values(3,'Laptop Lenovo Ideapad Gaming','../Assets/img/laptopgaming/Laptop-Lenovo-Ideapad.jpg'
								,N'Bảo hành 24 tháng',25990000,22990000,N'Nâng Ram lên 16GB miễn phí','R5 7535HS','DDR5 8GB'
								,'Integrated 60Wh','RTX 4050','2.32 kg','512GB',1,N' Laptop Lenovo Ideapad sở hữu con chip AMD Ryzen 5 5500H tích hợp cùng card rời NVIDIA GeForce RTX 2050 4 GB hỗ trợ mức hiệu suất mạnh mẽ cho phép bạn chiến thoả thích với những tựa game đang hot như: FO4, Call Of Duty, CS:GO,... Ngoài ra, mức cấu hình trên cũng rất hữu ích khi thực hiện chỉnh sửa hình ảnh và edit video cơ bản với Photoshop, AI, CapCut,... và vận hành nhanh chóng các công việc thường ngày.')

insert into LapTop values(4,'Laptop Gaming Acer Nitro 5 Eagle','../Assets/img/laptopgaming/Laptop-Gaming-Acer-Nitro-5-Eagle.jpg'
								,N'Bảo hành 24 tháng',24990000,19390000,N'Nâng Ram lên 16GB miễn phí','i5 11400H','DDR4 8GB'
								,'4 Cell, 57 Whr','RTX 3050','2.2 kg','512GB',1,N'Sự kết hợp của RAM 8 GB, có thể thay đổi nâng cấp lên 32 GB, mang đến khả năng đa nhiệm và thoải mái hoạt động nhiều ứng dụng, tab cùng lúc. Cạnh đó, sự trang bị SSD M.2 với 512GB là một điểm mạnh giúp laptop có thể vận hành và phản hồi nhanh chóng. Người dùng vẫn có thể nâng cấp bộ nhớ với khe cắm HDD, mở không không gian lưu trữ.')

insert into LapTop values(5,'Laptop Dell Alienware','../Assets/img/laptopgaming/Laptop-Dell-Gaming.jpg'
								,N'Bảo hành 24 tháng',37990000,34990000,N'Nâng Ram lên 16GB miễn phí','i7 12700H','DDR5 16GB'
								,'48WHrs','RTX 3050Ti','1.9 kg','512GB',1,N'Dell Alienware là dòng laptop gaming được mệnh danh là siêu phẩm cao cấp trong làng game. Đây cũng là một trong những dòng máy tính chơi game đầu tiên trên thế giới, bên cạnh các dòng máy của hãng MSI và dòng Nitro của Acer. Đúng với tên gọi Alienware, dòng laptop này được thiết kế lấy cảm hứng từ người ngoài hành tinh. Các sản phẩm của Dell Alienware đều được trang bị thiết kế nổi bật, cấu hình khủng, màn hình sắc nét và khả năng tản nhiệt hiệu quả nhằm hỗ trợ việc chơi game không bị đứng hình hay giật lag.')

insert into LapTop values(6,'Laptop Dell Inspiron 13 5310','../Assets/img/laptopmongnhe/Dell-Inspiron.jpg'
								,N'Bảo hành 12 tháng',25650000,16390000,N'Không nâng RAM','i5-11320H','DDR4 16GB Onboard'
								,'54WHrs','Iris Xe','1.3 kg','512GB',1,N'Inspiron 13 5310 có thể vượt mặt rất nhiều đối thủ trong cùng phân khúc tầm trung phải kể đến hiệu năng của nó. Nó sở hữu bộ vi xử lý Intel mới nhất thuộc dòng Tiger Lake H. Cụ thể, ở phiên bản  đang đánh giá  là CPU Intel Core i5-11320H. CPU 11320H sở hữu 4 nhân 8 luồng nhờ  công nghệ siêu phân luồng, đem lại xung nhịp cơ bản 3.3 GHz và tối đa 4.8 GHz ở chế độ Turbo. Cùng với đó là bộ nhớ đệm L3 12MB. Nó cho khả năng xử lý nhanh chóng các tác vụ văn phòng, một số phần mềm chỉnh sửa ảnh, chơi game một cách trơn tru, mượt mà.')

insert into LapTop values(7,'Laptop MSI Modern 15','../Assets/img/laptopmongnhe/Laptop-MSI-Modern-15.jpg'
								,N'Bảo hành 24 tháng',22490000,18890000,N'Không nâng RAM','i7 1355U','DDR4 16GB Onboard'
								,'3 cell, 39.3Whr','Iris Xe Graphics','1.7 kg','512GB',1,N'• Laptop MSI Modern được trang bị bộ xử lý Intel Core i5 1335U thế hệ mới nhất với tốc độ xung nhịp lên đến 4.6 GHz và card đồ họa Intel Iris Xe Graphics. Với cấu hình này, máy có khả năng xử lý tác vụ nhanh chóng và mượt mà, đáp ứng được nhu cầu làm việc văn phòng, chỉnh sửa hình ảnh và video cơ bản, chơi game nhẹ. RAM 8GB DDR4 và ổ cứng SSD 512 GB PCIe NVMe là hai trang bị mạnh mẽ cho một chiếc laptop học tập - văn phòng, đáp ứng tốt các nhu cầu làm việc văn phòng, học tập và giải trí thông thường. Bên cạnh đó cũng giúp cho việc khởi động hệ điều hành, các ứng dụng và tải dữ liệu trở nên nhanh chóng hơn.')

insert into LapTop values(8,'Laptop Asus VivoBook 14X','../Assets/img/laptopmongnhe/Laptop-Asus-VivoBook.jpg'
								,N'Bảo hành 24 tháng',20990000,16990000,N'Không nâng RAM','i5 13500H','DDR4 16GB Onboard'
								,'50WHrs, 3-Cell','Iris Xe','1.7 kg','512GB',1,N'Laptop Asus Vivobook 14X OLED S3405VA i5 13500H (KM072W) là một sản phẩm tốt với cấu hình mạnh mẽ và màn hình OLED sắc nét, được thiết kế đặc biệt cho sinh viên và nhân viên văn phòng, cũng như cho những người dùng đang tìm kiếm một chiếc laptop mỏng nhẹ và tiện lợi.
								• Với CPU Intel Core i5 13500H, Vivobook 14X OLED có tốc độ xử lý cao, đáp ứng tốt nhu cầu sử dụng các phần mềm xử lý văn bản, trình chiếu, đồ họa và video ở mức trung bình và nâng cao. GPU Intel Iris Xe Graphics vận hành tốt các phần mềm đồ họa 2D và 3D, chơi game ở độ phân giải và cài đặt hình ảnh trung bình.')

insert into LapTop values(9,'Laptop Lenovo IdeaPad Slim 5','../Assets/img/laptopmongnhe/Laptop-Lenovo-IdeaPad-Slim-5.jpg'
								,N'Bảo hành 36 tháng',20490000,18990000,N'Không nâng RAM','i5 13500H','DDR5 16GB Onboard'
								,'Integrated 56.6Wh','Iris Xe','1.46 kg','512GB',1,N'Laptop Lenovo Ideapad Slim 5 16IAH8-83BG001XVN gọn nhẹ với thiết kế hiện đại, cao cấp. Laptop nổi bật với vẻ ngoài màu xám bạc thanh lịch, sang trọng, thu hút mọi ánh nhìn. Bên cạnh đó, phần viền màn hình cũng được thiết kế cực mỏng, các đường nét, bo cong cũng vô cùng mềm mại, hoàn thiện đầy ấn tượng.')

insert into LapTop values(10,'Laptop Acer Swift 3 Air 2021','../Assets/img/laptopmongnhe/laptop_acer_swift_3.png'
								,N'Bảo hành 12 tháng',19000000,15690000,N'Không nâng RAM','i5-1135G7','DDR4 8GB Onboard'
								,'56Wh','Iris Xe G7','1.1 kg','512GB',1,N'Laptop Acer Swift 3 Air 2021 sở hữu thiết kế tinh tế với những đường nét nhẹ nhàng, thanh lịch, cùng gam màu bạc thời trang phù hợp với mọi đối tượng người dùng. Đặc biệt các cạnh của máy được bo cong mềm mại hơn so với thế hệ trước, cho cảm giá cầm nằm vô cùng thoải mái. Laptop có kích thước nhỏ gọn với trọng lượng chỉ khoảng 1.46 kg, mỏng 1.79cm, thuận tiện để bạn cho vào balo và mang theo khi đi học hay đi làm.')

insert into LapTop values(11,'Laptop MSI Modern 15','../Assets/img/laptopdohoa/Laptop-MSI-Modern-15.jpg'
								,N'Bảo hành 24 tháng',22490000,18890000,N'Không nâng RAM','i7 1355U','DDR4 16GB Onboard'
								,'3 cell, 39.3Whr','Iris Xe Graphics','1.7 kg','512GB',1,N'Modern 15 A11MU (680VN) là phiên bản laptop học tập - văn phòng đến từ nhà MSI với xu hướng thiết kế gọn nhẹ, hiện đại cùng hiệu năng vượt trội đến từ con chip Intel Gen 11 ấn tượng, đáp ứng tối đa nhu cầu giải trí và làm việc cho người dùng.')

insert into LapTop values(12,'Laptop Asus VivoBook 14X','../Assets/img/laptopdohoa/Laptop-Asus-VivoBook-14X.jpg'
								,N'Bảo hành 24 tháng',20990000,16990000,N'Không nâng RAM','i5 13500H','DDR4 16GB Onboard'
								,'50WHrs, 3-Cell','Iris Xe','1.7 kg','512GB',1,N'Asus Vivobook 14X K3405ZFKM184W OLED là mẫu laptop Asus Vivobook sở hữu nhiều ưu điểm vượt trội không chỉ về giao diện thiết kế với màn hình chất lượng cao, hành trình phím tối ưu mà còn cung cấp cấu hình hiệu suất mạnh mẽ với chipset Intel thế hệ 12 cùng bộ nhớ dung lượng lớn.')

insert into LapTop values(13,'Laptop Lenovo IdeaPad Slim 5','../Assets/img/laptopdohoa/Laptop-Lenovo-IdeaPad-Slim-5.jpg'
								,N'Bảo hành 36 tháng',20490000,18990000,N'Không nâng RAM','i5 13500H','DDR5 16GB Onboard'
								,'Integrated 56.6Wh','Iris Xe','1.46 kg','512GB',1,N'Laptop Lenovo Ideapad Slim 5 14IMH9 83DA001NVN sử dụng bộ xử lý Intel Core Ultra 5 125H, 14 lõi, 18 luồng kết hợp với card tích hợp Intel Arc Graphics. Sản phẩm cung cấp khả năng xử lý đa nhiệm ổn định và tốc độ khởi động nhanh với RAM LPDDR5x-7467 16GB và SSD 512GB. Màn hình kích thước 14 inch chuẩn độ phân giải WUXGA trang bị công nghệ hiển thị Display HDR True Black 500 tân tiến. ')

insert into LapTop values(14,'Laptop Acer Aspire 7','../Assets/img/laptopdohoa/acer-aspire-7.jpg'
								,N'Bảo hành 12 tháng',22990000,20690000,N'Không nâng RAM','i5 12450H','DDR5 8GB Onboard'
								,'3 Cell 50 Wh','GTX 1650','2.1 kg','512GB',1,N'Acer Aspire 7 2020 A715 42G tích hợp card đồ họa NVIDIA GTX1650 4GB GDDR6, là laptop chơi game tốt nhất phân khúc. Không chỉ vậy, phiên bản này còn mang thiết kế mới gọn gàng và sexy hơn. Aspire 7 2020 được trang bị hệ thống tản nhiệt mạnh mẽ bậc nhất trong phân khúc, thừa hưởng công nghệ từ các dòng máy cao cấp hơn của Acer, cùng cấu hình đỉnh cao, giúp cho người dùng có thể vừa chơi game vừa làm việc ở bất cứ lúc nào.')

insert into LapTop values(15,'Laptop Gaming Gigabyte G5','../Assets/img/laptopdohoa/Laptop-Gigabyte.jpg'
								,N'Bảo hành 24 tháng',24200000,18990000,N'Nâng Ram lên 16GB miễn phí','i5 12450H','DDR4 8GB'
								,'54Whr','RTX 4050','1.99 kg','512GB',1,N'Laptop Gigabyte G5 GD-51VN123SO được đáng giá cao về khả năng xử lý hiệu quả trong mọi tác vụ, kể cả những tựa game nặng ký. Với thiết kế cá tính ẩn chứa nhiều linh kiện cao cấp bên trong, dòng laptop Gigabyte gaming này chắc chắn sẽ khiến các game thủ hài lòng.')

SELECT [sIDLapTop], [sName], [sPictureSource], [sWarranty], [iOldPrice], [iNewPrice], [sBoostRam], [sCpu], [sRam], [sBattery], [sGraphicCard], [sWeight], [sStorage],[sDescribe]  FROM [LapTop] where [sIDLapTop] > 10 and [sIDLapTop] <=15

create proc TimKiemTheoTen
@TenMayTinh nvarchar(100)
as 
begin
	SELECT [sIDLapTop], [sName], [sPictureSource], [sWarranty], [iOldPrice], [iNewPrice], [sBoostRam], [sCpu], [sRam], [sBattery], [sGraphicCard], [sWeight], [sStorage]  ,[sDescribe]
	FROM [LapTop] 
	where [sName] like N'%' + @TenMayTinh + '%'
end

exec TimKiemTheoTen N'Dell'

ALTER TABLE tblDangKyTaiKhoan
ADD CONSTRAINT PK_tblDangKyTaiKhoan PRIMARY KEY (sTenDangNhap);

-------- Tạo bảng giỏ hàng ----------
CREATE TABLE Cart (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    sTenDangNhap nvarchar(50) not null,
    FOREIGN KEY (sTenDangNhap) REFERENCES tblDangKyTaiKhoan(sTenDangNhap)
);

select* from Cart
delete from Cart
drop table Cart

-------Bảng sảng phẩm trong giỏ hàng--------
CREATE TABLE CartItem (
    CartItemID INT PRIMARY KEY IDENTITY(1,1),
    CartID INT,
    sIDLapTop INT,
	iQuantity int,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (sIDLapTop) REFERENCES LapTop(sIDLapTop)
);
select * from CartItem
drop table CartItem

--Thêm vào cart
CREATE Proc addCart
    @Username NVARCHAR(50)
AS
BEGIN
    INSERT INTO Cart (sTenDangNhap) VALUES (@Username); 
	SELECT SCOPE_IDENTITY();
END

select* from CartItem 
select* from Cart  
delete from CartItem where CartItemID =4

SELECT sPictureSource, sName,iNewPrice,CartItem.iQuantity, (LapTop.iNewPrice * CartItem.iQuantity) AS TotalPrice 
FROM Cart,CartItem,LapTop where Cart.CartID = CartItem.CartID and CartItem.sIDLaptop = LapTop.sIDLaptop and Cart.CartID = 1071


select sum(LapTop.iNewPrice * CartItem.iQuantity)
FROM Cart,CartItem,LapTop 
where Cart.CartID = CartItem.CartID and CartItem.sIDLaptop = LapTop.sIDLaptop and Cart.CartID = 1071

UPDATE CartItem SET iQuantity = iQuantity - 1 WHERE CartItemID = 2

drop proc addCart
drop table tblHoaDon


------ Tạo bảng tblHoaDon ------
CREATE TABLE tblHoaDon (
    iMaHD INT IDENTITY(1,1) PRIMARY KEY,
    CartID INT,
    sHoTen NVARCHAR(50),
    sDiaChi NVARCHAR(50),
    sDienThoai VARCHAR(20),
    sTheNganHang NVARCHAR(20),
	sTenDangNhap NVARCHAR(50),
    dNgayLapHD DATETIME DEFAULT GETDATE(),
	dNgayGiaoHang DATETIME DEFAULT DATEADD(DAY, 5, GETDATE()),
	iTongTien INT,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
	FOREIGN KEY (sTenDangNhap) REFERENCES tblDangKyTaiKhoan(sTenDangNhap)
);

------- Tạo bảng tblHoaDonChiTiet --------
CREATE TABLE tblCTHoaDon (
    iMaHD INT,
    CartItemID INT,
    PRIMARY KEY (iMaHD, CartItemID),
    FOREIGN KEY (iMaHD) REFERENCES tblHoaDon(iMaHD),
    FOREIGN KEY (CartItemID) REFERENCES CartItem(CartItemID)
);

select * from tblHoaDon

drop table tblHoaDon
drop table tblCTHoaDon
--sHDCode varchar(40) UNIQUE


select * from tblHoaDon
select * from tblCTHoaDon
select * from Cart where sTenDangNhap='ngocanh'

 --Hiển thị thông tin khách hàng, thời gian giao hàng
select tblHoaDon.sHoTen, tblHoaDon.sDiaChi, LapTop.sPictureSource from tblHoaDon inner join tblCTHoaDon on tblHoaDon.iMaHD = tblCTHoaDon.iMaHD inner join CartItem on tblCTHoaDon.CartItemID = CartItem.CartItemID inner join LapTop on CartItem.sIDLapTop = LapTop.sIDLapTop inner join Cart on Cart.CartID = CartItem.CartID where tblHoaDon.sTenDangNhap = N'ngocanh'
select * from LapTop

--Hiển thị danh sách hóa đơn khách hàng đã đặt
select * from tblHoaDon where sTenDangNhap = 'minhtrang'
delete from tblHoaDon where iMaHD = 7

--Hiển thị danh sách sản phẩm
select tblCTHoaDon.iMaHD, LapTop.sName, LapTop.sPictureSource, LapTop.iNewPrice, CartItem.iQuantity from tblCTHoaDon inner join CartItem on tblCTHoaDon.CartItemID = CartItem.CartItemID inner join LapTop on CartItem.sIDLapTop= LapTop.sIDLapTop where tblCTHoaDon.iMaHD = 1

select * from LapTop where sIDLapTop = ''