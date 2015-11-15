/*
Mrs. Iyabowale Oluwafunmilayo ONIKO
Mrs. Rukky DOYIN-SALAU
0139865690
Dreamweaver $485 ==> By Olamide
Website Template $110
Asp.Net Report Maker $180
Paypal API Payment Gateway $100
Domain + Hosting $540
SMS API [5000units @ N1.75 per SMS] N9,250 approx. N10,000
Token Generation [$45 per 250]
System Upgrade & Internet = N43,000 ==> By Olamide
PIN = ctrl end
*/

/**
TO do
View Minimum score/class,term,session
View Maximum score/class,term,session
*/

CREATE DATABASE pupilate;
USE pupilate;

CREATE TABLE User_Session
(
	cCode INT NOT NULL AUTO_INCREMENT,
	cUserName VARCHAR(100) NULL,
	dLogIn datetime NULL,
	PRIMARY KEY (cCode)
);

CREATE TABLE StateCode
(
	cCode INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(100) NULL,
	cAbbr VARCHAR(10) NULL,
	PRIMARY KEY (cCode)
);

INSERT INTO StateCode (cName, cAbbr) VALUES('Abia', 'ABI');
INSERT INTO StateCode (cName, cAbbr) VALUES('Adamawa', 'ADA');
INSERT INTO StateCode (cName, cAbbr) VALUES('Akwa Ibom', 'AKI');
INSERT INTO StateCode (cName, cAbbr) VALUES('Anambra', 'ANA');
INSERT INTO StateCode (cName, cAbbr) VALUES('Bauchi', 'BAU');
INSERT INTO StateCode (cName, cAbbr) VALUES('Bayelsa', 'BAY');
INSERT INTO StateCode (cName, cAbbr) VALUES('Benue', 'BEN');
INSERT INTO StateCode (cName, cAbbr) VALUES('Borno', 'BOR');
INSERT INTO StateCode (cName, cAbbr) VALUES('Cross River', 'CRR');
INSERT INTO StateCode (cName, cAbbr) VALUES('Delta', 'DEL');
INSERT INTO StateCode (cName, cAbbr) VALUES('Ebonyi', 'EBO');
INSERT INTO StateCode (cName, cAbbr) VALUES('Edo', 'EDO');
INSERT INTO StateCode (cName, cAbbr) VALUES('Ekiti', 'EKT');
INSERT INTO StateCode (cName, cAbbr) VALUES('Enugu', 'ENU');
INSERT INTO StateCode (cName, cAbbr) VALUES('FCT', 'FCT');
INSERT INTO StateCode (cName, cAbbr) VALUES('Gombe', 'GOM');
INSERT INTO StateCode (cName, cAbbr) VALUES('Imo', 'IMO');
INSERT INTO StateCode (cName, cAbbr) VALUES('Jigawa', 'JIG');
INSERT INTO StateCode (cName, cAbbr) VALUES('Kaduna', 'KAD');
INSERT INTO StateCode (cName, cAbbr) VALUES('Kano', 'KAN');
INSERT INTO StateCode (cName, cAbbr) VALUES('Katsina', 'KAT');
INSERT INTO StateCode (cName, cAbbr) VALUES('Kebbi', 'KEB');
INSERT INTO StateCode (cName, cAbbr) VALUES('Kogi', 'KOG');
INSERT INTO StateCode (cName, cAbbr) VALUES('Kwara', 'KWA');
INSERT INTO StateCode (cName, cAbbr) VALUES('Lagos', 'LAG');
INSERT INTO StateCode (cName, cAbbr) VALUES('Nassarawa', 'NAS');
INSERT INTO StateCode (cName, cAbbr) VALUES('Niger', 'NIG');
INSERT INTO StateCode (cName, cAbbr) VALUES('Ogun', 'OGU');
INSERT INTO StateCode (cName, cAbbr) VALUES('Ondo', 'OND');
INSERT INTO StateCode (cName, cAbbr) VALUES('Osun', 'OSU');
INSERT INTO StateCode (cName, cAbbr) VALUES('Oyo', 'OYO');
INSERT INTO StateCode (cName, cAbbr) VALUES('Plateau', 'PLA');
INSERT INTO StateCode (cName, cAbbr) VALUES('Rivers', 'RIV');
INSERT INTO StateCode (cName, cAbbr) VALUES('Sokoto', 'SOK');
INSERT INTO StateCode (cName, cAbbr) VALUES('Taraba', 'TAR');
INSERT INTO StateCode (cName, cAbbr) VALUES('Yobe', 'YOB');
INSERT INTO StateCode (cName, cAbbr) VALUES('Zamfara', 'ZAM');

CREATE TABLE pAccessCard
(
	cID INT NOT NULL AUTO_INCREMENT,
    cPin VARCHAR(50) NOT NULL,
    cType VARCHAR(10) NOT NULL, /*Term, Session*/
    cStatus VARCHAR(10) NOT NULL DEFAULT 'Unused', /*Used or Unused*/
    cUser VARCHAR(20) NOT NULL DEFAULT 'Not Yet',
	dUsageDate DATE NULL,
    UNIQUE INDEX wondercard_UNIQUE (cPin),
    CONSTRAINT FK_pAccessCard FOREIGN KEY (cUser) REFERENCES userdetails(cName),
	PRIMARY KEY (cID)
);

CREATE TABLE Pin_Login
(
	cID INT NOT NULL AUTO_INCREMENT,
	cPin VARCHAR(50) NOT NULL,
	cUser VARCHAR(20) NOT NULL,
	dDate DATE NULL,
    CONSTRAINT PK_Pin_Login PRIMARY KEY (cID),
    CONSTRAINT FK_Pin_Login FOREIGN KEY (cPin) REFERENCES wondercard(cPin),
    CONSTRAINT FK_Pin_Login FOREIGN KEY (cUser) REFERENCES userdetails(cName)
);

CREATE TABLE UserDetails
(
	cID INT NOT NULL AUTO_INCREMENT,
	cPName VARCHAR(100) NOT NULL,
	cName VARCHAR(20) NOT NULL,
	cPass VARCHAR(20) NOT NULL,
	cType VARCHAR(20) NOT NULL,
	cStatus VARCHAR(20) NOT NULL,
    cSSRNo VARCHAR(20) NOT NULL,
	dExpiryDate DATE NOT NULL,
	cSecret VARCHAR(100) NOT NULL,
	cAnswer VARCHAR(20) NOT NULL,
    UNIQUE INDEX userDetails_UNIQUE (cName),
    PRIMARY KEY (cID)
);
/*If the cType != Admin, then the cSchoolCode will be the name of the database to be active*/
insert INTO UserDetails  (cPName, cName, cPass, cType, cStatus, dExpiryDate, cSecret, cAnswer) values 
('Olamide IJADUOLA', 'admin','admin','Admin','Active','2020/12/31','who be this','na me');

/*
	School Registration
	cSSRNo, cSName, cAddress, cState, cPhoneNo1, cPhoneNo2, cEmail, cWeb, iLogo, cRegDate
*/
CREATE TABLE reg_sch
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
    cSSRNo VARCHAR(20) NOT NULL,
    cSName VARCHAR(80) NOT NULL,
    cAddress VARCHAR(150) NOT NULL,
    cState INT NOT NULL,
    cPhoneNo1 VARCHAR(50) NOT NULL,
    cPhoneNo2 VARCHAR(50) NULL,
    cEmail VARCHAR(50) NULL,
    cWeb VARCHAR(50) NULL,
	iLogo VARCHAR(40) NULL,
	dRegDate DATE NULL,
    cType VARCHAR(40) NULL, /*Type of Package bought/subscribe to/in use*/
    UNIQUE INDEX reg_sch_auto_UNIQUE (AutoNo ASC),
    PRIMARY KEY (cSSRNo)
);
INSERT INTO reg_sch (cSSRNo, cSName, cAddress, cState, cPhoneNo1, cPhoneNo2, cEmail, cWeb, iLogo, dRegDate) VALUES ('OG/2010/765', 'Holythirst College','Onikolobo Abeokuta','22','+2348030765226','+2348091805221','holythirst@yahoo.com','www.holythirst.com','images/sch/OG/2010/765', current_date());

CREATE TABLE MySpace
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
    
);

CREATE TABLE History
(
	cID INT NOT NULL AUTO_INCREMENT,
	cHistory VARCHAR(3500) NULL,
    cSSRNo VARCHAR(20) NOT NULL,
	PRIMARY KEY (cID),
    CONSTRAINT FK_History_cSSRNo FOREIGN KEY (cSSRNo) REFERENCES reg_sch (cSSRNo)
);

