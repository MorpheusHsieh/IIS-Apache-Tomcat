--    該 SQL DDL 指令碼由 Visio Enterprise(發佈日期: LOCAL BUILD)產生。

--    所用驅動程式: Visio Enterprise - Microsoft Access 驅動程式。
--    文件    : D:\MyWeb\繪圖3。
--    建立時間: 2001年9月13日 10:23 上午。
--    操作   : 從 Visio 產生精靈。
--    已連線的資料來源: MS Access Database
--    已連線的伺服器: ACCESS
--    已連線的資料庫: C:\jakarta-tomcat-3.2.3\webapps\SoftTest\Fpdb\丙級軟體應用.MDB



-- 建立新表 `ExamPaper`。
-- `ExamPaper` : Table of ExamPaper
-- 	`SerialNo` : SerialNo 識別 ExamPaper
-- 	`Name` : Name 屬於 ExamPaper
-- 	`TF_Title` : TF_Title 屬於 ExamPaper
-- 	`OptTitle` : OptTitle 屬於 ExamPaper  
create table `ExamPaper` ( 
	`SerialNo` CHAR(10),
	`Name` VARCHAR(10),
	`TF_Title` VARCHAR(255),
	`OptTitle` VARCHAR(255), constraint `ExamPaper_PK` primary key (`SerialNo`) ); 

-- Note: Access does not support the creation of mandatory ( not null ) constraint using SQL
-- create table construct for table `ExamPaper`. The constraint will only be created using DAO
-- if you have connection to the Access MDB file during DDL generation.
--   表 'ExamPaper' 為不可空行。
--     `SerialNo`


-- 建立新表 `TrueFalseTest`。
-- `TrueFalseTest` : Table of TrueFalseTest
-- 	`TF_Title` : TF_Title 識別 TrueFalseTest
-- 	`TF_Answer` : 1-->O, 0-->X  
create table `TrueFalseTest` ( 
	`TF_Title` VARCHAR(255),
	`TF_Answer` SMALLINT, constraint `PrimaryKey` primary key (`TF_Title`) ); 

-- Note: Access does not support the creation of mandatory ( not null ) constraint using SQL
-- create table construct for table `TrueFalseTest`. The constraint will only be created using DAO
-- if you have connection to the Access MDB file during DDL generation.
--   表 'TrueFalseTest' 為不可空行。
--     `TF_Title`
--     `TF_Answer`


-- 建立新表 `OptionTest`。
-- `OptionTest` : Table of OptionTest
-- 	`OptTitle` : OptTitle 部分識別 OptionTest
-- 	`OptAnswer` : OptAnswer 屬於 OptionTest
-- 	`OptSelect01` : OptSelect01 屬於 OptionTest
-- 	`OptSelect02` : OptSelect02 屬於 OptionTest
-- 	`OptSelect03` : OptSelect03 屬於 OptionTest
-- 	`OptSelect04` : OptSelect04 屬於 OptionTest  
create table `OptionTest` ( 
	`OptTitle` VARCHAR(255),
	`OptAnswer` SMALLINT,
	`OptSelect01` VARCHAR(255),
	`OptSelect02` VARCHAR(255),
	`OptSelect03` VARCHAR(255),
	`OptSelect04` VARCHAR(255), constraint `PrimaryKey` primary key (`OptTitle`) ); 

-- Note: Access does not support the creation of mandatory ( not null ) constraint using SQL
-- create table construct for table `OptionTest`. The constraint will only be created using DAO
-- if you have connection to the Access MDB file during DDL generation.
--   表 'OptionTest' 為不可空行。
--     `OptTitle`
--     `OptAnswer`


-- 建立新表 `Score`。
-- `Score` : Table of Score
-- 	`Name` : Name 識別 Score
-- 	`Score01` : Score01 屬於 Score
-- 	`Score02` : Score02 屬於 Score
-- 	`Score03` : Score03 屬於 Score
-- 	`TestDate` : TestDate 屬於 Score  
create table `Score` ( 
	`Name` VARCHAR(10),
	`Score01` SMALLINT,
	`Score02` SMALLINT,
	`Score03` SMALLINT,
	`TestDate` DATETIME, constraint `PrimaryKey` primary key (`Name`) ); 

-- Note: Access does not support the creation of mandatory ( not null ) constraint using SQL
-- create table construct for table `Score`. The constraint will only be created using DAO
-- if you have connection to the Access MDB file during DDL generation.
--   表 'Score' 為不可空行。
--     `Name`


-- 向表 `ExamPaper` 新增外鍵限制。
alter table `ExamPaper`
	add constraint `Score_ExamPaper_FK1` foreign key (
		`Name`)
	 references `Score` (
		`Name`); 

alter table `ExamPaper`
	add constraint `TrueFalseTest_ExamPaper_FK1` foreign key (
		`TF_Title`)
	 references `TrueFalseTest` (
		`TF_Title`); 

alter table `ExamPaper`
	add constraint `OptionTest_ExamPaper_FK1` foreign key (
		`OptTitle`)
	 references `OptionTest` (
		`OptTitle`); 


-- 這是 Visio Enterprise 產生的 SQL DDL 指令碼的末尾。
