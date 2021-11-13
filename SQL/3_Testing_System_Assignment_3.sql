DROP DATABASE IF EXISTS Testing_System_Assignment_3;
CREATE DATABASE Testing_System_Assignment_3;
USE Testing_System_Assignment_3;

CREATE TABLE Department(
DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(30) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY
KEY,
PositionName ENUM('Dev','Test','Scrum Master','PM') UNIQUE
KEY NOT NULL 
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY
KEY,
Email VARCHAR(50) NOT NULL UNIQUE KEY,
Username VARCHAR(50) NOT NULL UNIQUE KEY,
FullName NVARCHAR(50) NOT NULL,
DepartmentID TINYINT UNSIGNED NOT NULL,
PositionID TINYINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
CreatorID TINYINT UNSIGNED,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
GroupID TINYINT UNSIGNED NOT NULL,
AccountID TINYINT UNSIGNED NOT NULL,
JoinDate DATETIME DEFAULT NOW(),
PRIMARY KEY (GroupID,AccountID),
FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(500) NOT NULL,
CategoryID TINYINT UNSIGNED NOT NULL,
TypeID TINYINT UNSIGNED NOT NULL,
CreatorID TINYINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(300) NOT NULL,
QuestionID TINYINT UNSIGNED NOT NULL,
isCorrect ENUM ("true","false"),
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY
KEY,
`Code` CHAR(10) NOT NULL,
Title NVARCHAR(50) NOT NULL,
CategoryID TINYINT UNSIGNED NOT NULL,
Duration TINYINT UNSIGNED NOT NULL,
CreatorID TINYINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)

);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID TINYINT UNSIGNED NOT NULL,
QuestionID TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),

FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
PRIMARY KEY (ExamID,QuestionID)
);


-- INSERT --
-- Question 1: Thêm ít nhất 10 record vào mỗi table

INSERT INTO Department(DepartmentName)
VALUES
				('Giam Doc' ),
				('Sale' ),
				('Marketing' ),
				('HR' ),
				('Technology' ),
				('Tai Chinh' ),
				('Thu Ki'),
				('CSKH' ),
				('Dao Tao' ),
				('Bao Ve' );

INSERT INTO Position (PositionName )
VALUES  		('Dev' ),
				('Test' ),
				('Scrum Master'),
				('PM' );

INSERT INTO `Account`(Email , Username, FullName , DepartmentID , PositionID, CreateDate)
VALUES 

				('An1@gmail.com' ,'An' ,'Nguyen Van An' , '5' , '1','2020-03-05'),

				('Binh2@gmail.com' ,'Binh' ,'Duong Van Binh' , '1' , '2','2020-03-05'),

				('Long3@gmail.com' , 'Long' ,'Nguyen Thanh Long', '2' , '2' ,'2020-03-07'),

				('Dang4@gmail.com' , 'Dang' ,'Ngo Bach Dang', '3' , '4' ,'2020-03-08'),

				('Anh5@gmail.com' , 'Anh' ,'Nguyen Tuan Anh', '4' , '4' ,'2020-03-10'),

				('Phuc6@gmail.com' , 'Phuc' ,' Nguyen Van Phuc', '6' , '3' ,'2020-04-05'),

				('Tu7@gmail.com' , 'Tu' ,'Luong Thanh Tu', '2' , '2' , NULL ),
                
				('Hue8@gmail.com' , 'Hue' ,'Pham Thi Hue', '8' , '1' ,'2020-04-07'),

				('Thao9@gmail.com' , 'Ngoc' ,'Dang Thu Thao', '2' , '2' ,'2020-04-07'),
                
				('Dung10@gmail.com' , 'Dung' ,'Ha Viet Dung', '10' , '1' ,'2020-04-09');

INSERT INTO `Group` ( GroupName , CreatorID , CreateDate)
VALUES 			
				('Group Alpha' , 5,'2019-03-05'),
				('Group Beta' , 1,'2020-03-07'),
				('Group Delta' , 2 ,'2020-03-09'),
				('Group SS' , 3 ,'2020-03-10'),
				('Group Amazon' , 4 ,'2020-03-28'),
				('Group Creator' , 6 ,'2020-04-06'),
				('Group Makerting' , 7 ,'2020-04-07'),
				('Group Management' , 8 ,'2020-04-08'),
				('Group Training' , 9 ,'2020-04-09'),
				('Group Fesher' , 10 ,'2020-04-10');

INSERT INTO `GroupAccount` ( GroupID , AccountID , JoinDate )
VALUES 
			( 1 , 1,'2019-03-05'),
			( 1 , 2,'2020-03-07'),
			( 3 , 3,'2020-03-09'),
			( 3 , 4,'2020-03-10'),
			( 5 , 5,'2020-03-28'),
			( 1 , 3,'2020-04-06'),
			( 1 , 7,'2020-04-07'),
			( 8 , 3,'2020-04-08'),
			( 1 , 9,'2020-04-09'),
			( 10 , 10,'2020-04-10');

INSERT INTO TypeQuestion (TypeName )
VALUES 		('Essay' ),('Multiple-Choice' );

INSERT INTO CategoryQuestion (CategoryName )
VALUES 			
			('Nhat Ban' ),
			('Viet Nam' ),
			('Ky Nang Giao Tiep' ),
			('Lap Trinh' ),
			('Thi Truong' ),
			('Ky Thuat' ),
			('Kinh Nghiem' ),
			('Cuoc Song' ),
			('Ngon Ngu Lap Trinh' ),
			('Dinh Huong Nghe Nghiep' );