CREATE TABLE reg_ses
(
	cID INT NOT NULL AUTO_INCREMENT,
	cSSRNo VARCHAR(20) NOT NULL,
	cFName VARCHAR(10) NOT NULL,
    dStart DATE NULL,
	dEnd DATE NULL,
    cStatus VARCHAR(10), /*Paid, Bonus, Default*/
    dExpire DATE NULL,
	PRIMARY KEY (cID),
    CONSTRAINT FK_reg_ses_cSSRNo FOREIGN KEY (cSSRNo) REFERENCES reg_sch (cSSRNo)
);
Insert Into reg_Ses(cSSRNo, dStart , dEnd , cFName) values ('', '2014/09/09','2015/09/07', '2014/2015');

CREATE TABLE SubjectGroup
(
	cID INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(20) NOT NULL,
	cDes VARCHAR(105) NULL,
    UNIQUE INDEX cName_UNIQUE (cName ASC),
	CONSTRAINT PK_SubGrp PRIMARY KEY (cID)
);
Insert Into subjectgroup(cName , cDes) values ('General','General for all classes');
Insert Into subjectgroup(cName , cDes) values ('Kindergarten','General For all Kindergarten');
Insert Into subjectgroup(cName , cDes) values ('Kindergarten 1','Specific for Kindergarten 1');
Insert Into subjectgroup(cName , cDes) values ('Kindergarten 2','Specific for Kindergarten 2');
Insert Into subjectgroup(cName , cDes) values ('Kindergarten 3','Specific for Kindergarten 3');
Insert Into subjectgroup(cName , cDes) values ('Nursery','General for all Nursery');
Insert Into subjectgroup(cName , cDes) values ('Nursery 1','Specific for Nursery 1');
Insert Into subjectgroup(cName , cDes) values ('Nursery 2','Specific for Nursery 2');
Insert Into subjectgroup(cName , cDes) values ('Nursery 3','Specific for Nursery 3');
Insert Into subjectgroup(cName , cDes) values ('Basic','General for all Basic classes');
Insert Into subjectgroup(cName , cDes) values ('Basic 1 - 6','Specific for Basic 1 - 6');
Insert Into subjectgroup(cName , cDes) values ('Basic 1','Specific for Basic 1');
Insert Into subjectgroup(cName , cDes) values ('Basic 2','Specific for Basic 2');
Insert Into subjectgroup(cName , cDes) values ('Basic 3','Specific for Basic 3');
Insert Into subjectgroup(cName , cDes) values ('Basic 4','Specific for Basic 4');
Insert Into subjectgroup(cName , cDes) values ('Basic 5','Specific for Basic 5');
Insert Into subjectgroup(cName , cDes) values ('Basic 6','Specific for Basic 6');
Insert Into subjectgroup(cName , cDes) values ('Basic 7 - 9','Specific for Basic 7 - 9');
Insert Into subjectgroup(cName , cDes) values ('Basic 7','Specific for Basic 7');
Insert Into subjectgroup(cName , cDes) values ('Basic 8','Specific for Basic 8');
Insert Into subjectgroup(cName , cDes) values ('Basic 9','Specific for Basic 9');
Insert Into subjectgroup(cName , cDes) values ('Senior High','General For all Senior High');
Insert Into subjectgroup(cName , cDes) values ('Sciences','Specific for Science classes of Senior High 7 - 9');
Insert Into subjectgroup(cName , cDes) values ('Commercial','Specific for Commercial classes of Senior High 7 - 9');
Insert Into subjectgroup(cName , cDes) values ('Arts','Specific for Arts classes of Senior High 7 - 9');
Insert Into subjectgroup(cName , cDes) values ('Senior High 1','Specific for Senior High 1');
Insert Into subjectgroup(cName , cDes) values ('Senior High 2','Specific for Senior High 2');
Insert Into subjectgroup(cName , cDes) values ('Senior High 3','Specific for Senior High 3');

/*
	Question Registration
	AutoNo, cSSRNo [Not Compulsory], cSubject, cClass, cTopic, cSubTopic, cTeacherID, cQuestion, iPix, cOpt1, cOpt2, cOpt3, cOpt4, cAns
*/
CREATE TABLE Questions
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
	cSSRNo VARCHAR(20) NULL,
	cSujbect VARCHAR(100) Not NULL,
	cClass VARCHAR(20) NOT NULL,
	cTopic VARCHAR(150) NOT NULL,
	cSubTopic VARCHAR(150) NOT NULL,
	cTeacherID VARCHAR(10) NOT NULL,
	cQuestion VARCHAR(200) NOT NULL,
	iPix BLOB NULL,
	cOpt1 VARCHAR(250) NOT NULL,
	cOpt2 VARCHAR(250) NOT NULL,
	cOpt3 VARCHAR(250) NOT NULL,
	cOpt4 VARCHAR(250) NOT NULL,
	cAns VARCHAR(5) NOT NULL,
	dRegDate DATE NULL,
    PRIMARY KEY (AutoNo),
    CONSTRAINT FK_Question_cSSRNo FOREIGN KEY (cSSRNo) REFERENCES reg_sch (cSSRNo)
);

CREATE TABLE Test
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
    cSSRNo VARCHAR(20) NOT NULL,
	cName VARCHAR(60) NULL,
	cSujbect VARCHAR(100) Not NULL,
	cClass VARCHAR(20) NOT NULL,
	cNoOfQ INT NOT NULL,
	cCorrect INT NOT NULL,
	cIncorrect INT NOT NULL,
	cTotalPercent DOUBLE NOT NULL,
	dTestDate DATE NOT NULL,
    PRIMARY KEY (AutoNo)
);

CREATE TABLE LoginLog
(
	cID INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(30) NULL,
	dDateIn DATE NULL,
	dDateOut DATE NULL,
	tTimeIn time NULL,
	tTimeOut time NULL,
    CONSTRAINT PK_LogDetails PRIMARY KEY (cID)
);

/*

SCHOOL CONTROLLED

*/
CREATE TABLE Subjects
(
	cID INT NOT NULL AUTO_INCREMENT,
    cSSRNo VARCHAR(20) NULL,
	cName VARCHAR(100) NULL,
	cCode VARCHAR(10) NULL,
    cSubGroup VARCHAR(20) NULL,
    CONSTRAINT PK_SubjecT PRIMARY KEY (cID),
	CONSTRAINT FK_SubjecT FOREIGN KEY (cSubGroup) References SubjectGroup (cName)
);

CREATE TABLE SchoolEvents
(
	cID INT NOT NULL AUTO_INCREMENT,
    cSSRNo VARCHAR(20) NULL,
	cName VARCHAR(100) NULL,
	dDATE DATE NULL,
	cCom VARCHAR(500) NOT NULL,
	CONSTRAINT PK_SchoolEvents PRIMARY KEY (cID)
);

CREATE TABLE reg_cla
(
	cID INT NOT NULL AUTO_INCREMENT,
	cSSRNo VARCHAR(20) NOT NULL,
    cSchool VARCHAR(12) NOT NULL, /*Kindagerten, Nursery, Basic, Primary, Junior, Senior, etc*/
	cWing VARCHAR(2) NOT NULL, /*A-Z*/
	cDep VARCHAR(15) NOT NULL, /*Science, Arts, etc.*/
	cFName VARCHAR(10) NOT NULL,
    cCurTeacher VARCHAR(15) NOT NULL,
    UNIQUE INDEX reg_cla_cID_UNIQUE (cID ASC),
	PRIMARY KEY (cFName)
);

CREATE TABLE reg_ses_cla
(
	cID INT NOT NULL AUTO_INCREMENT,
    cSSRNo VARCHAR(20) NOT NULL,
    cCName VARCHAR(10) NOT NULL,
	cSession VARCHAR(10) NOT NULL,
    cTID VARCHAR(15) NOT NULL, /*Class Teacher*/
	PRIMARY KEY (cID),
	CONSTRAINT FK_reg_ses_cla_cTID FOREIGN KEY (cTID) REFERENCES reg_tut (cTID)
);

CREATE TABLE ClubAss
(
	cID VARCHAR(15) NOT NULL,
	cName VARCHAR(50) NOT NULL,
	cDes VARCHAR(70) NULL,
    UNIQUE INDEX cName_UNIQUE (cName ASC),
	PRIMARY KEY (cID)
);

CREATE TABLE ClubAssMem
(
	cID INT NOT NULL AUTO_INCREMENT,
	cClub VARCHAR(50) NOT NULL,
	cSEID VARCHAR(15) NULL, /*Student or Employee ID*/
	cName VARCHAR(50) NULL,
	cType VARCHAR(20) NULL, /*Student or Employee*/
	PRIMARY KEY (cID),
    CONSTRAINT FK_ClubAssMem FOREIGN KEY (cClub) REFERENCES ClubAss (cName)
);

CREATE TABLE Department
(
	cID VARCHAR(15) NOT NULL,
	cName VARCHAR(50) NOT NULL,
	cDes VARCHAR(105) NULL,
	PRIMARY KEY (cName)
);

