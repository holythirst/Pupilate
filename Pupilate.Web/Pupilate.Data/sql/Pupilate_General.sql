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

/*
TO do
View Minimum score/class,term,session
View Maximum score/class,term,session
*/

CREATE DATABASE Pupilate;
USE Pupilate;

/*

General - PUPILATE CONTROLLED

*/

CREATE TABLE StateCode
(
	cCode INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(100) NULL,
	cAbbr VARCHAR(10) NULL,
	UNIQUE INDEX UQStateCode (cCode),
    PRIMARY KEY (cName)
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

/*
	Sign Up 
*/

CREATE TABLE SignUp
(
	cID INT NOT NULL AUTO_INCREMENT,
    cFName VARCHAR(20) NOT NULL,
    cLName VARCHAR(20) NOT NULL,
    cEmail VARCHAR(20) NOT NULL,
    cTel VARCHAR(20) NOT NULL,
    cCountry VARCHAR(30) NOT NULL,
    cState VARCHAR(30) NOT NULL,
    cMode VARCHAR(30) NOT NULL,
    cInterest VARCHAR(30) NOT NULL, /*School or Agent*/
    cOrgName VARCHAR(30) NOT NULL, /*School or Company Name*/
    cOrgType VARCHAR(30) NOT NULL, /*School or Company Type*/
    cRole VARCHAR(30) NOT NULL, /*Role in Shool or Company*/
    cWebsite VARCHAR(30) NOT NULL, /*Admin or Sub-Admin or School-Admin or Parent or Student*/
    cMessage VARCHAR(30) NOT NULL, /*Any opinion about Pupilate*/
	dDate DATE NOT NULL,
    PRIMARY KEY (cID)
);

/*
	School Registration
*/
CREATE TABLE RegSchool
(
	AutoNo INT NOT NULL AUTO_INCREMENT,
    cSSRNo VARCHAR(30) NOT NULL,
    cSName VARCHAR(80) NOT NULL,
    cAddress VARCHAR(150) NOT NULL,
    cState VARCHAR(100) NOT NULL,
    cPhoneNo1 VARCHAR(50) NOT NULL,
    cPhoneNo2 VARCHAR(50) NULL,
    cEmail VARCHAR(50) NULL,
    cWeb VARCHAR(50) NULL,
	iLogo VARCHAR(40) NULL,
	dRegDate DATE NULL,
    dExpireDate DATE NULL,
    cType VARCHAR(40) NULL, /*Type of Package bought/subscribe to/in use*/
    UNIQUE INDEX UQRegschool (AutoNo ASC),
	CONSTRAINT FKRegschool FOREIGN KEY (cState) REFERENCES StateCode(cName),
    PRIMARY KEY (cSSRNo)
);
INSERT INTO RegSchool (cSSRNo, cSName, cAddress, cState, cPhoneNo1, cPhoneNo2, cEmail, cWeb, iLogo, dRegDate) VALUES ('OG/2010/765', 'Holythirst College','Onikolobo Abeokuta','Ogun','+2348030765226','+2348091805221','holythirst@yahoo.com','www.holythirst.com','images/sch/OG/2010/765', current_date());

/*School History*/
CREATE TABLE RegSchoolHistory
(
	cID INT NOT NULL AUTO_INCREMENT,
	cHistory VARCHAR(3500) NULL,
    cSSRNo VARCHAR(30) NOT NULL,
	PRIMARY KEY (cID),
    CONSTRAINT FKRegSchoolHistory FOREIGN KEY (cSSRNo) REFERENCES RegSchool (cSSRNo)
);

CREATE TABLE UserRole
(
	cID INT NOT NULL AUTO_INCREMENT,
	cUser VARCHAR(100) NOT NULL,
    cRole VARCHAR(100) NOT NULL,
	cUserInRole VARCHAR(100) NOT NULL,
    dCreatedDate DATE NOT NULL,
    dLastUpdateDate DATE NOT NULL,
    UNIQUE INDEX UQUserRole (cUser),
    PRIMARY KEY (cID)
);

/*
	User Details Registration
*/
CREATE TABLE UserDetails
(
	cID INT NOT NULL AUTO_INCREMENT,
	cPName VARCHAR(100) NOT NULL, /*Profile Name*/
	cUserName VARCHAR(20) NOT NULL,
	cPassword VARCHAR(20) NOT NULL,
    cEmail VARCHAR(50) NOT NULL,
	cType VARCHAR(50) NOT NULL, /*Admin or Sub-Admin or School-Admin or Parent or Student*/
	cStatus VARCHAR(20) NOT NULL,/*Active or not Active*/
    cSSRNo VARCHAR(30) NOT NULL,
	dExpiryDate DATE NOT NULL,
    dCreatedDate DATE NOT NULL,
    dLastUpdateDate DATE NOT NULL,
    UNIQUE INDEX UQUserDetails (cUserName),
    UNIQUE INDEX UQ2UserDetails (cEmail),
    CONSTRAINT FKUserDetails FOREIGN KEY (cSSRNo) REFERENCES RegSchool(cSSRNo),
    PRIMARY KEY (cID)
);
/*If the cType != Admin, then the cSSRNo will be the name of the database to be active*/
/*
INSERT INTO user_details  (cPName, cUserName, cPassword, cEmail, cType, cStatus, cSSRNo, dExpiryDate, dCreatedDate, dLastUpdateDate) values ('Olamide IJADUOLA', 'admin', 'admin', 'holythirst@yahoo.com', 'Admin','Active','2020/12/31','who be this','na me');
*/

/*Access Cards*/
CREATE TABLE AccessCard
(
	cID INT NOT NULL AUTO_INCREMENT,
    cPin VARCHAR(50) NOT NULL,
    cType VARCHAR(10) NOT NULL, /*Term or Session*/
    cStatus VARCHAR(10) NOT NULL DEFAULT 'Unused', /*Used or Unused*/
    cUser VARCHAR(20) NOT NULL DEFAULT 'Not Yet',
	dUsageDate DATE NULL,
    UNIQUE INDEX UQAccessCard (cID),
    CONSTRAINT FKAccessCard FOREIGN KEY (cUser) REFERENCES UserDetails(cUserName),
	PRIMARY KEY (cPIN)
);

CREATE TABLE SubjectGroup
(
	cID INT NOT NULL AUTO_INCREMENT,
	cName VARCHAR(20) NOT NULL,
	cDes VARCHAR(105) NULL,
    UNIQUE INDEX UQSubjectGroup (cName ASC),
	PRIMARY KEY (cID)
);

Insert Into SubjectGroup(cName , cDes) values ('General','General for all classes');
Insert Into SubjectGroup(cName , cDes) values ('Kindergarten','General For all Kindergarten');
Insert Into SubjectGroup(cName , cDes) values ('Kindergarten 1','Specific for Kindergarten 1');
Insert Into SubjectGroup(cName , cDes) values ('Kindergarten 2','Specific for Kindergarten 2');
Insert Into SubjectGroup(cName , cDes) values ('Kindergarten 3','Specific for Kindergarten 3');
Insert Into SubjectGroup(cName , cDes) values ('Nursery','General for all Nursery');
Insert Into SubjectGroup(cName , cDes) values ('Nursery 1','Specific for Nursery 1');
Insert Into SubjectGroup(cName , cDes) values ('Nursery 2','Specific for Nursery 2');
Insert Into SubjectGroup(cName , cDes) values ('Nursery 3','Specific for Nursery 3');
Insert Into SubjectGroup(cName , cDes) values ('Basic','General for all Basic classes');
Insert Into SubjectGroup(cName , cDes) values ('Basic 1 - 6','Specific for Basic 1 - 6');
Insert Into SubjectGroup(cName , cDes) values ('Basic 1','Specific for Basic 1');
Insert Into SubjectGroup(cName , cDes) values ('Basic 2','Specific for Basic 2');
Insert Into SubjectGroup(cName , cDes) values ('Basic 3','Specific for Basic 3');
Insert Into SubjectGroup(cName , cDes) values ('Basic 4','Specific for Basic 4');
Insert Into SubjectGroup(cName , cDes) values ('Basic 5','Specific for Basic 5');
Insert Into SubjectGroup(cName , cDes) values ('Basic 6','Specific for Basic 6');
Insert Into SubjectGroup(cName , cDes) values ('Basic 7 - 9','Specific for Basic 7 - 9');
Insert Into SubjectGroup(cName , cDes) values ('Basic 7','Specific for Basic 7');
Insert Into SubjectGroup(cName , cDes) values ('Basic 8','Specific for Basic 8');
Insert Into SubjectGroup(cName , cDes) values ('Basic 9','Specific for Basic 9');
Insert Into SubjectGroup(cName , cDes) values ('Senior High','General For all Senior High');
Insert Into SubjectGroup(cName , cDes) values ('Sciences','Specific for Science classes of Senior High 7 - 9');
Insert Into SubjectGroup(cName , cDes) values ('Commercial','Specific for Commercial classes of Senior High 7 - 9');
Insert Into SubjectGroup(cName , cDes) values ('Arts','Specific for Arts classes of Senior High 7 - 9');
Insert Into SubjectGroup(cName , cDes) values ('Senior High 1','Specific for Senior High 1');
Insert Into SubjectGroup(cName , cDes) values ('Senior High 2','Specific for Senior High 2');
Insert Into SubjectGroup(cName , cDes) values ('Senior High 3','Specific for Senior High 3');

CREATE TABLE LoginDetails
(
	cID INT NOT NULL AUTO_INCREMENT,
	cUserName VARCHAR(30) NULL,
	dDateIn DATE NULL,
	dDateOut DATE NULL,
	tTimeIn time NULL,
	tTimeOut time NULL,
    CONSTRAINT FKLoginDetail FOREIGN KEY (cUserName) REFERENCES UserDetails(cUserName),
    PRIMARY KEY (cID)
);