DROP DATABASE IF EXISTS Extra_Assignment_1;
CREATE DATABASE Extra_Assignment_1;
USE Extra_Assignment_1;
SET SQL_SAFE_UPDATES = 0;
 -- Exercise 1:Design a table
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (

			TraineeID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			FullName NVARCHAR(50) NOT NULL,
			BirthDate DATE NOT NULL,
			Gender ENUM('male','female','unknown' )  NOT NULL ,
            ET_IQ TINYINT UNSIGNED CHECK (ET_IQ <= 20),
            ET_Gmath TINYINT UNSIGNED CHECK (ET_Gmath <= 20 ),
            ET_English TINYINT UNSIGNED CHECK (ET_English <= 50),
            Training_Class VARCHAR(10) NOT NULL,
            Evaluation_Notes LONGTEXT
);
			ALTER TABLE Trainee ADD VTI_Account VARCHAR(25) NOT NULL UNIQUE;

-- Exercise 2: Data Types

DROP TABLE IF EXISTS `Data Types` ;
CREATE TABLE `Data Types` (
				ID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                `Name` VARCHAR(50) NOT NULL,
                `Code` CHAR (5) UNIQUE NOT NULL ,
                ModifiedDate DATETIME DEFAULT NOW()

);

-- Exercise 3: Data Types (2)
DROP TABLE IF EXISTS `Data Types2` ;
CREATE TABLE `Data Types2` (
				ID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                 `Name` VARCHAR(50) NOT NULL,
                BirthDate DATE,
                Gender  ENUM('male','female','unknown' ),
                IsDeletedFlag BIT
);


-- SQL – Assignment 3

-- Exercise 1: Tiếp tục với Database quản lý Fresher
-- Question 1: Thêm ít nhất 10 bản ghi vào table

INSERT INTO Trainee (TraineeID, FullName, BirthDate, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account )
VALUES
				('1' , 'Nguyen Van An','1992-03-05', 'male', 10, 12, 30, '01', 'GOOD' , 'VTI01'),
                ('2' , 'Duong Van Binh',"19951206", 'male', 15, 15, 35, 'MS02', 'GOOD' , 'VTI_02'),
                ('3' , 'Nguyen Thanh Long','1994-08-09', 'male', 20, 17, 38, 'MS01', 'GOOD' , 'VTI_03'),
                ('4' , 'Ngo Bach Dang','1995-04-05', 'male', 14, 19, 40, 'MS03', 'GOOD' , 'VTI_04'),
                ('5' , 'Nguyen Tuan Anh','1997-07-06', 'male', 17, 20, 30, 'MS01', 'GOOD' , 'VTI_05'),
                ('6' , 'Nguyen Van Phuc','1991-02-05', 'male', 19, 12, 50, 'MS02', 'GOOD' , 'VTI_06'),
                ('7' , 'Luong Thanh Tu','1998-08-24', 'female', 20, 17, 20, 'MS01', 'GOOD' , 'VTI_07'),
                ('8' , 'Pham Thi Hue','1993-11-21', 'female', 05, 11, 30, 'MS03', 'GOOD' , 'VTI_08'),
                ('9' , 'Dang Thu Thao','1999-12-02', 'female', 11, 13, 30, 'MS01', 'GOOD' , 'VTI_09'),
                ('10' , 'Ha Viet Dung','1990-06-09', 'unknown' , 6, 12, 35, 'MS02', 'GOOD' , 'VTI_10')
				;


-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
					-- THEM DIEU KIEN GIA DINH : ET_IQ > 8	, ET_Gmath> 12 , ET_English > 30
				 CREATE OR REPLACE VIEW v_passed_fresher AS
				SELECT *
				FROM Trainee
				WHERE ET_IQ >= 8
				AND ET_Gmath >= 12
				AND ET_English >= 30;

				SELECT * FROM v_passed_fresher;

				SELECT MONTH(BirthDate), COUNT(FullName)
                FROM v_passed_fresher
					GROUP BY MONTH(BirthDate);
         
         
				

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
			SELECT *
            FROM Trainee 
			WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM Trainee)
			ORDER BY Fullname DESC;

			-- Cach 2:
 
			SELECT * FROM Trainee
			ORDER BY LENGTH(Fullname) DESC
			LIMIT 1;

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
--            những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
				--  ET_IQ + ET_Gmath>=20
				--  ET_IQ>=8
				--  ET_Gmath>=8
				--  ET_English>=18
                
					SELECT * 
					FROM Trainee
					WHERE ET_IQ + ET_Gmath>=20 AND ET_Gmath>=8 AND  ET_English>=18;



-- Question 5: xóa thực tập sinh có TraineeID = 3

				DELETE FROM Trainee WHERE TraineeID= 3;
                
-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database

                UPDATE Trainee 
				SET Training_Class = 'MS02'
				WHERE TraineeID = 5;
                
                SET SQL_SAFE_UPDATES = 0;