CREATE TABLE DepMem
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NULL,
	cDep VARCHAR(50) NULL,
	cType VARCHAR(20) NULL,
	cStatus VARCHAR(10) NULL,
    UNIQUE INDEX cEID_UNIQUE (cEID ASC),
	PRIMARY KEY (cID),
	CONSTRAINT FK_DepMem FOREIGN KEY (cDep) REFERENCES Department (cName),
    CONSTRAINT FK_DepMem2 FOREIGN KEY (cEID) REFERENCES reg_emp (cEID)
);

CREATE TABLE Class_ST /* Class Term/Session Subject*/
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
    cClass VARCHAR(10) NOT NULL,
    cSession VARCHAR(10) NOT NULL,
    cTerm VARCHAR(10) NOT NULL,
    cSubjects VARCHAR(500) NULL,
    PRIMARY KEY (AutoNo),
    CONSTRAINT FK_Class_ST FOREIGN KEY (cClass) REFERENCES reg_cla (cFName)
);

CREATE TABLE Posts
(
	cID INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(50) NOT NULL,
	cAbbr VARCHAR(10) NULL,
	cDes VARCHAR(105) NULL,
    cSSRNo VARCHAR(20) NOT NULL,
    UNIQUE INDEX cNamePosts_UNIQUE (cName ASC),
	PRIMARY KEY (cID)
);

CREATE TABLE reg_emp /*Staff Registration*/
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NOT NULL,
	cSName VARCHAR(20) NULL,
	cFName VARCHAR(20) NULL,
	cOName VARCHAR(20) NULL,
	cSSRNo VARCHAR(20) NOT NULL,
    cSex VARCHAR(10) NULL,
	dDOB DATE NULL,
	cState VARCHAR(20) NULL,
	cHAddress VARCHAR(100) NULL,
	cPhone VARCHAR(30) NULL,
    cEmail VARCHAR(70) NULL,
	cMTongue VARCHAR(20) NULL,
	cDis VARCHAR(30) NULL,
    dDOA DATE NULL,
	cPAI VARCHAR(50) NULL,
	cCurPost VARCHAR(50) NULL,
    cStatus VARCHAR(15) NULL DEFAULT 'Active',
	cRefName VARCHAR(50) NULL,
	cRefPhone VARCHAR(30) NULL,
	cRefAdd VARCHAR(100) NULL,
	iPass VARCHAR(100) NULL,
    UNIQUE INDEX cEID_reg_emp_UNIQUE (cEID ASC),
	PRIMARY KEY (AutoNo),
    CONSTRAINT FK_reg_emp_cSSRNo FOREIGN KEY (cSSRNo) REFERENCES reg_sch (cSSRNo)
);

CREATE TABLE reg_tut /*General Teacher/tutor Registration*/
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NULL,
	cSSRNo VARCHAR(20) NOT NULL,
	cStatus VARCHAR(15) NULL,/*Active/Not Active*/
	PRIMARY KEY (cID),
    CONSTRAINT FK_reg_tut_cSSRNo FOREIGN KEY (cSSRNo) REFERENCES reg_sch (cSSRNo),
    CONSTRAINT FK_reg_tut_cEID FOREIGN KEY (cSSRNo) REFERENCES reg_emp (cEID)
);

CREATE TABLE reg_cls_tut /*Class Teacher Registration*/
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NULL,
	cSSRNo VARCHAR(20) NOT NULL,
    cClass VARCHAR(30) NULL,
	cSession VARCHAR(10) NULL,
	cTerm VARCHAR(10) NULL,
    PRIMARY KEY (cID),
    CONSTRAINT FK_reg_tut_cSSRNo FOREIGN KEY (cSSRNo) REFERENCES reg_sch (cSSRNo),
    CONSTRAINT FK_reg_tut_cEID FOREIGN KEY (cSSRNo) REFERENCES reg_emp (cEID)
);

CREATE TABLE reg_sub_tut /*Subject Teacher/tutor Registration*/
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NULL,
	cSSRNo VARCHAR(20) NOT NULL,
    cSubject VARCHAR(100) NULL,
	cSession VARCHAR(10) NULL,
	cTerm VARCHAR(10) NULL,
	PRIMARY KEY (cID),
    CONSTRAINT FK_reg_tut_cSSRNo FOREIGN KEY (cSSRNo) REFERENCES reg_sch (cSSRNo),
    CONSTRAINT FK_reg_tut_cEID FOREIGN KEY (cSSRNo) REFERENCES reg_emp (cEID)
);

CREATE TABLE ScoreSetup
(
cScoreID INT NOT NULL AUTO_INCREMENT,
cCANo INT NOT NULL, /*No of Test that constitute CA*/
cCADiv VARCHAR (20) NOT NULL, /*CA Score division*/
cSCA INT NULL, /*CA score total*/
cSExam INT NULL, /*Exam score total*/
cSTerm INT NULL, /*Term score total*/
cPromo INT NULL, /*Pass [Promotion]*/
cPass DOUBLE, /*Pass [Percentage]*/
cTPass INT NULL, /*Pass percentage [Term]*/
CONSTRAINT PK_ScoreSetup PRIMARY KEY (cScoreID)
);

insert INTO ScoreSetup (cCANo, cCADiv, cSCA, cSExam, cSTerm, cPromo, cPass, cTPass) values (2,'20,20',40,60,100,50,40,55);

CREATE TABLE HOD
(
	cID INT NOT NULL AUTO_INCREMENT,
	cHID VARCHAR(15) NULL,
	cEID VARCHAR(15) NULL,
	cDep VARCHAR(50) NULL,
	dFDATE DATE NULL,
	dTDATE DATE NULL,
	CONSTRAINT PK_HOD PRIMARY KEY (cID),
	CONSTRAINT FK_HOD2 FOREIGN KEY (cDep) References Department (cName)
);

CREATE TABLE StaAward /*Staff Award*/
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NULL,
	AwardName VARCHAR(50) NULL,
	AwardDATE DATE NULL,
	CONSTRAINT PK_StaAward PRIMARY KEY (cID),
	CONSTRAINT FK_StaAward FOREIGN KEY (cEID) References reg_emp (cEID)
);

CREATE TABLE StaBlack /*Staff Black book*/
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NULL,
	dDATE DATE NULL,
	Offence VARCHAR(60) NULL,
	Punishment VARCHAR(50) NULL,
	CONSTRAINT PK_StaBlack PRIMARY KEY (cID),
	CONSTRAINT FK_StaBlack FOREIGN KEY (cEID) References reg_emp (cEID)
);

CREATE TABLE StaffAtt
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NOT NULL,
	dDATE DATE NULL,
	tTime DATE NULL,
	cStatus VARCHAR(10) NULL,
	cTester VARCHAR(10) NULL,
	CONSTRAINT PK_StaAtt PRIMARY KEY (cID),
	CONSTRAINT FK_StaAtt FOREIGN KEY (cEID) References reg_emp (cEID)
);

CREATE TABLE StaffPayCodes
(
	cID INT NOT NULL AUTO_INCREMENT,
	cCodeNo VARCHAR(15) NOT NULL,
	cLevel INT NOT NULL,
	cPost VARCHAR(50) NOT NULL,
	mBasic DOUBLE NOT NULL,
	mHouse DOUBLE NULL,
	mMed DOUBLE NULL,
	mTrans DOUBLE NULL,
	mWard DOUBLE NULL,
	mTel DOUBLE NULL,
	mINTax DOUBLE NULL,
	mProTax DOUBLE NULL,
	mLunch DOUBLE NULL,
	mInsurance DOUBLE NULL,
	mOtherTax DOUBLE NULL,
	mLeave DOUBLE NULL,
	mUtility DOUBLE NULL,
	mTotalAllow DOUBLE NULL,
	mTotalDed DOUBLE NULL,
	mNetTotal DOUBLE NULL,
	mGrossTotal DOUBLE NULL,
	UNIQUE INDEX cCodeNo_UNIQUE (cCodeNo ASC),
    CONSTRAINT PK_StaPayCodes PRIMARY KEY (cID),
	CONSTRAINT FK_StaPayCodes FOREIGN KEY (cPost) References Posts (cName)
);

CREATE TABLE StaffPaySlip
(
	cID INT NOT NULL AUTO_INCREMENT,
	cCodeNo VARCHAR(15) NOT NULL,
	cEID VARCHAR(15) NOT NULL,
	cMonth VARCHAR(3) NOT NULL,
	cYear VARCHAR(5) NOT NULL,
	cLevel VARCHAR(5) NULL,
	cPost VARCHAR(50) NULL,
	mExtraBonus DOUBLE NULL,
	mNetTotal DOUBLE NULL,
	mGrossTotal DOUBLE NULL,
	CONSTRAINT PK_StaPaySlip PRIMARY KEY (cID),
	CONSTRAINT FK_StaPaySlip FOREIGN KEY (cEID) References reg_emp (cEID),
	CONSTRAINT FK_StaPaySlip2 FOREIGN KEY (cCodeNo) References StaffPayCodes (cCodeNo)
);

