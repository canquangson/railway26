DROP DATABASE IF EXISTS Testing_System_Assignment_3;

CREATE DATABASE Testing_System_Assignment_3;

USE Testing_System_Assignment_3;

CREATE TABLE department(
	department_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    department_name		VARCHAR(50) NOT NULL UNIQUE KEY 
    );

CREATE TABLE `position` (
	position_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    position_name		VARCHAR(30) NOT NULL UNIQUE KEY 
);

CREATE TABLE `account`(
	account_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email				VARCHAR(50) NOT NULL  ,
    username			VARCHAR(50) NOT NULL  ,
    fullname			VARCHAR(100) NOT NULL  ,
    department_id		TINYINT UNSIGNED NOT NULL,
    position_id			TINYINT UNSIGNED,
    create_date			DATETIME DEFAULT NOW(),
    FOREIGN KEY (department_id) REFERENCES department (department_id),
    FOREIGN KEY (position_id) REFERENCES `position` (position_id)
    );
    

CREATE TABLE `group`(
	group_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    group_name			VARCHAR(50) UNIQUE NOT NULL,
    creator_id			SMALLINT UNSIGNED NOT NULL,
    create_date			DATETIME DEFAULT NOW()
    );
    

CREATE TABLE groupaccount(
	group_id			TINYINT UNSIGNED NOT NULL,
    account_id			SMALLINT	UNSIGNED NOT NULL,
    join_date			DATETIME DEFAULT NOW(),
    PRIMARY KEY (group_id, account_id),
	FOREIGN KEY (group_id) REFERENCES `group` (group_id),
    FOREIGN KEY (account_id) REFERENCES `account` (account_id)
    );


CREATE TABLE typequestion (
	type_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_name			ENUM ('easay','multiple-choice') NOT NULL 
);

CREATE TABLE categoryquestion (
	category_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name		VARCHAR(50) NOT NULL
);

CREATE TABLE question (
	questionid			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content				VARCHAR(500) UNIQUE NOT NULL CHECK (length(content)>1),
    category_id			TINYINT UNSIGNED  NOT NULL,
    type_id				TINYINT UNSIGNED  NOT NULL,
    creator_id			SMALLINT UNSIGNED NOT NULL,
    createdate			DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES categoryquestion (category_id),
    FOREIGN KEY (type_id) REFERENCES typequestion (type_id)
    );
    

CREATE TABLE answer (
	answer_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
    content				VARCHAR(200) UNIQUE NULL ,
    questionid			SMALLINT UNSIGNED NOT NULL,  
    iscorrect			ENUM ('True','False') NOT NULL,
    FOREIGN KEY (questionid) REFERENCES question (questionid)
    );

CREATE TABLE exam (
	exam_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`				VARCHAR(20) UNIQUE NOT NULL,
    tittle				VARCHAR(50) UNIQUE NOT NULL ,
    category_id			TINYINT UNSIGNED NOT NULL,
    creator_id			SMALLINT UNSIGNED NOT NULL,
    duration			TINYINT UNSIGNED NOT NULL CHECK ( duration >= 15 AND duration <= 160 ),
    createdate			DATETIME DEFAULT NOW()
    );

CREATE TABLE examquestion (
	exam_id				TINYINT UNSIGNED NOT NULL ,
    questionid			SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
    FOREIGN KEY (questionid) REFERENCES question (questionid),
    PRIMARY KEY (exam_id,questionid)
    );