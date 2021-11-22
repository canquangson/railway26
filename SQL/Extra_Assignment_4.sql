DROP DATABASE IF EXISTS Extra_Assignment_4;
CREATE DATABASE Extra_Assignment_4;
USE Extra_Assignment_4;


-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
			Department_Number TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Department_Name NVARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE Employee_Table(
			Employee_Number TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
			Employee_Name NVARCHAR(30) NOT NULL UNIQUE KEY,
            Department_Number TINYINT UNSIGNED,
            FOREIGN KEY(Department_Number) REFERENCES Department(Department_Number)		
);

DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table(
			Employee_Number TINYINT UNSIGNED ,
			SkillCode  VARCHAR(20) NOT NULL UNIQUE KEY,
           DateRegistered DATE,
           FOREIGN KEY(Employee_Number) REFERENCES Employee_Table(Employee_Number)           
);

-- Question 2: Thêm ít nhất 10 bản ghi vào table

INSERT INTO Department(Department_Number,Department_Name )
VALUES
				(1,'Giam Doc' ),
				(2,'Sale' ),
				(3,'Marketing' ),
				(4,'HR' ),
				(5,'Technology' ),
				(6,'Tai Chinh' ),
				(7,'Thu Ki'),
				(8,'CSKH' ),
				(9,'Dao Tao' ),
				(10,'Waiting Room' );
                
 INSERT INTO Employee_Table (Employee_Number ,Employee_Name ,  Department_Number )
VALUES 
				(1 ,'An' , 1),

				(2 ,'Binh' , '2'),

				(3 , 'Long' ,'7' ),

				(4 , 'Dang' , '4'),

				(5 , 'Anh' , '8'),

				(6, 'Phuc', '3' ),

				(7 , 'Tu' ,'2'  ),
                
				(8 , 'Hue',  '6' ),

				(9 , 'Ngoc',  '2' ),
                
				(10 , 'Dung' , '3' );
               

               
 INSERT INTO Employee_Skill_Table (Employee_Number ,SkillCode ,  DateRegistered )
VALUES 
					(1, "Java", 20201119),
					(2, 'PP', 20200109),
                    (3, "C", 20211008),
                    (4,  'PH', 20191014),
                    (1, 'Python', 20191119),
                    (6, "J", 20200713),
                    (7,  'PHP', 20211012),
                    (8, "Jva", 20210819),
                    (9,  'Pyton', 20211201),
                    (10, "ava", 20210118);
                    
                    
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java 
--          Hướng dẫn: sử dụng UNION

SELECT 	ET.*, EST.SkillCode 
FROM	Employee_Table ET 
JOIN 	Employee_Skill_Table EST
ON		ET.Employee_Number = EST.Employee_Number
WHERE	EST.SkillCode = 'Java';


-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT D.Department_Number, D.Department_Name, COUNT(ET.Department_Number)AS SLNV
FROM Department D
JOIN Employee_Table ET ON D.Department_Number = ET.Department_Number
GROUP BY  D.Department_Number
HAVING COUNT(ET.Department_Number) >=2;



-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.

SELECT ET.*, D.Department_Name
FROM Department D
JOIN Employee_Table ET ON ET.Department_Number = D.Department_Number
ORDER BY	D.Department_Number ASC;


-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.

SELECT 		ET.*, COUNT(EST.Employee_Number) as Slg_Skill
FROM		Employee_Table ET 
RIGHT JOIN Employee_Skill_Table EST
ON			ET.Employee_Number = EST.Employee_Number
GROUP BY	ET.Employee_Number
HAVING 		COUNT(EST.Employee_Number)>1;
