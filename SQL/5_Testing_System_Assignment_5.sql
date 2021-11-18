USE Testing_System_Assignment_4;


-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
          DROP VIEW IF EXISTS List_NV_Sale;
          
			CREATE VIEW List_NV_Sale AS
						SELECT A.*, D.DepartmentName
						FROM `Account` A
						INNER JOIN  Department D ON A.DepartmentID = D.DepartmentID
						WHERE D.DepartmentName = 'Sale';
				
			SELECT *
			FROM List_NV_Sale;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
					DROP VIEW IF EXISTS Info_Acc;
                    
					CREATE VIEW Info_Acc AS
					SELECT A.FullName, A.UserName,count(GA.AccountID) AS SL_ThamGia
					FROM GroupAccount GA
					JOIN `Account` A  ON GA.AccountID = A.AccountID
					GROUP BY GA.AccountID 
					HAVING count(GA.AccountID) = (SELECT MAX(SL) AS Max_SL
									  FROM (
                                      SELECT count(GA.AccountID ) AS SL
                                      FROM GroupAccount GA
                                      GROUP BY  GA.AccountID ) AS MAXcount
                                      );
					SELECT *
					FROM Info_Acc;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi	

			 DROP VIEW IF EXISTS Content_Hon_30tu;
             
				CREATE VIEW Content_Hon_30tu AS
                SELECT Q.QuestionID, Q.Content
                FROM Question Q
                WHERE LENGTH(Content) > 30;
                
                SELECT*
                FROM Content_Hon_30tu;
                

-- 	Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
				DROP VIEW IF EXISTS NVphongban_nhieunhat;
                
				CREATE VIEW NVphongban_nhieunhat AS
			
                SELECT D.DepartmentName, count(A.DepartmentID) AS SLg
				FROM `Account` A
				INNER JOIN Department D ON D.DepartmentID = A.DepartmentID
				GROUP BY A.DepartmentID
				HAVING count(A.DepartmentID) = (SELECT MAX(SLgPhongban) AS MaxSLgPhongban FROM
				(SELECT count(A.DepartmentID) AS SLgPhongban FROM `Account` A
				GROUP BY A.DepartmentID) AS Count_Dep_ID);
                
				SELECT * FROM NVphongban_nhieunhat ;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
				
				DROP VIEW IF EXISTS Question_From_User_Nguyen;
                
                CREATE VIEW  Question_From_User_Nguyen AS
				SELECT Q.CategoryID, Q.Content, A.FullName AS Creator 
                FROM Question Q
				INNER JOIN `Account` A ON A.AccountID = Q.CreatorID
				WHERE SUBSTRING_INDEX( A.FullName, ' ', 1 ) = 'Nguyen';
                
				SELECT * FROM Question_From_User_Nguyen;