CREATE TABLE StaLeave
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NULL,
	SDATE DATE NULL,
	EDATE DATE NULL,
	ASDATE DATE NULL,
	AEDATE DATE NULL,
	CONSTRAINT PK_StaLeave PRIMARY KEY (cID),
	CONSTRAINT FK_StaLeave FOREIGN KEY (cEID) References reg_emp (cEID)
);
/* Student Zone*/
/*
	Student Registration
	cSID, cLName, cFName, cOName, cSSRNo, cSex, dDOB, dDOA, cPhone, cAddress, cState, cClass1, cClass2, cSession, cPGName, cPGPhone, cEmail, cPGAddress, iPass, dRegDate
*/
CREATE TABLE reg_stu /*Student Registration*/
(
    cSID VARCHAR(30) NOT NULL,
	cSSRNo VARCHAR(20) NOT NULL,
    cLName VARCHAR(20) NOT NULL,
	cFName VARCHAR(20) NOT NULL,
	cOName VARCHAR(20) NULL,
    cSex VARCHAR(10) NULL,
	dDOB DATE NULL,
    dDOA DATE NULL,
    cPhone VARCHAR(20) NULL,
    cAddress VARCHAR(150) NULL,
	cState VARCHAR(10) NULL,
	cClass1 VARCHAR(10) NULL,
    cClass2 VARCHAR(10) NULL,
	cSession VARCHAR(10) NULL,
	cPGName VARCHAR(50) NULL,
	cPGPhone VARCHAR(20) NULL,
    cEmail VARCHAR(50) NULL,
	cPGAddress VARCHAR(150) NULL,
	iPass VARCHAR(50) NULL,
    dRegDate DATE NULL,
    UNIQUE INDEX cEID_UNIQUE (cSID ASC),
    PRIMARY KEY (cSID)
);

/* The cState is gotten fron the state code/session/admission number @ school*/
INSERT INTO reg_stu(cSID, cLName, cFName, cOName, cSSRNo, cSex, dDOB, dDOA, cPhone, cAddress, cState, cClass1, cClass2, cSession, cPGName, cPGPhone, cEmail, cPGAddress, iPass, dRegDate) VALUES('OG/2010/765/000023', 'Ijaduola', 'Olamide', 'Olaoluwa', 'OG/2010/765', 'Male', '1988/07/03', '2014/09/10', '+234803765226', 'Adigbe Abeokuta', 'Ogun', 'JSS 1', 'JSS 1', '2014/2015', 'Engr. Dotun Ijaduola', '+2347031068686', 'holythirst@yahoo.com', 'Oluwo Abeokuta', 'images/stu/OG/2010/765/000023', current_date());

/* SELECT cClass, cSession, cTerm, cSub1, cSub2, cSub3, cSub4, cSub5, cSub6, cSub7, cSub8, cSub9, cSub10, cSub11, cSub12, cSub13, cSub14, cSub15 FROM ClassSubjectTerm */

CREATE TABLE Prefects
(
	cID INT NOT NULL AUTO_INCREMENT,
	cSID VARCHAR(15) NOT NULL,
	cSession VARCHAR(10) NULL,
	cPost VARCHAR(50) NULL,
	CONSTRAINT PK_Prefects PRIMARY KEY (cID),
	CONSTRAINT FK_Prefects FOREIGN KEY (cSID) References reg_stu (cSID)
);

CREATE TABLE Class_GTS /* Class Term Academic Appraisal*/
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
    cSID VARCHAR(15) NOT NULL,
    cClass VARCHAR(10) NOT NULL,
    cSession VARCHAR(10) NOT NULL,
    cTerm VARCHAR(10) NOT NULL,
    cAppraisal VARCHAR(500) NULL,
    cTotal INT NULL,
    PRIMARY KEY (AutoNo),
    CONSTRAINT FK_Class_GTS_cSID FOREIGN KEY (cSID) REFERENCES reg_stu (cSID)
);

CREATE TABLE Gen_AAB /* General Academic Appraisal Broadsheet*/
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
    cSSRNo VARCHAR(20) NOT NULL,
    cSID VARCHAR(15) NOT NULL,
    cClass VARCHAR(10) NOT NULL,
    cSession VARCHAR(10) NOT NULL,
    cTerm VARCHAR(10) NOT NULL,
    cSubName VARCHAR(100) NULL,
    cCA1 INT NULL,
    cCA2 INT NULL,
    cExam INT NULL,
    cTotal INT NULL,
    cGrade VARCHAR(10) NULL,
    PRIMARY KEY (AutoNo),
    CONSTRAINT FK_Class_GTS_cSID FOREIGN KEY (cSID) REFERENCES reg_stu (cSID)
);
SELECT * FROM gen_aab WHERE cSession = '2014/2015' ORDER BY cTerm ASC;

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'JSS 1A', '2014/2015', 'First', 'History of West Africa', 15, 18, 51, 84, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'JSS 1A', '2014/2015', 'First', 'History of West Africa', 8, 13, 45, 66, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'JSS 1A', '2014/2015', 'First', 'English Language', 11, 12, 52, 75, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'JSS 1A', '2014/2015', 'First', 'English Language', 10, 13, 48, 71, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'JSS 1A', '2014/2015', 'Second', 'History of West Africa', 15, 18, 51, 84, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'JSS 1A', '2014/2015', 'Second', 'History of West Africa', 8, 13, 45, 66, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'JSS 1A', '2014/2015', 'Second', 'English Language', 10, 13, 48, 71, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'JSS 1A', '2014/2015', 'Second', 'English Language', 11, 12, 52, 75, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'JSS 1A', '2015/2016', 'First', 'History of West Africa', 15, 18, 51, 84, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'JSS 1A', '2015/2016', 'First', 'History of West Africa', 8, 13, 45, 66, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'JSS 1A', '2015/2016', 'First', 'English Language', 10, 13, 48, 71, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'JSS 1A', '2015/2016', 'First', 'English Language', 11, 12, 52, 75, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'JSS 1A', '2015/2016', 'Second', 'History of West Africa', 15, 18, 51, 84, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'JSS 1A', '2015/2016', 'Second', 'History of West Africa', 8, 13, 45, 66, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'JSS 1A', '2015/2016', 'Second', 'English Language', 10, 13, 48, 71, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'JSS 1A', '2015/2016', 'Second', 'English Language', 11, 12, 52, 75, 'A');








INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'Basic 8C', '2014/2015', 'First', 'History of West Africa', 15, 18, 51, 84, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'Basic 8C', '2014/2015', 'First', 'History of West Africa', 8, 13, 45, 66, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'Basic 8C', '2014/2015', 'First', 'English Language', 10, 13, 48, 71, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'Basic 8C', '2014/2015', 'First', 'English Language', 11, 12, 52, 75, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'Basic 8C', '2014/2015', 'Second', 'History of West Africa', 15, 18, 51, 84, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'Basic 8C', '2014/2015', 'Second', 'History of West Africa', 8, 13, 45, 66, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'Basic 8C', '2014/2015', 'Second', 'English Language', 10, 13, 48, 71, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'Basic 8C', '2014/2015', 'Second', 'English Language', 11, 12, 52, 75, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'Basic 8C', '2015/2016', 'First', 'History of West Africa', 15, 18, 51, 84, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'Basic 8C', '2015/2016', 'First', 'History of West Africa', 8, 13, 45, 66, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'Basic 8C', '2015/2016', 'First', 'English Language', 10, 13, 48, 71, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'Basic 8C', '2015/2016', 'First', 'English Language', 11, 12, 52, 75, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'Basic 8C', '2015/2016', 'Second', 'History of West Africa', 15, 18, 51, 84, 'A');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'Basic 8C', '2015/2016', 'Second', 'History of West Africa', 8, 13, 45, 66, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('041', 'Basic 8C', '2015/2016', 'Second', 'English Language', 10, 13, 48, 71, 'B');

INSERT INTO Gen_AAB(cSID, cSSRNo, cClass, cSession, cTerm, cSubName, cCA1, cCA2, cExam, cTotal, cGrade) VALUES('002', 'Basic 8C', '2015/2016', 'Second', 'English Language', 11, 12, 52, 75, 'A');


CREATE TABLE StuAtt
(
	cID INT NOT NULL AUTO_INCREMENT,
	cSID VARCHAR(15) NULL,
	dDATE DATE NULL,
	cStatus VARCHAR(10) NULL,
	tTime DATE NULL,
	cTester VARCHAR(10) NULL,
	CONSTRAINT PK_StuAtT PRIMARY KEY (cID),
	CONSTRAINT FK_StuAtt2 FOREIGN KEY (cSID) References reg_stu(cSID)
);

CREATE TABLE StuAward
(
	cID INT NOT NULL AUTO_INCREMENT,
	cSID VARCHAR(15) NULL,
	AwardName VARCHAR(50) NULL,
	AwardDATE DATE NULL,
	CONSTRAINT PK_StuAward PRIMARY KEY (cID),
	CONSTRAINT FK_StuAward2 FOREIGN KEY (cSID) References reg_stu(cSID)
);

