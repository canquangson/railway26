DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
DepartmentID TINYINT AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS  `Position`;
CREATE TABLE `Position` (
PositionID TINYINT AUTO_INCREMENT PRIMARY KEY,
PositionName ENUM ("DEV","TEST","SCRUM MASTER","PM")
);
DROP TABLE IF EXISTS  `Account`;
CREATE TABLE `Account` (
AccountID TINYINT AUTO_INCREMENT PRIMARY KEY,
Email NVARCHAR(50) NOT NULL UNIQUE KEY,
Username NVARCHAR(50) NOT NULL UNIQUE KEY,
Fullname NVARCHAR(50),
DepartmentID TINYINT,
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
PositionID TINYINT,
FOREIGN KEY (PositionID) REFERENCES Position (PositionID) ON DELETE CASCADE,
Createdate DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS  `Group`;
CREATE TABLE `Group`(
GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
CreatorID TINYINT,
CreateDate DATETIME DEFAULT NOW()
);

DROP TABLE IF EXISTS  GroupAccount;
CREATE TABLE GroupAccount (
GroupID TINYINT AUTO_INCREMENT NOT NULL,
AccountID TINYINT NOT NULL,
JoinDate DATE,
FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);
DROP TABLE IF EXISTS  TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID TINYINT AUTO_INCREMENT PRIMARY KEY,
TypeName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS  CategoryQuestion;
CREATE TABLE CategoryQuestion(
CategoryID TINYINT AUTO_INCREMENT PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS  Question;
CREATE TABLE Question(
QuestionID smallint AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(100),
CategoryID TINYINT,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
TypeID TINYINT,
FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
CreatorID TINYINT,
FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID),
CreateDate DATETIME DEFAULT NOW()
);
DROP TABLE IF EXISTS  Answer;
CREATE TABLE Answer(
AnswerID TINYINT AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(100),
QuestionID smallint,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
isCorrect ENUM ("true","false")
);
DROP TABLE IF EXISTS  Exam;
CREATE TABLE Exam(
ExamID TINYINT AUTO_INCREMENT PRIMARY KEY ,
`Code` INT,
Title NVARCHAR(50) NOT NULL UNIQUE KEY,
CategoryID TINYINT,
CreatorID TINYINT ,
Duration TIME,
CreateDate DATETIME DEFAULT NOW()
);
DROP TABLE IF EXISTS  ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID TINYINT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
QuestionID smallint ,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);


-- INSERT --

-- INSERT --
INSERT INTO Department (DepartmentName)
VALUES					("Sale"),
						("Marketing"),
						("Tuyen Dung"),
                        ("Dao Tao"),
                        ("Nhan Su"),
                        ("CSKH"),                                                           
                        ("Giam Doc"),
                        ("Quan Ly"),
                        ("Bao Ve"),
                        ("Tap Vu");


INSERT INTO `Position` (PositionName)
VALUES					("Dev" ),
						("Test"),
						("Scrum Master"),
						("PM" );


INSERT INTO `Account` (Email, Username, Fullname, DepartmentID, PositionID, Createdate )
VALUES					("A@gmail.com" ,"A","NguyenVanA","1","1","20211101"),
						("B@gmail.com" ,"B","NguyenVanB","2","2","20211102"),
                        ("C@gmail.com" ,"C","NguyenVanC","2","3","20211103"),
                        ("D@gmail.com" ,"D","NguyenVanD","4","4","20211104"),
                        ("E@gmail.com" ,"E","NguyenVanE","5","1","20211105"),
                        ("F@gmail.com" ,"F","NguyenVanF","6","2","20211106"),
                        ("G@gmail.com" ,"G","NguyenVanG","7","3","20211107"),
                        ("H@gmail.com" ,"H","NguyenVanH","8","1","20211108"),
                        ("I@gmail.com" ,"I","NguyenVanI","9","1","20211109"),
                        ("K@gmail.com" ,"K","NguyenVanK","10","1","20211110")
						;	