INSERT INTO Question (Content , CategoryID, TypeID , CreatorID, CreateDate )
VALUES 

			(N'Câu hỏi về Nhật Bản' , 1 ,'1' , '2' ,'2020-04-05'),
			(N'Câu hỏi về Định Hướng Nghề Nghiệp' , 10 ,'2' , '2' ,'2020-04-05'),
			(N'Câu hỏi về Ngôn Ngữ Lập Trình' , 9 ,'2' , '3' ,'2020-04-06'),
			(N'Câu hỏi về Cuộc Sống' , 6 ,'1' , '4' ,'2020-04-06'),
			(N'Câu hỏi về Kinh Nghiệm' , 5 ,'1' , '5' ,'2020-04-06'),
			(N'Câu hỏi về Kỹ Thuật' , 3 ,'2' , '6' ,'2020-04-06'),
			(N'Câu hỏi về Thị Trường' , 2 ,'1' , '7' ,'2020-04-06'),
			(N'Câu hỏi về Lập Trình' , 8 ,'1' , '8' ,'2020-04-07'),
			(N'Câu hỏi về Kỹ Năng Giao Tiếp' , 4 ,'2' , '9' ,'2020-04-07'),
			(N'Câu hỏi về Việt Nam' , 7 ,'1' , '10' ,'2020-04-07');
                
INSERT INTO Answer ( Content , QuestionID , isCorrect )
VALUES 

			(N'Trả lời 01' , 1 , "true"),
			(N'Trả lời 02' , 1 , "false"),
			(N'Trả lời 03', 1 , "true" ),
			(N'Trả lời 04', 1 , "false"),
			(N'Trả lời 05', 2 , "true"),
			(N'Trả lời 06', 3 , "false"),
			(N'Trả lời 07', 4 , "true"),
			(N'Trả lời 08', 8 , "false" ),
			(N'Trả lời 09', 9 , "true"),
			(N'Trả lời 10', 10 , "true");

INSERT INTO Exam (`Code` , Title , CategoryID, Duration , CreatorID , CreateDate )
VALUES 
			('VNNB01' , N'Đề thi C#' ,1 , 60 , '5' ,'2019-04-05'),
			('VNNB02' , N'Đề thi PHP' ,10 , 60 , '2' ,'2019-04-05'),
			('VNNB03' , N'Đề thi C++' , 9 ,120 , '2' ,'2019-04-07'),
			('VNNB04' , N'Đề thi Java' , 6 , 60, '3' ,'2020-04-08'),
			('VNNB05' , N'Đề thi Ruby' , 5 , 120, '4' ,'2020-04-10'),
			('VNNB06' , N'Đề thi Postman' , 3 ,60 , '6' ,'2020-04-05'),
			('VNNB07' , N'Đề thi SQL' , 2 ,60 , '7' ,'2020-04-05'),
			('VNNB08' , N'Đề thi Python' , 8 ,60 , '8' ,'2020-04-07'),
			('VNNB09' , N'Đề thi ADO.NET' , 4 ,90 , '9' ,'2020-04-07'),
			('VNNB10' , N'Đề thi ASP.NET' , 7 ,90 , '10' ,'2020-04-08');

INSERT INTO ExamQuestion(ExamID , QuestionID )
VALUES 
			( 1 , 5 ),
			( 2 , 10 ),
			( 3 , 4 ),
			( 4 , 3 ),
			( 5 , 7 ),
			( 6 , 10 ),
			( 7 , 2 ),
			( 8 , 10 ),
			( 9 , 9 ),
			( 10 , 8 );
            
-- Question 2: lấy ra tất cả các phòng ban
SELECT*FROM Department;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT DepartmentID FROM Department
WHERE DepartmentName = 'Sale' ;

-- Question 4: lấy ra thông tin account có full name dài nhất
   -- Cách 1 :
SELECT * FROM `Account`
ORDER BY LENGTH(Fullname) DESC
LIMIT 1;
   -- Cách 2:
SELECT *FROM `Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)
ORDER BY Fullname DESC;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3

SELECT * FROM `Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account` WHERE DepartmentID =3)
ORDER BY Fullname ASC;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName FROM `Group`
WHERE CreateDate < 20191220;

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời

SELECT QuestionID, Count(QuestionID) AS "Số câu trả lời"
FROM Answer
GROUP BY QuestionID
HAVING Count(AnswerID) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019

SELECT `Code` 
FROM Exam 
WHERE Duration >=60 AND CreateDate < 20191220;

-- Question 9: Lấy ra 5 group được tạo gần đây nhất

SELECT * FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2

SELECT DepartmentID, Count(UserName) AS "Số Nhân Viên"
FROM `Account`
WHERE DepartmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

SELECT Fullname 
FROM `Account`
WHERE Fullname LIKE 'D%O';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019

DELETE FROM Exam 
WHERE CreateDate < '20191220' ;

SET SQL_SAFE_UPDATES = 0;


-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"

DELETE FROM Question 
WHERE Content LIKE 'Câu hỏi%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account` 
SET   Fullname = "Nguyễn Bá Lộc",
       Email = "loc.nguyenba@vti.com.vn"
WHERE  AccountID = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4

UPDATE GroupAccount 
SET AccountID = 5
WHERE GroupID = 4;