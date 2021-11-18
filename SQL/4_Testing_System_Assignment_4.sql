DROP DATABASE IF EXISTS Testing_System_Assignment_4;
CREATE DATABASE Testing_System_Assignment_4;
USE Testing_System_Assignment_4;

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
            
            
            
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ  

SELECT     `Account`.FullName, `Account`.Email,`Account`.Username, Department.DepartmentName
FROM       `Account`
INNER JOIN Department  ON  `Account`.AccountID=Department.DepartmentID;


-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 05/03/2010
SELECT *
FROM  `Account`
WHERE  CreateDate>20200305;

-- Question 3: Viết lệnh để lấy ra tất cả các developer

SELECT `Account`.FullName, Position.PositionName
From `Account`
INNEQuestionR JOIN  Position ON `Account`.PositionID = Position.PositionID
WHERE PositionName = "Dev" ;


-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT Department.DepartmentName,count(`Account`.DepartmentID) as "SL Nhân viên"
FROM `Account`
INNER JOIN  Department on `Account`.DepartmentID= Department.DepartmentID
GROUP BY `Account`.DepartmentID
HAVING count(`Account`.DepartmentID)>=3;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT EQ.QuestionID, Q.Content
FROM ExamQuestion EQ
JOIN Question Q ON Q.QuestionID = EQ.QuestionID
GROUP BY Q.QuestionID
HAVING count(EQ.QuestionID) = (SELECT MAX(countcauhoi) as Maxcountcauhoi FROM (
								SELECT COUNT(EQ.QuestionID) AS countcauhoi FROM ExamQuestion EQ
								GROUP BY EQ.QuestionID) AS countMAX);

 -- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
 SELECT Q.QuestionID, Q.CategoryID, CQ.CategoryName, count(CQ.CategoryID) as SL
 FROM CategoryQuestion CQ
 INNER JOIN Question Q ON  Q.QuestionID = CQ.CategoryID
 GROUP BY Q.QuestionID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT Q.QuestionID, Q.Content, count(EQ.QuestionID) as SL
FROM ExamQuestion EQ
RIGHT JOIN Question Q on Q.QuestionID = EQ.QuestionID
Group by Q.QuestionID
;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT Q.QuestionID, Q.Content, count(A.QuestionID) as SLgTL
From Answer A
Join Question Q on Q.QuestionID = A.QuestionID
group by Q.QuestionID 
having count(A.QuestionID) = (SELECT MAX(Slg) as SLgLN from 
								(Select count(A.QuestionID) as SLg
								 FROM Answer A
								 group by A.QuestionID) as ABC);
					
-- Question 9: Thống kê số lượng account trong mỗi group

SELECT GA.GroupID, count(GA.AccountID) as SLgAccount
From GroupAccount GA
join `Group` G on G.GroupID = GA.GroupID
group by G.GroupID
order by G.GroupID ASC;

-- Question 10: Tìm chức vụ có ít người nhất

SELECT P.PositionID, P.PositionName, count(A.PositionID) as "SLg"
FROM Position P
JOIN `Account` A ON P.PositionID = A.PositionID
GROUP BY A.PositionID
HAVING count(A.PositionID) = (SELECT MIN(SlgP) FROM 
										(SELECT count(P.PositionID) AS SlgP
										FROM Position P
										INNER JOIN `Account` A ON P.PositionID = A.PositionID
										GROUP BY P.PositionID) AS MinSlgP);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT D.DepartmentID,D.DepartmentName, P.PositionName, count(P.PositionName) as "SLg"
FROM `account` A
INNER JOIN Department D ON A.DepartmentID = D.DepartmentID
INNER JOIN position P ON A.PositionID = P.PositionID
GROUP BY D.DepartmentID, P.PositionID;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm:
--              thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