INSERT INTO `Group` (GroupName, CreatorID )
VALUES 				('Group1',		1),
					('Group2',		2),
					('Group3',		3),	  
					('Group4',		4),
					('Group5',		5),
					('Group6',		6),
					('Group7',		7),
					('Group8',		8),
                    ('Group9',		9),
                    ('Group10',		10)
                    ;
                    

INSERT INTO GroupAccount (GroupID, AccountID )
VALUES 				(1 ,		2),
					(2 ,		4),
                    (3 ,		2),
                    (4 ,		5),
                    (5 ,		6),
                    (6 ,		3),
                    (7 ,		8),
                    (8 ,		1),
                    (9 ,		3),
                    (1 ,		4)
                    ;
           
INSERT INTO TypeQuestion  (TypeName )
VALUES 				('Essay' ),
					('Multiple-Choice' )
                    ;
			

INSERT INTO CategoryQuestion (CategoryName )
VALUES 				('Java' ),
					('PHP' ),
					('Jquery' ),
					('SQL' ),
					('Postman' ),
					('Ruby' ),
					('Python' ),
					('C++' ),
					('C Sharp' ),
					('Frontend' )
                    ;
                    
INSERT INTO Question (Content , CategoryID, TypeID , CreatorID )
VALUES 				("Câu hỏi về Java", 1, 1, 1 ),
					("Câu hỏi về PHP", 2, 2, 2 ),
					("Câu hỏi về Jquery", 3, 2, 3 ),
                    ("Câu hỏi về SQL", 4, 1, 4 ),
                    ("Câu hỏi về Postman", 5, 2, 5 ),
                    ("Câu hỏi về Ruby", 6, 1, 6 ),
                    ("Câu hỏi về Python", 7, 2, 7 ),
                    ("Câu hỏi về C++", 8, 1, 8 ),
                    ("Câu hỏi về C Sharp", 8, 2, 9 ),
                    ("Câu hỏi về Frontend", 10, 1, 10 )
                    ;
INSERT INTO Answer ( Content , QuestionID , isCorrect )
VALUES				( "Tra loi 1 !", 1 , 'True' ),
					( "Tra loi 2 !", 1 , 'False' ),
                    ( "Tra loi 3 !", 1 , 'True' ),
                    ( "Tra loi 4 !", 1 , 'False' ),
                    ( "Tra loi 5 !", 1 , 'True' ),
                    ( "Tra loi 6 !", 1 , 'True' ),
                    ( "Tra loi 7 !", 1 , 'False' ),
                    ( "Tra loi 8 !", 1 , 'True' ),
                    ( "Tra loi 9 !", 1 , 'False' ),
					( "Tra loi 10 !", 1 , 'True' )
                    ;


INSERT INTO Exam 	( `Code` , Title , CategoryID,  CreatorID, Duration )
VALUES				('VTI01', 'Đề thi Java', 3, 5,	120),
					('VTI02', 'Đề thi PHP', 3, 5,	120),
                    ('VTI03', 'Đề thi SQL', 3, 5,	120),
                    ('VTI04', 'Đề thi Jquery', 3, 5,	120),
                    ('VTI05', 'Đề thi Postman', 3, 5,	120),
                    ('VTI06', 'Đề thi Ruby', 3, 5,	120),
                    ('VTI07', 'Đề thi Python', 3, 5,	120),
                    ('VTI08', 'Đề thi C++', 3, 5,	120),
                    ('VTI09', 'Đề thi C Sharp', 3, 5,	120),
                    ('VTI10', 'Đề thi Frontend', 3, 5,	120)
					;


INSERT INTO ExamQuestion ( ExamID , QuestionID )
VALUES				(1	,		1),
					(1	,		2),
					(2	,		3),
					(3	,		2),
					(4	,		20),
					(5	,		19),
					(6	,		10);
					;