CREATE TABLE StuBlack
(
	cID INT NOT NULL AUTO_INCREMENT,
	cSID VARCHAR(15) NULL,
	dDATE DATE NULL,
	Offence VARCHAR(60) NULL,
	Punishment VARCHAR(50) NULL,
	CONSTRAINT PK_StuBlack PRIMARY KEY (cID),
	CONSTRAINT FK_StuBlack2 FOREIGN KEY (cSID) References reg_stu(cSID)
);

CREATE TABLE StuStaCol /*Stationeries/things collected */
(
	cID INT NOT NULL AUTO_INCREMENT,
	cSID VARCHAR(15) NULL,
	cSession VARCHAR(10) NULL,
	cTerm VARCHAR(10) NULL,
	cClass VARCHAR(10) NULL,
	dDATE DATE NULL,
	cUnit INT NULL,
	mUnitPrice DOUBLE NULL,
	cCode VARCHAR(15) NULL,
	cDes VARCHAR(100) NULL,
	mTotal DOUBLE NULL,
	CONSTRAINT PK_StuStaCol PRIMARY KEY (cID),
	CONSTRAINT FK_StuStaCol2 FOREIGN KEY (cSID) References reg_stu(cSID)
);

CREATE TABLE FeesBillCodes
(
	cID INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(10) NOT NULL,
	cAbbr VARCHAR(10) NOT NULL,
	mTuition DOUBLE NULL,
	cStatus VARCHAR(10) NULL, /*New or Current*/
	cType VARCHAR(10) NULL, /*Day or Boarder*/
	mInter DOUBLE NULL, /*Internet*/
	mBoard DOUBLE NULL, /*Baording fees*/
	mUni DOUBLE NULL, /*Uniform*/
	mSoc DOUBLE NULL, /*Societies*/
	mPrac DOUBLE NULL, /*Practicals*/
	mDev DOUBLE NULL, /*Development*/
	mDam DOUBLE NULL, /*Damages*/
	mPTA DOUBLE NULL, /*Parents Teachers Association*/
	mSport DOUBLE NULL, /*Sport*/
	mLib DOUBLE NULL, /*Library*/
	mExcur DOUBLE NULL, /*Excursion*/
	cSpExam VARCHAR(20) NULL, /*Special Exam eg. WAEC, NECO, etc.*/
	mSpExPrice DOUBLE NULL, /*Special Exam Price*/
	mExam DOUBLE NULL, /*Tests and Examination*/
	mExten DOUBLE NULL, /*Extention Classes*/
	mMed DOUBLE NULL, /*Medicals*/
	mTotal DOUBLE NULL, /*Total*/
	dLastUpDATE DATE NULL,
    UNIQUE INDEX cAbbr_UNIQUE (cAbbr ASC),
	PRIMARY KEY (cID)
);

CREATE TABLE FeesBilling
(
	cID INT NOT NULL AUTO_INCREMENT,
	cSID VARCHAR(15) NOT NULL,
	cSession VARCHAR(10) NOT NULL,
	cTerm VARCHAR(10) NOT NULL,
	cClass VARCHAR(10) NOT NULL,
	mTuition DOUBLE NULL,
	mSport DOUBLE NULL,
	mSoc DOUBLE NULL,
	mMed DOUBLE NULL,
	mOut DOUBLE NULL,
	mExam DOUBLE NULL,
	mPCom DOUBLE NULL,
	mSpExam VARCHAR(20) NULL,
	mSpExPrice DOUBLE NULL,
	mIntser DOUBLE NULL,
	mTotal DOUBLE NULL,
	cType VARCHAR(10) NULL,
	mOthers DOUBLE NULL,
	mBoard DOUBLE NULL,
	mCol DOUBLE NULL,
	mTermTotal DOUBLE NULL,
	PRIMARY KEY (cID),
	CONSTRAINT FK_FeesBilling FOREIGN KEY (cType) References FeesBillCodes(cAbbr)
);

CREATE TABLE FeesPayment
(
	cID INT NOT NULL AUTO_INCREMENT,
	cBID INT NOT NULL,
	mAmount DOUBLE NULL,
	dDATE DATE NULL,
	cTellerNo VARCHAR(20) NULL,
	mTotal DOUBLE NULL,
	cClass VARCHAR(20) NULL,
	mInWords VARCHAR(120) NULL,
	PRIMARY KEY (cID),
	CONSTRAINT FK_FeesPayment FOREIGN KEY (cBID) References FeesBilling(cID)
);

CREATE TABLE FeesPaymentCur
(
	cBID VARCHAR(15) NOT NULL,
	cSID VARCHAR(15) NULL,
	mAmount DOUBLE NULL,
	mTotal DOUBLE NULL,
	mBal DOUBLE NULL,
	PRIMARY KEY (cBID)
);

CREATE TABLE StationCodes
(
	cID INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(50) NULL,
	cGroup VARCHAR(20) NULL,
	cAbbr VARCHAR(10) NULL,
	cSubject VARCHAR(30) NULL,
	mCost DOUBLE NULL,
	mFees DOUBLE NULL,
	cAuthor VARCHAR(50) NULL,
	cRem VARCHAR(100) NULL,
	CONSTRAINT PK_StationCodes PRIMARY KEY (cID)
);

CREATE VIEW FeesPaymentCurDef as 
(
	SELECT DISTINCT FeesPaymentCur.cBID, FeesPaymentCur.mTotal, FeesPaymentCur.mAmount, FeesPaymentCur.mBal, FeesBilling.cSID, FeesBilling.cSession, FeesBilling.cTerm, FeesBilling.cClass
	FROM FeesPaymentCur INNER JOIN FeesBilling ON FeesPaymentCur.cBID =FeesBilling.cID
	WHERE (((FeesPaymentCur.mBal)>0))
);

CREATE VIEW FeesPaymentCurGen as 
(
	SELECT DISTINCT FeesPaymentCur.cBID, FeesPaymentCur.mTotal, FeesPaymentCur.mAmount, FeesPaymentCur.mBal, FeesBilling.cSID, FeesBilling.cSession, FeesBilling.cTerm, FeesBilling.cClass
	FROM FeesPaymentCur INNER JOIN FeesBilling ON FeesPaymentCur.cBID =FeesBilling.cID
);

CREATE VIEW FeesPaymentCurNDef as 
(
	SELECT DISTINCT FeesPaymentCur.cBID, FeesPaymentCur.mTotal, FeesPaymentCur.mAmount, FeesPaymentCur.mBal, FeesBilling.cSID, FeesBilling.cSession, FeesBilling.cTerm, FeesBilling.cClass
	FROM FeesPaymentCur INNER JOIN FeesBilling ON FeesPaymentCur.cBID =FeesBilling.cID
	WHERE (((FeesPaymentCur.mBal)<=0))
);

CREATE VIEW GetPrefect as 
(
Select Prefects.cID as "ID", Prefects.cSID as "Student ID", Prefects.cSession as "Session", Prefects.cPost as "Post", reg_stu.SName + " " + reg_stu.FName + " " + reg_stu.OName as "Full Name"
from Prefects INNER JOIN reg_stu ON Prefects.cSID =reg_stu.cSID
);

CREATE VIEW Class_GTS_View AS
(
SELECT a.cSID, a.cLName, a.cFName, a.cOName, a.cSSRNo, b.cSName, c.cClass, c.cSession, c.cTerm, c.cSub1, c.cSub2, c.cSub3, c.cSub4, c.cSub5, c.cSub6, c.cSub7, c.cSub8, c.cSub9, c.cSub10, c.cSub11, c.cSub12, c.cSub13, c.cSub14, c.cSub15, c.cSub1G, c.cSub2G, c.cSub3G, c.cSub4G, c.cSub5G, c.cSub6G, c.cSub7G, c.cSub8G, c.cSub9G, c.cSub10G, c.cSub11G, c.cSub12G, c.cSub13G, c.cSub14G, c.cSub15G, c.cTotal, d.cSub1, d.cSub2, d.cSub3, d.cSub4, d.cSub5, d.cSub6, d.cSub7, d.cSub8, d.cSub9, d.cSub10, d.cSub11, d.cSub12, d.cSub13, d.cSub14, d.cSub15
FROM reg_stu a, reg_sch b, Class_GTS c, Class_ST d 
WHERE a.cSSRNo = b.cSSRNo = d.cSSRNo AND a.cSID = c.cSID AND c.AutoNo = '001'
);