SELECT Q.QuestionID, Q.Content, TQ.TypeName AS "Loại Câu Hỏi", A.FullName, ANS.Content as "ND Trả lời"
FROM Question Q
INNER JOIN CategoryQuestion CQ ON Q.CategoryID = CQ.CategoryID
INNER JOIN TypeQuestion TQ ON Q.TypeID = TQ.TypeID
INNER JOIN `account` A ON A.AccountID = Q.CreatorID
INNER JOIN Answer AS ANS ON Q.QuestionID = ANS.QuestionID
ORDER BY Q.QuestionID ASC;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT  Q.Content, Q.TypeID, TQ.TypeID,TQ.TypeName, Count(Q.TypeID) as "SL"
FROM Question Q
INNER JOIN TypeQuestion TQ ON Q.TypeID = TQ.TypeID
Group by Q.QuestionID;
-- Note: Nếu lấy content thì cách trên là đúng

-- cách 2: chỉ lấy ra số lượng TQ.TypeID,TQ.TypeName 

SELECT  Q.TypeID, TQ.TypeID,TQ.TypeName, Count(Q.QuestionID) as "SL"
FROM Question Q
 JOIN TypeQuestion TQ ON Q.TypeID = TQ.TypeID
Group by TQ.TypeID ;


-- Question 14:Lấy ra group không có account nào

SELECT * FROM `Group` G
LEFT JOIN GroupAccount GA ON G.GroupID = GA.GroupID
WHERE GA.AccountID IS NULL;


-- Question 15: Lấy ra group không có account nào


-- Question 16: Lấy ra question không có answer nào

SELECT *
FROM Question
WHERE QuestionID  IN (SELECT Q.QuestionID FROM Answer A
						RIGHT JOIN Question Q on A.QuestionID = Q.QuestionID
						WHERE A.AnswerID IS NULL);


-- * Exercise 2: Union
 -- Question 17:
				-- a) Lấy các account thuộc nhóm thứ 1
				-- b) Lấy các account thuộc nhóm thứ 2
				-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau

-- a) Lấy các account thuộc nhóm thứ 1

			SELECT  A.Username,A.FullName  FROM `Account` A
			JOIN GroupAccount GA ON A.AccountID = GA.AccountID
			WHERE GA.GroupID = 1;
  
-- b) Lấy các account thuộc nhóm thứ 2

			SELECT  A.Username,A.FullName  FROM `Account` A
			JOIN GroupAccount GA ON A.AccountID = GA.AccountID
			WHERE GA.GroupID = 3;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau

			SELECT  A.Username,A.FullName  FROM `Account` A
			JOIN GroupAccount GA ON A.AccountID = GA.AccountID
			WHERE GA.GroupID = 1
            UNION
            SELECT  A.Username,A.FullName  FROM `Account` A
			JOIN GroupAccount GA ON A.AccountID = GA.AccountID
			WHERE GA.GroupID = 3;
            
-- * Question 18:
				-- a) Lấy các group có lớn hơn 5 thành viên
				-- b) Lấy các group có nhỏ hơn 7 thành viên
				-- c) Ghép 2 kết quả từ câu a) và câu b)
            
-- a) Lấy các group có lớn hơn 5 thành viên    

				SELECT G.GroupID, G.GroupName, count(GA.GroupID) as SL
				From GroupAccount GA
				JOIN `Group` G ON GA.GroupID = G.GroupID
				GROUP BY G.GroupID
				HAVING SL >= 5;
                
                
-- b) Lấy các group có nhỏ hơn 7 thành viên

				SELECT G.GroupID, G.GroupName, count(GA.GroupID) as SL
				From GroupAccount GA
				JOIN `Group` G ON GA.GroupID = G.GroupID
				GROUP BY G.GroupID
				HAVING SL <= 7;
                
-- c) Ghép 2 kết quả từ câu a) và câu b)

				SELECT G.GroupID, G.GroupName, count(GA.GroupID) as SL
				From GroupAccount GA
				JOIN `Group` G ON GA.GroupID = G.GroupID
				GROUP BY G.GroupID
				HAVING SL >= 5
                UNION
                SELECT G.GroupID, G.GroupName, count(GA.GroupID) as SL
				From GroupAccount GA
				JOIN `Group` G ON GA.GroupID = G.GroupID
				GROUP BY G.GroupID
				HAVING SL <= 7;
                
     
            