DROP DATABASE IF EXISTS TestingExam_1;
CREATE DATABASE TestingExam_1;
USE TestingExam_1;
SET SQL_SAFE_UPDATES = 0;
DROP TABLE IF EXISTS CUSTOMER ;
CREATE TABLE CUSTOMER (

			  CustomerID INT AUTO_INCREMENT PRIMARY KEY,
			  `Name` 	VARCHAR(100) NOT NULL,
			  Phone 	VARCHAR(15) NOT NULL,
			  Email 	VARCHAR(30) NOT NULL,
			  Address 	VARCHAR(50) NOT NULL,
			  Note 	NVARCHAR(500) NOT NULL,
			  UNIQUE INDEX Phone_UNIQUE (Phone ASC) VISIBLE,
			  UNIQUE INDEX Email_UNIQUE (Email ASC) VISIBLE);
              
  DROP TABLE IF EXISTS CAR ;
	CREATE TABLE CAR (
		  CarID INT AUTO_INCREMENT PRIMARY KEY ,
		  Maker ENUM('HONDA', 'TOYOTA', 'NISSAN') NOT NULL,
		  Model VARCHAR(40) NOT NULL,
		  `Year` VARCHAR(30) NOT NULL,
		  Color VARCHAR(45) NOT NULL,
		  Note NVARCHAR(500) NULL
		  );

  DROP TABLE IF EXISTS CAR_ORDER ;
  CREATE TABLE CAR_ORDER (
  
		  OrderID INT AUTO_INCREMENT  PRIMARY KEY ,
		  CustomerID INT NOT NULL,
		  CarID INT NOT NULL ,
		  Amount INT NOT NULL DEFAULT 1,
		  SalePrice FLOAT NOT NULL,
		  OrderDate DATETIME NULL,
		  DeliveryDate DATETIME NULL,
		  DeliveryAddress VARCHAR(45) NOT NULL,
		  `Status` TINYINT(2) DEFAULT 0 NOT NULL, -- (0: đã đặt hàng, 1: đã giao, 2: đã hủy),
		  Note NVARCHAR(500) NULL,
		  FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE,
		  FOREIGN KEY (CarID) REFERENCES CAR (CarID) ON DELETE CASCADE)
          ;

-- Questions 1. Tạo table với các ràng buộc và kiểu dữ liệu Thêm ít nhất 5 bản ghi vào table.

INSERT INTO CUSTOMER (CustomerID, `Name`, Phone, Email, Address, Note)
VALUES  		('1', 'NguyenvanA', '0978635142','A@gmail.com','HaNoi','fbaifhiuakwjfbka' ),
				('2', 'DuongVanBinh', '0978635153','Binh@gmail.com','HaiPhong','fbaifhiuakwjfbka' ),
				('3', 'PhamThiHue', '0978633455','Hue@gmail.com','HaTay','fbaifhiuakwjfbka' ),
				('4', 'NguyenThanhLong', '0978635172','Long@gmail.com','HCM','fbaifhiuakwjfbka' ),
                ('5', 'NguyenNhuTrang', '097863514','Trang@gmail.com','HaNoi','fbaifhiuakwjfbka' )
                ;

INSERT INTO CAR (CarID, Maker, Model, `Year`, Color, Note)
VALUES  		('1', 'HONDA', 'HD2019','2016','Blue','fbaifhiuakwjfbka' ),
				('2', 'TOYOTA', 'TOY2020','2010','Black','fbaifhiuakwjfbka' ),
				('3', 'HONDA', 'HD2021','2015','Red','fbaifhiuakwjfbka' ),
				('4', 'NISSAN', 'NIS2020','2018','White','fbaifhiuakwjfbka' ),
                ('5', 'TOYOTA', 'TOY2021','2019','Yeallow','fbaifhiuakwjfbka' )
                ;
                
                
INSERT INTO CAR_ORDER (OrderID, CustomerID, CarID, Amount,SalePrice, OrderDate, DeliveryDate, DeliveryAddress, `Status`, Note)
VALUES  		
				('1', '1', '1','1','70.000000','20210515','20210715','HaNoi',1, 'skjfbksjdfb' ),
				('2', '3', '2','2','90.000000','20200415', null,'HaNoi', 2 ,'sbfhksfb'),
				('3', '4', '1','1','80.000000','20210215', '20210815' ,'HaNoi',0, 'sjfasiufg'),
				('4', '1', '5','4','60.000000','20210615','20210915','HaNoi',0,'sjhfbsakf' ),
                ('5', '5', '4','3','100.000000','20210915', '20211115','HaNoi', 1,'sjfgksafk' )
                ;
 -- Question 2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
--              mua và sắp sếp tăng dần theo số lượng oto đã mua.   

SELECT C.`Name`, CAO.Amount
FROM  CUSTOMER C
JOIN CAR_ORDER CAO
ON C.CustomerID = CAO.CustomerID
WHERE `Status` = 1
ORDER BY CAO.Amount ASC;

 -- Question  3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều
--              oto nhất trong năm nay.

SELECT CA.Maker
FROM CAR_ORDER CAO
JOIN CAR CA ON CA.CarID = CAO.CarID
GROUP BY CA.CarID
HAVING COUNT(CAO.Amount) = SELECT MAX(SL) FROM (SELECT SUM(CAO.Amount) AS SL
								FROM CAR_ORDER CAO
								JOIN CAR CA ON CA.CarID = CAO.CarID
								WHERE `Status` = 1 AND YEAR(DeliveryDate) = YEAR (NOW())
								GROUP BY CA.CarID
								ORDER BY  SL DESC
								LIMIT 1 )AS ASFH)
									;


SELECT CAO.CarID ,SUM(CAO.Amount) AS SL
FROM CAR_ORDER CAO
JOIN CAR CA ON CA.CarID = CAO.CarID
WHERE `Status` = 1 AND YEAR(DeliveryDate) = YEAR (NOW())
GROUP BY CA.CarID
ORDER BY  SL DESC
LIMIT 1
;
  
  -- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của
--       những năm trước. In ra số lượng bản ghi đã bị xóa.


SELECT *FROM
    CAR_ORDER
    WHERE `Status` = 2 AND YEAR(NOW())> YEAR(OrderDate);
    
  DROP PROCEDURE IF EXISTS DEL_ORDER;

DELIMITER $$
CREATE PROCEDURE DEL_ORDER()
BEGIN
		DELETE FROM
    CAR_ORDER
    WHERE `Status` = 2 AND YEAR(NOW())> YEAR(OrderDate);
END$$
DELIMITER ;

CALL DEL_ORDER();  

-- 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn
--    hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto và tên hãng sản xuất.


SELECT C.`Name`, CAO.OrderID, CAO.Amount, CA.Maker
From CUSTOMER C
JOIN CAR_ORDER CAO ON C.CustomerID = CAO.CustomerID
JOIN CAR CA ON CA.CarID = CAO.CarID
WHERE C.CustomerID =  CAO.CustomerID AND CAO.`Status` = 0 ;


DROP PROCEDURE IF EXISTS INFO_ORDER;
DELIMITER $$
CREATE PROCEDURE INFO_ORDER (IN IN_CustomerID INT)
BEGIN 
	SELECT C.`Name`, CAO.OrderID, CAO.Amount, CA.Maker
					From CUSTOMER C
					JOIN CAR_ORDER CAO ON C.CustomerID = CAO.CustomerID
					JOIN CAR CA ON CA.CarID = CAO.CarID
					WHERE C.CustomerID =  IN_CustomerID AND CAO.`Status` = 0 ;

END $$
DELIMITER ;

CALL INFO_ORDER(4);

    