CREATE VIEW Class_Details AS
(
SELECT a.cSID, a.cLName, a.cFName, a.cOName, a.cSSRNo, b.cSName, c.cClass, c.cSession, c.cTerm, c.cSub1, c.cSub2, c.cSub3, c.cSub4, c.cSub5, c.cSub6, c.cSub7, c.cSub8, c.cSub9, c.cSub10, c.cSub11, c.cSub12, c.cSub13, c.cSub14, c.cSub15, c.cSub1G, c.cSub2G, c.cSub3G, c.cSub4G, c.cSub5G, c.cSub6G, c.cSub7G, c.cSub8G, c.cSub9G, c.cSub10G, c.cSub11G, c.cSub12G, c.cSub13G, c.cSub14G, c.cSub15G, c.cTotal, d.cSub1, d.cSub2, d.cSub3, d.cSub4, d.cSub5, d.cSub6, d.cSub7, d.cSub8, d.cSub9, d.cSub10, d.cSub11, d.cSub12, d.cSub13, d.cSub14, d.cSub15
FROM reg_stu a, reg_cla b, Class_GTS c, Class_ST d 
WHERE a.cSSRNo = b.cSSRNo = d.cSSRNo AND a.cSID = c.cSID AND c.AutoNo = '001'
);



SELECT a.cEID, concat(a.cSName, ' ', a.cFName, ' ', a.cOName) as 'Name', a.cSSRNo, b.cStatus
FROM reg_emp a, reg_tut b
WHERE a.cSSRNo = b.cSSRNo and a.cEID = b.cEID;


SELECT a.cID, a.cPName, a.cName, a.cPass, a.cType, a.cStatus, a.cSSRNo, a.dExpiryDate, a.cSecret, a.cAnswer, b.cSName 
FROM userdetails a, reg_sch b 
WHERE a.cSSRNo = b.cSSRNo


CREATE TABLE Expenditure
(
	cID VARCHAR(15) NOT NULL,
	cAmount INT NULL,
	dDATE DATE NULL,
	cPurpose VARCHAR(120) NULL,
	PRIMARY KEY (cID)
);

CREATE TABLE Income
(
	cID INT NOT NULL AUTO_INCREMENT,
	cAmount INT NULL,
	dDATE DATE NULL,
	cType VARCHAR(20) NULL,
	CONSTRAINT PK_Income PRIMARY KEY (cID)
);

CREATE TABLE Main
(
	cID INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(255) NULL,
	dDATE VARCHAR(255) NULL,
	CONSTRAINT PK_StaMain PRIMARY KEY (cID)
);
 
CREATE TABLE SendMail
(
	cID INT NOT NULL AUTO_INCREMENT,
	dDATE DATE NULL,
	cTo VARCHAR(200) NULL,
	cSub VARCHAR(100) NULL,
	cFrom VARCHAR(40) NULL,
	cFromDis VARCHAR(30) NULL,
	cMessage VARCHAR(2000) NULL,
	cAttach VARCHAR(200) NULL,
	CONSTRAINT PK_Send PRIMARY KEY(cID)
);

CREATE TABLE StuApp
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NOT NULL,
	cSession VARCHAR(10) NOT NULL,
	cTerm VARCHAR(10) NOT NULL,
	cClass VARCHAR(10) NOT NULL,
	CA INT NULL,
	SCA INT NULL,
	Exam INT NULL,
	SExam INT NULL,
	Pass INT NULL,
	Sub1Ab VARCHAR(10) NULL,
	Sub1N VARCHAR(30) NULL,
	Sub1C INT NULL,
	Sub1CG VARCHAR(3) NULL,
	Sub1CCom VARCHAR(15) NULL,
	Sub1E INT NULL,
	Sub1EG VARCHAR(3) NULL,
	Sub1ECom VARCHAR(15) NULL,
	Sub1T INT NULL,
	Sub1G VARCHAR(3) NULL,
	Sub1Com VARCHAR(15) NULL,
	Sub2Ab VARCHAR(10) NULL,
	Sub2N VARCHAR(30) NULL,
	Sub2C INT NULL,
	Sub2CG VARCHAR(3) NULL,
	Sub2CCom VARCHAR(15) NULL,
	Sub2E INT NULL,
	Sub2EG VARCHAR(3) NULL,
	Sub2ECom VARCHAR(15) NULL,
	Sub2T INT NULL,
	Sub2G VARCHAR(3) NULL,
	Sub2Com VARCHAR(15) NULL,
	Sub3Ab VARCHAR(10) NULL,
	Sub3N VARCHAR(30) NULL,
	Sub3C INT NULL,
	Sub3CG VARCHAR(3) NULL,
	Sub3CCom VARCHAR(15) NULL,
	Sub3E INT NULL,
	Sub3EG VARCHAR(3) NULL,
	Sub3ECom VARCHAR(15) NULL,
	Sub3T INT NULL,
	Sub3G VARCHAR(3) NULL,
	Sub3Com VARCHAR(15) NULL,
	Sub4Ab VARCHAR(10) NULL,
	Sub4N VARCHAR(30) NULL,
	Sub4C INT NULL,
	Sub4CG VARCHAR(3) NULL,
	Sub4CCom VARCHAR(15) NULL,
	Sub4E INT NULL,
	Sub4EG VARCHAR(3) NULL,
	Sub4ECom VARCHAR(15) NULL,
	Sub4T INT NULL,
	Sub4G VARCHAR(3) NULL,
	Sub4Com VARCHAR(15) NULL,
	Sub5Ab VARCHAR(10) NULL,
	Sub5N VARCHAR(30) NULL,
	Sub5C INT NULL,
	Sub5CG VARCHAR(3) NULL,
	Sub5CCom VARCHAR(15) NULL,
	Sub5E INT NULL,
	Sub5EG VARCHAR(3) NULL,
	Sub5ECom VARCHAR(15) NULL,
	Sub5T INT NULL,
	Sub5G VARCHAR(3) NULL,
	Sub5Com VARCHAR(15) NULL,
	Sub6Ab VARCHAR(10) NULL,
	Sub6N VARCHAR(30) NULL,
	Sub6C INT NULL,
	Sub6CG VARCHAR(3) NULL,
	Sub6CCom VARCHAR(15) NULL,
	Sub6E INT NULL,
	Sub6EG VARCHAR(3) NULL,
	Sub6ECom VARCHAR(15) NULL,
	Sub6T INT NULL,
	Sub6G VARCHAR(3) NULL,
	Sub6Com VARCHAR(15) NULL,
	Sub7Ab VARCHAR(10) NULL,
	Sub7N VARCHAR(30) NULL,
	Sub7C INT NULL,
	Sub7CG VARCHAR(3) NULL,
	Sub7CCom VARCHAR(15) NULL,
	Sub7E INT NULL,
	Sub7EG VARCHAR(3) NULL,
	Sub7ECom VARCHAR(15) NULL,
	Sub7T INT NULL,
	Sub7G VARCHAR(3) NULL,
	Sub7Com VARCHAR(15) NULL,
	Sub8Ab VARCHAR(10) NULL,
	Sub8N VARCHAR(30) NULL,
	Sub8C INT NULL,
	Sub8CG VARCHAR(3) NULL,
	Sub8CCom VARCHAR(15) NULL,
	Sub8E INT NULL,
	Sub8EG VARCHAR(3) NULL,
	Sub8ECom VARCHAR(15) NULL,
	Sub8T INT NULL,
	Sub8G VARCHAR(3) NULL,
	Sub8Com VARCHAR(15) NULL,
	Sub9Ab VARCHAR(10) NULL,
	Sub9N VARCHAR(30) NULL,
	Sub9C INT NULL,
	Sub9CG VARCHAR(3) NULL,
	Sub9CCom VARCHAR(15) NULL,
	Sub9E INT NULL,
	Sub9EG VARCHAR(3) NULL,
	Sub9ECom VARCHAR(15) NULL,
	Sub9T INT NULL,
	Sub9G VARCHAR(3) NULL,
	Sub9Com VARCHAR(15) NULL,
	Sub10Ab VARCHAR(10) NULL,
	Sub10N VARCHAR(30) NULL,
	Sub10C INT NULL,
	Sub10CG VARCHAR(3) NULL,
	Sub10CCom VARCHAR(15) NULL,
	Sub10E INT NULL,
	Sub10EG VARCHAR(3) NULL,
	Sub10ECom VARCHAR(15) NULL,
	Sub10T INT NULL,
	Sub10G VARCHAR(3) NULL,
	Sub10Com VARCHAR(15) NULL,
	Sub11Ab VARCHAR(10) NULL,
	Sub11N VARCHAR(30) NULL,
	Sub11C INT NULL,
	Sub11CG VARCHAR(3) NULL,
	Sub11CCom VARCHAR(15) NULL,
	Sub11E INT NULL,
	Sub11EG VARCHAR(3) NULL,
	Sub11ECom VARCHAR(15) NULL,
	Sub11T INT NULL,
	Sub11G VARCHAR(3) NULL,
	Sub11Com VARCHAR(15) NULL,
	Sub12Ab VARCHAR(10) NULL,
	Sub12N VARCHAR(30) NULL,
	Sub12C INT NULL,
	Sub12CG VARCHAR(3) NULL,
	Sub12CCom VARCHAR(15) NULL,
	Sub12E INT NULL,
	Sub12EG VARCHAR(3) NULL,
	Sub12ECom VARCHAR(15) NULL,
	Sub12T INT NULL,
	Sub12G VARCHAR(3) NULL,
	Sub12Com VARCHAR(15) NULL,
	Sub13Ab VARCHAR(10) NULL,
	Sub13N VARCHAR(30) NULL,
	Sub13C INT NULL,
	Sub13CG VARCHAR(3) NULL,
	Sub13CCom VARCHAR(15) NULL,
	Sub13E INT NULL,
	Sub13EG VARCHAR(3) NULL,
	Sub13ECom VARCHAR(15) NULL,
	Sub13T INT NULL,
	Sub13G VARCHAR(3) NULL,
	Sub13Com VARCHAR(15) NULL,
	Sub14Ab VARCHAR(10) NULL,
	Sub14N VARCHAR(30) NULL,
	Sub14C INT NULL,
	Sub14CG VARCHAR(3) NULL,
	Sub14CCom VARCHAR(15) NULL,
	Sub14E INT NULL,
	Sub14EG VARCHAR(3) NULL,
	Sub14ECom VARCHAR(15) NULL,
	Sub14T INT NULL,
	Sub14G VARCHAR(3) NULL,
	Sub14Com VARCHAR(15) NULL,
    Sub15T INT NULL,
	Sub15G VARCHAR(3) NULL,
	Sub15Com VARCHAR(15) NULL,
	TestTa INT NULL,
	TestPa INT NULL,
	TestFa INT NULL,
	ExamTa INT NULL,
	ExamPa INT NULL,
	ExamFa INT NULL,
	SubT INT NULL,
	SubP INT NULL,
	SubF INT NULL,
	FSOn DATE NULL,
	LSOn DATE NULL,
	cTestTotal INT NULL,
	TestP DOUBLE NULL,
	TestG VARCHAR(3) NULL,
	TestCom VARCHAR(15) NULL,
	cExamTotal INT NULL,
	ExamP DOUBLE NULL,
	ExamG VARCHAR(3) NULL,
	ExamCom VARCHAR(15) NULL,
	OverallT INT NULL,
	OverallP DOUBLE NULL,
	OverallG VARCHAR(3) NULL,
	OverallCom VARCHAR(15) NULL,
	cPromoTo VARCHAR(20) NULL,
	FName VARCHAR(50) NULL,
	cDep VARCHAR(20) NULL,
	TestA1 INT NULL,
	TestB2 INT NULL,
	TestB3 INT NULL,
	TestC4 INT NULL,
	TestC5 INT NULL,
	TestC6 INT NULL,
	TestD7 INT NULL,
	TestE8 INT NULL,
	TestF9 INT NULL,
	TestNA INT NULL,
	ExamA1 INT NULL,
	ExamB2 INT NULL,
	ExamB3 INT NULL,
	ExamC4 INT NULL,
	ExamC5 INT NULL,
	ExamC6 INT NULL,
	ExamD7 INT NULL,
	ExamE8 INT NULL,
	ExamF9 INT NULL,
	ExamNA INT NULL,
	TermA1 INT NULL,
	TermB2 INT NULL,
	TermB3 INT NULL,
	TermC4 INT NULL,
	TermC5 INT NULL,
	TermC6 INT NULL,
	TermD7 INT NULL,
	TermE8 INT NULL,
	TermF9 INT NULL,
	TermNA INT NULL,
	Promo INT NULL,
	cType VARCHAR(10) NULL,
	CONSTRAINT PK_StuApp PRIMARY KEY (cID),
	CONSTRAINT FK_StuApp FOREIGN KEY (cEID) References StuAdmin (cEID)
);

