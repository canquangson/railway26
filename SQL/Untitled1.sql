use Testing_System_Assignment_3;
-- INSERT --
INSERT INTO department (department_name)
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


INSERT INTO `position` (position_name)
VALUES					("Dev" ),
						("Test"),
						("Scrum Master"),
						("PM" );


INSERT INTO `account` (email, username, fullname, department_id, position_id, create_date)
VALUES					("A@gmail.com" ,"A","NguyenVanA","1","1","20211101"),
						("B@gmail.com" ,"B","NguyenVanB","1","2","20211102"),
                        ("C@gmail.com" ,"C","NguyenVanC","1","3","20211103"),
                        ("D@gmail.com" ,"D","NguyenVanD","1","4","20211104"),
                        ("E@gmail.com" ,"E","NguyenVanE","1","1","20211105"),
                        ("F@gmail.com" ,"F","NguyenVanF","1","2","20211106"),
                        ("G@gmail.com" ,"G","NguyenVanG","1","3","20211107"),
                        ("H@gmail.com" ,"H","NguyenVanH","1","1","20211108"),
                        ("I@gmail.com" ,"I","NguyenVanI","1","1","20211109"),
                        ("K@gmail.com" ,"K","NguyenVanK","1","1","20211110")
						;	

INSERT INTO `group` (group_name, creator_id )
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
                    

INSERT INTO groupaccount (group_id, account_id )
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
           
INSERT INTO typequestion (type_name )
VALUES 				('Essay' ),
					('Multiple-Choice' )
                    ;
			

INSERT INTO categoryquestion (category_name )
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
                    
INSERT INTO question (content , category_id, type_id , creator_id )
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
INSERT INTO answer ( content , questionid , iscorrect )
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


INSERT INTO exam 	( `code` , tittle , category_id,  creator_id, duration )
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


INSERT INTO examquestion ( exam_id , questionid )
VALUES				(1	,		1),
					(1	,		2),
					(2	,		3),
					(3	,		2),
					(4	,		20),
					(5	,		19),
					(6	,		10);
					;
