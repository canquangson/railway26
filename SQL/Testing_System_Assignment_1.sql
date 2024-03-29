DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1;

CREATE TABLE Department (
DepartmentID TINYINT AUTO_INCREMENT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

CREATE TABLE Position (
PositionID TINYINT AUTO_INCREMENT PRIMARY KEY,
PositionName NVARCHAR(50) NOT NULL
);

CREATE TABLE `Account` (
AccountID TINYINT AUTO_INCREMENT PRIMARY KEY,
Email NVARCHAR(10)NOT NULL,
Username NVARCHAR(50)NOT NULL,
Fullname NVARCHAR(50),
DepartmentID TINYINT,
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
PositionID TINYINT,
FOREIGN KEY (PositionID) REFERENCES Position (PositionID),
Createdate DATE
);

CREATE TABLE `Group`(
GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
GroupName VARCHAR(50),
CreatorID TINYINT,
CreateDate DATE
);

CREATE TABLE GroupAccount (
GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY (GROUPID) REFERENCES `Group`(GroupID),
AccountID TINYINT,
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID),
JoinDate DATE
);

CREATE TABLE TypeQuestion (
TypeID TINYINT AUTO_INCREMENT PRIMARY KEY,
TypeName VARCHAR(50)
);

CREATE TABLE CategoryQuestion(
CategoryID TINYINT AUTO_INCREMENT PRIMARY KEY,
CategoryName VARCHAR(50)
);

CREATE TABLE Question(
QuestionID smallint AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(50),
CategoryID TINYINT,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
TypeID TINYINT,
FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
CreatorID TINYINT,
FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID),
CreateDate DATE
);

CREATE TABLE Answer(
AnswerID TINYINT AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(50),
QuestionID smallint,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
isCorrect ENUM ("true","false")
);

CREATE TABLE Exam(
ExamID TINYINT AUTO_INCREMENT PRIMARY KEY ,
Codee INT,
Title VARCHAR(50),
CategoryID TINYINT,
Duration TIME,
CreatorID TINYINT ,
CreateDate DATE
);

CREATE TABLE ExamQuestion(
ExamID TINYINT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
QuestionID smallint ,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);