CREATE TABLE StuAppAvg
(
	cID INT NOT NULL AUTO_INCREMENT,
	cEID VARCHAR(15) NULL,
	cSession VARCHAR(10) NULL,
	cClass VARCHAR(10) NULL,
	FName VARCHAR(50) NULL,
	Sub1 VARCHAR(30) NULL,
	Sub1Ab VARCHAR(10) NULL,
	Sub1T DOUBLE NULL,
	Sub1G VARCHAR(3) NULL,
	Sub1Com VARCHAR(15) NULL,
	Sub2 VARCHAR(30) NULL,
	Sub2Ab VARCHAR(10) NULL,
	Sub2T DOUBLE NULL,
	Sub2G VARCHAR(3) NULL,
	Sub2Com VARCHAR(15) NULL,
	Sub3 VARCHAR(30) NULL,
	Sub3Ab VARCHAR(10) NULL,
	Sub3T DOUBLE NULL,
	Sub3G VARCHAR(3) NULL,
	Sub3Com VARCHAR(15) NULL,
	Sub4 VARCHAR(30) NULL,
	Sub4Ab VARCHAR(10) NULL,
	Sub4T DOUBLE NULL,
	Sub4G VARCHAR(3) NULL,
	Sub4Com VARCHAR(15) NULL,
	Sub5 VARCHAR(30) NULL,
	Sub5Ab VARCHAR(10) NULL,
	Sub5T DOUBLE NULL,
	Sub5G VARCHAR(3) NULL,
	Sub5Com VARCHAR(15) NULL,
	Sub6 VARCHAR(30) NULL,
	Sub6Ab VARCHAR(10) NULL,
	Sub6T DOUBLE NULL,
	Sub6G VARCHAR(3) NULL,
	Sub6Com VARCHAR(15) NULL,
	Sub7 VARCHAR(30) NULL,
	Sub7Ab VARCHAR(10) NULL,
	Sub7T DOUBLE NULL,
	Sub7G VARCHAR(3) NULL,
	Sub7Com VARCHAR(15) NULL,
	Sub8 VARCHAR(30) NULL,
	Sub8Ab VARCHAR(10) NULL,
	Sub8T DOUBLE NULL,
	Sub8G VARCHAR(3) NULL,
	Sub8Com VARCHAR(15) NULL,
	Sub9 VARCHAR(30) NULL,
	Sub9Ab VARCHAR(10) NULL,
	Sub9T DOUBLE NULL,
	Sub9G VARCHAR(3) NULL,
	Sub9Com VARCHAR(15) NULL,
	Sub10 VARCHAR(30) NULL,
	Sub10Ab VARCHAR(10) NULL,
	Sub10T DOUBLE NULL,
	Sub10G VARCHAR(3) NULL,
	Sub10Com VARCHAR(15) NULL,	
	Sub11 VARCHAR(30) NULL,
	Sub11Ab VARCHAR(10) NULL,
	Sub11T DOUBLE NULL,
	Sub11G VARCHAR(3) NULL,
	Sub11Com VARCHAR(15) NULL,	
	Sub12 VARCHAR(30) NULL,
	Sub12Ab VARCHAR(10) NULL,
	Sub12T DOUBLE NULL,
	Sub12G VARCHAR(3) NULL,
	Sub12Com VARCHAR(15) NULL,	
	Sub13 VARCHAR(30) NULL,
	Sub13Ab VARCHAR(10) NULL,
	Sub13T DOUBLE NULL,
	Sub13G VARCHAR(3) NULL,
	Sub13Com VARCHAR(15) NULL,	
	Sub14 VARCHAR(30) NULL,
	Sub14Ab VARCHAR(10) NULL,
	Sub14T DOUBLE NULL,
	Sub14G VARCHAR(3) NULL,
	Sub14Com VARCHAR(15) NULL,	
	SubT INT NULL,
	SubP INT NULL,
	SubF INT NULL,
	OverallP DOUBLE NULL,
	OverallG VARCHAR(3) NULL,
	OverallCom VARCHAR(15) NULL,
	cTotal DOUBLE NULL,
	cPromoTo VARCHAR(50) NULL,
	cDep VARCHAR(20) NULL,
	A1Grade INT NULL,
	B2Grade INT NULL,
	B3Grade INT NULL,
	C4Grade INT NULL,
	C5Grade INT NULL,
	C6Grade INT NULL,
	D7Grade INT NULL,
	E8Grade INT NULL,
	F9Grade INT NULL,
	NFGrade INT NULL,
    CONSTRAINT PK_StuAppAvg PRIMARY KEY (cID)
);

CREATE TABLE StuAppSes
(
	cEID VARCHAR(15) NULL,
	cSession VARCHAR(10) NULL,
	Sub1C INT NULL,
	Sub1C2 INT NULL,
	Sub1C3 INT NULL,
	Sub1E INT NULL,
	Sub1E2 INT NULL,
	Sub1E3 INT NULL,
	Sub1T DOUBLE NULL,
	Sub1T2 DOUBLE NULL,
	Sub1T3 DOUBLE NULL,
	Sub1G VARCHAR(3) NULL,
	Sub1G2 VARCHAR(3) NULL,
	Sub1G3 VARCHAR(3) NULL,
	Sub2C INT NULL,
	Sub2C2 INT NULL,
	Sub2C3 INT NULL,
	Sub2E INT NULL,
	Sub2E2 INT NULL,
	Sub2E3 INT NULL,
	Sub2T DOUBLE NULL,
	Sub2T2 DOUBLE NULL,
	Sub2T3 DOUBLE NULL,
	Sub2G VARCHAR(3) NULL,
	Sub2G2 VARCHAR(3) NULL,
	Sub2G3 VARCHAR(3) NULL,
	Sub3C INT NULL,
	Sub3C2 INT NULL,
	Sub3C3 INT NULL,
	Sub3E INT NULL,
	Sub3E2 INT NULL,
	Sub3E3 INT NULL,
	Sub3T DOUBLE NULL,
	Sub3T2 DOUBLE NULL,
	Sub3T3 DOUBLE NULL,
	Sub3G VARCHAR(3) NULL,
	Sub3G2 VARCHAR(3) NULL,
	Sub3G3 VARCHAR(3) NULL,
	Sub4C INT NULL,
	Sub4C2 INT NULL,
	Sub4C3 INT NULL,
	Sub4E INT NULL,
	Sub4E2 INT NULL,
	Sub4E3 INT NULL,
	Sub4T DOUBLE NULL,
	Sub4T2 DOUBLE NULL,
	Sub4T3 DOUBLE NULL,
	Sub4G VARCHAR(3) NULL,
	Sub4G2 VARCHAR(3) NULL,
	Sub4G3 VARCHAR(3) NULL,
	Sub5C INT NULL,
	Sub5C2 INT NULL,
	Sub5C3 INT NULL,
	Sub5E INT NULL,
	Sub5E2 INT NULL,
	Sub5E3 INT NULL,
	Sub5T DOUBLE NULL,
	Sub5T2 DOUBLE NULL,
	Sub5T3 DOUBLE NULL,
	Sub5G VARCHAR(3) NULL,
	Sub5G2 VARCHAR(3) NULL,
	Sub5G3 VARCHAR(3) NULL,
	Sub6C INT NULL,
	Sub6C2 INT NULL,
	Sub6C3 INT NULL,
	Sub6E INT NULL,
	Sub6E2 INT NULL,
	Sub6E3 INT NULL,
	Sub6T DOUBLE NULL,
	Sub6T2 DOUBLE NULL,
	Sub6T3 DOUBLE NULL,
	Sub6G VARCHAR(3) NULL,
	Sub6G2 VARCHAR(3) NULL,
	Sub6G3 VARCHAR(3) NULL,
	Sub7C INT NULL,
	Sub7C2 INT NULL,
	Sub7C3 INT NULL,
	Sub7E INT NULL,
	Sub7E2 INT NULL,
	Sub7E3 INT NULL,
	Sub7T DOUBLE NULL,
	Sub7T2 DOUBLE NULL,
	Sub7T3 DOUBLE NULL,
	Sub7G VARCHAR(3) NULL,
	Sub7G2 VARCHAR(3) NULL,
	Sub7G3 VARCHAR(3) NULL,
	Sub8C INT NULL,
	Sub8C2 INT NULL,
	Sub8C3 INT NULL,
	Sub8E INT NULL,
	Sub8E2 INT NULL,
	Sub8E3 INT NULL,
	Sub8T DOUBLE NULL,
	Sub8T2 DOUBLE NULL,
	Sub8T3 DOUBLE NULL,
	Sub8G VARCHAR(3) NULL,
	Sub8G2 VARCHAR(3) NULL,
	Sub8G3 VARCHAR(3) NULL,
	Sub9C INT NULL,
	Sub9C2 INT NULL,
	Sub9C3 INT NULL,
	Sub9E INT NULL,
	Sub9E2 INT NULL,
	Sub9E3 INT NULL,
	Sub9T DOUBLE NULL,
	Sub9T2 DOUBLE NULL,
	Sub9T3 DOUBLE NULL,
	Sub9G VARCHAR(3) NULL,
	Sub9G2 VARCHAR(3) NULL,
	Sub9G3 VARCHAR(3) NULL,
	Sub10C INT NULL,
	Sub10C2 INT NULL,
	Sub10C3 INT NULL,
	Sub10E INT NULL,
	Sub10E2 INT NULL,
	Sub10E3 INT NULL,
	Sub10T DOUBLE NULL,
	Sub10T2 DOUBLE NULL,
	Sub10T3 DOUBLE NULL,
	Sub10G VARCHAR(3) NULL,
	Sub10G2 VARCHAR(3) NULL,
	Sub10G3 VARCHAR(3) NULL,
	Sub11C INT NULL,
	Sub11C2 INT NULL,
	Sub11C3 INT NULL,
	Sub11E INT NULL,
	Sub11E2 INT NULL,
	Sub11E3 INT NULL,
	Sub11T DOUBLE NULL,
	Sub11T2 DOUBLE NULL,
	Sub11T3 DOUBLE NULL,
	Sub11G VARCHAR(3) NULL,
	Sub11G2 VARCHAR(3) NULL,
	Sub11G3 VARCHAR(3) NULL,	
	Sub12C INT NULL,
	Sub12C2 INT NULL,
	Sub12C3 INT NULL,
	Sub12E INT NULL,
	Sub12E2 INT NULL,
	Sub12E3 INT NULL,
	Sub12T DOUBLE NULL,
	Sub12T2 DOUBLE NULL,
	Sub12T3 DOUBLE NULL,
	Sub12G VARCHAR(3) NULL,
	Sub12G2 VARCHAR(3) NULL,
	Sub12G3 VARCHAR(3) NULL,
	Sub13C INT NULL,
	Sub13C2 INT NULL,
	Sub13C3 INT NULL,
	Sub13E INT NULL,
	Sub13E2 INT NULL,
	Sub13E3 INT NULL,
	Sub13T DOUBLE NULL,
	Sub13T2 DOUBLE NULL,
	Sub13T3 DOUBLE NULL,
	Sub13G VARCHAR(3) NULL,
	Sub13G2 VARCHAR(3) NULL,
	Sub13G3 VARCHAR(3) NULL,	
	Sub14C INT NULL,
	Sub14C2 INT NULL,
	Sub14C3 INT NULL,
	Sub14E INT NULL,
	Sub14E2 INT NULL,
	Sub14E3 INT NULL,
	Sub14T DOUBLE NULL,
	Sub14T2 DOUBLE NULL,
	Sub14T3 DOUBLE NULL,
	Sub14G VARCHAR(3) NULL,
	Sub14G2 VARCHAR(3) NULL,
	Sub14G3 VARCHAR(3) NULL
);

CREATE TABLE TimeTable
(
	cID INT NOT NULL AUTO_INCREMENT,
	cClass VARCHAR(10) NOT NULL,
	cSession VARCHAR(10) NOT NULL,
	cTerm VARCHAR(10) NOT NULL,
	cMon1 VARCHAR(30) NULL,
	cMon2 VARCHAR(30) NULL,
	cMon3 VARCHAR(30) NULL,
	cMon4 VARCHAR(30) NULL,
	cMon5 VARCHAR(30) NULL,
	cMon6 VARCHAR(30) NULL,
	cMon7 VARCHAR(30) NULL,
	cMon8 VARCHAR(30) NULL,
	cMon9 VARCHAR(30) NULL,
	cTue1 VARCHAR(30) NULL,
	cTue2 VARCHAR(30) NULL,
	cTue3 VARCHAR(30) NULL,
	cTue4 VARCHAR(30) NULL,
	cTue5 VARCHAR(30) NULL,
	cTue6 VARCHAR(30) NULL,
	cTue7 VARCHAR(30) NULL,
	cTue8 VARCHAR(30) NULL,
	cTue9 VARCHAR(30) NULL,
	cWed1 VARCHAR(30) NULL,
	cWed2 VARCHAR(30) NULL,
	cWed3 VARCHAR(30) NULL,
	cWed4 VARCHAR(30) NULL,
	cWed5 VARCHAR(30) NULL,
	cWed6 VARCHAR(30) NULL,
	cWed7 VARCHAR(30) NULL,
	cWed8 VARCHAR(30) NULL,
	cWed9 VARCHAR(30) NULL,
	cThu1 VARCHAR(30) NULL,
	cThu2 VARCHAR(30) NULL,
	cThu3 VARCHAR(30) NULL,
	cThu4 VARCHAR(30) NULL,
	cThu5 VARCHAR(30) NULL,
	cThu6 VARCHAR(30) NULL,
	cThu7 VARCHAR(30) NULL,
	cThu8 VARCHAR(30) NULL,
	cThu9 VARCHAR(30) NULL,
	cFri1 VARCHAR(30) NULL,
	cFri2 VARCHAR(30) NULL,
	cFri3 VARCHAR(30) NULL,
	cFri4 VARCHAR(30) NULL,
	cFri5 VARCHAR(30) NULL,
	cFri6 VARCHAR(30) NULL,
	cFri7 VARCHAR(30) NULL,
	cFri8 VARCHAR(30) NULL,
	cFri9 VARCHAR(30) NULL,
	CONSTRAINT PK_TimeTable PRIMARY KEY (cID)
);

TABLE PIN;