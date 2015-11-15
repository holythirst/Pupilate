-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2015 at 01:18 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pupilate`
--

-- --------------------------------------------------------

--
-- Table structure for table `gen_aab`
--

CREATE TABLE IF NOT EXISTS `gen_aab` (
  `AutoNo` int(11) NOT NULL AUTO_INCREMENT,
  `cSSRNo` varchar(20) NOT NULL,
  `cSID` varchar(15) NOT NULL,
  `cClass` varchar(10) NOT NULL,
  `cSession` varchar(10) NOT NULL,
  `cTerm` varchar(10) NOT NULL,
  `cSubName` varchar(100) DEFAULT NULL, 
  `cCA1` int(11) DEFAULT NULL,
  `cCA2` int(11) DEFAULT NULL,
  `cExam` int(11) DEFAULT NULL,
  `cTotal` int(11) DEFAULT NULL,
  `cGrade` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AutoNo`),
  KEY `FK_Class_GTS_cSID` (`cSID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gen_aab`
--


-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cHistory` varchar(3500) DEFAULT NULL,
  `cSSRNo` varchar(20) NOT NULL,
  PRIMARY KEY (`cID`),
  KEY `FK_History_cSSRNo` (`cSSRNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `history`
--


-- --------------------------------------------------------

--
-- Table structure for table `loginlog`
--

CREATE TABLE IF NOT EXISTS `loginlog` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(20) DEFAULT NULL,
  `dDateIn` date DEFAULT NULL,
  `dDateOut` date DEFAULT NULL,
  `tTimeIn` time DEFAULT NULL,
  `tTimeOut` time DEFAULT NULL,
  PRIMARY KEY (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `loginlog`
--


-- --------------------------------------------------------

--
-- Table structure for table `paccesscard`
--

CREATE TABLE IF NOT EXISTS `paccesscard` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cPin` varchar(50) NOT NULL,
  `cType` varchar(10) NOT NULL,
  `cStatus` varchar(10) NOT NULL DEFAULT 'Unused',
  `cUser` varchar(20) NOT NULL DEFAULT 'Not Yet',
  `dUsageDate` date DEFAULT NULL,
  PRIMARY KEY (`cID`),
  UNIQUE KEY `wondercard_UNIQUE` (`cPin`),
  KEY `FK_pAccessCard` (`cUser`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `paccesscard`
--

INSERT INTO `paccesscard` (`cID`, `cPin`, `cType`, `cStatus`, `cUser`, `dUsageDate`) VALUES
(1, '4c26cc5cc638bcaebc1bd8b8e6a22ca5', 'Session', 'Used', 'student', '2015-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(50) NOT NULL,
  `cAbbr` varchar(10) DEFAULT NULL,
  `cDes` varchar(105) DEFAULT NULL,
  `cSSRNo` varchar(20) NOT NULL,
  PRIMARY KEY (`cID`),
  UNIQUE KEY `cNamePosts_UNIQUE` (`cName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`cID`, `cName`, `cAbbr`, `cDes`, `cSSRNo`) VALUES
(1, 'Principal', '', '', 'OG/2010/765'),
(2, 'Nurse', 'Nurse', 'Medical personnel', 'OG/2010/765'),
(3, 'Security', 'Secty', 'Security man to help secure the school.', 'OG/2010/765');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `AutoNo` int(11) NOT NULL AUTO_INCREMENT,
  `cSSRNo` varchar(20) DEFAULT NULL,
  `cSujbect` varchar(100) NOT NULL,
  `cClass` varchar(20) NOT NULL,
  `cTopic` varchar(150) NOT NULL,
  `cSubTopic` varchar(150) NOT NULL,
  `cTeacherID` varchar(10) DEFAULT NULL,
  `cQuestion` varchar(200) NOT NULL,
  `iPix` blob,
  `cOpt1` varchar(250) NOT NULL,
  `cOpt2` varchar(250) NOT NULL,
  `cOpt3` varchar(250) NOT NULL,
  `cOpt4` varchar(250) NOT NULL,
  `cAns` varchar(5) NOT NULL,
  `dRegDate` date DEFAULT NULL,
  PRIMARY KEY (`AutoNo`),
  KEY `FK_Question_cSSRNo` (`cSSRNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `questions`
--


-- --------------------------------------------------------

--
-- Table structure for table `reg_cla`
--

CREATE TABLE IF NOT EXISTS `reg_cla` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cSSRNo` varchar(20) NOT NULL,
  `cSchool` varchar(12) NOT NULL,
  `cWing` varchar(2) NOT NULL,
  `cDep` varchar(15) NOT NULL,
  `cFName` varchar(10) NOT NULL,
  PRIMARY KEY (`cFName`),
  UNIQUE KEY `reg_cla_cID_UNIQUE` (`cID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reg_cla`
--

INSERT INTO `reg_cla` (`cID`, `cSSRNo`, `cSchool`, `cWing`, `cDep`, `cFName`) VALUES
(1, 'OG/2010/765', 'Basic 7', 'A', 'Junior', 'Basic 7A');

-- --------------------------------------------------------

--
-- Table structure for table `reg_cls_tut`
--

CREATE TABLE IF NOT EXISTS `reg_cls_tut` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cEID` varchar(15) DEFAULT NULL,
  `cSSRNo` varchar(20) NOT NULL,
  `cClass` varchar(30) DEFAULT NULL,
  `cSession` varchar(10) DEFAULT NULL,
  `cTerm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `FK_reg_tut_cEID` (`cSSRNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reg_cls_tut`
--

INSERT INTO `reg_cls_tut` (`cID`, `cEID`, `cSSRNo`, `cClass`, `cSession`, `cTerm`) VALUES
(1, '67', 'OG/2010/765', 'Basic 7A', '2015/2016', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reg_emp`
--

CREATE TABLE IF NOT EXISTS `reg_emp` (
  `AutoNo` int(11) NOT NULL AUTO_INCREMENT,
  `cEID` varchar(15) NOT NULL,
  `cTitle` varchar(15) DEFAULT NULL,
  `cSName` varchar(20) DEFAULT NULL,
  `cFName` varchar(20) DEFAULT NULL,
  `cOName` varchar(20) DEFAULT NULL,
  `cSSRNo` varchar(20) NOT NULL,
  `cSex` varchar(10) DEFAULT NULL,
  `dDOB` date DEFAULT NULL,
  `cState` varchar(20) DEFAULT NULL,
  `cHAddress` varchar(100) DEFAULT NULL,
  `cPhone` varchar(30) DEFAULT NULL,
  `cEmail` varchar(70) DEFAULT NULL,
  `cMTongue` varchar(20) DEFAULT NULL,
  `cDis` varchar(30) DEFAULT NULL,
  `dDOA` date DEFAULT NULL,
  `cPAI` varchar(50) DEFAULT 'Staff',
  `cCurPost` varchar(50) DEFAULT 'Staff',
  `cStatus` varchar(15) DEFAULT 'Active',
  `cRefName` varchar(50) DEFAULT NULL,
  `cRefPhone` varchar(30) DEFAULT NULL,
  `cRefAdd` varchar(100) DEFAULT NULL,
  `iPass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AutoNo`),
  UNIQUE KEY `cEID_reg_emp_UNIQUE` (`cEID`),
  KEY `FK_reg_emp_cSSRNo` (`cSSRNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `reg_emp`
--

INSERT INTO `reg_emp` (`AutoNo`, `cEID`, `cTitle`, `cSName`, `cFName`, `cOName`, `cSSRNo`, `cSex`, `dDOB`, `cState`, `cHAddress`, `cPhone`, `cEmail`, `cMTongue`, `cDis`, `dDOA`, `cPAI`, `cCurPost`, `cStatus`, `cRefName`, `cRefPhone`, `cRefAdd`, `iPass`) VALUES
(1, '65576', NULL, 'Agfhg', 'fufuygig', 'fuygfytfui', 'OG/2010/765', 'Male', '2015-10-07', 'Abuja FCT', 'fgihooh ojpoiu f ugihijp uhu', '768978675657889', 'bh@hiuh.com', 'hiuhoi', 'none', '0000-00-00', 'Staff', 'Staff', 'Active', 'hiugigugiu uihigyf', '7689008978', 'ufgiuoupio ufyguihijo gyuiho', 'OG/2010/765/65576_fufuygig.jpg'),
(2, '655754', NULL, 'Agfhg', 'fufuygig', 'fuygfytfui', 'OG/2010/765', 'Male', '2015-10-07', 'Abuja FCT', 'uyyhiu fgioihoiutd oihiyuyrdytufyi', '768978675657889', 'bh@hiuh.com', 'hiuhoi', 'none', '0000-00-00', 'Staff', 'Staff', 'Active', 'hiugigugiu uihigyf', '7689008978', 'ufygug yrdtyfug hohud fuy', 'OG/2010/765/655754_fufuygig.jpg'),
(3, '67', NULL, 'hd', 'gga', 'hstr', 'OG/2010/765', 'Male', '2015-10-01', 'Abuja FCT', 'yuiughoi ougutyguoh', '65678789098', 'huho@hoih.com', 'tfuyugihipjoi', 'none', '0000-00-00', 'Staff', 'Staff', 'Active', 'ade fola', '567687897', 'vuyfvuyubuu khjnguy', 'OG/2010/765/67_gga.jpg'),
(4, '768', NULL, 'ouyiiu', 'kgiip', 'jpiupo', 'OG/2010/765', 'Male', '2000-12-12', 'Abuja FCT', 'fgiguh iuhojiouig iuoihjp', '345678908', 'uiecihioi@yahoo.com', 'guuiho', 'none', '0000-00-00', 'Staff', 'Staff', 'Active', 'gihoohoio uhu', '56787865', 'fuyh utfghojpi uyguhoi', 'OG/2010/765/768_kgiip.jpg'),
(5, '76867', NULL, 'ouyiiu', 'kgiip', 'jpiupo', 'OG/2010/765', 'Male', '2000-12-12', 'Jigawa', 'vjhvb igh i octuy guhopj p', '345678908', 'uiecihioi@yahoo.com', 'guuiho', 'none', '0000-00-00', 'Staff', 'Staff', 'Active', 'gihoohoio uhu', '56787865', 'fuyghu yiuhjoiu fyy guho yft', 'OG/2010/765/76867_kgiip.gif'),
(6, '67759yi', NULL, 'hd', 'gga', 'hstr', 'OG/2010/765', 'Male', '2015-10-01', 'Borno', 'kjbkhvb hjhbkjknjhg', '65678789098', 'huho@hoih.com', 'tfuyugihipjoi', 'none', '0000-00-00', 'Staff', 'Staff', 'Active', 'ade fola', '567687897', 'vhghhjvbkj gcjhkbjnl gjh', 'OG/2010/765/67759yi_gga.jpg'),
(7, '0988i', NULL, 'jvhuf', 'fuyft', 'yfuuy', 'OG/2010/765', 'Male', '2015-10-15', 'Edo', 'ouhuo hio hjpougujoguhohli', '54678908765', 'huho@hoih.com', 'hopjou', 'none', '0000-00-00', 'Staff', 'Staff', 'Active', 'ughiojpo', '567890876', 'gohijp uoihjpkpj p[kpoiho', 'OG/2010/765/0988i_fuyft.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reg_sch`
--

CREATE TABLE IF NOT EXISTS `reg_sch` (
  `AutoNo` int(11) NOT NULL AUTO_INCREMENT,
  `cSSRNo` varchar(20) NOT NULL,
  `cSName` varchar(80) NOT NULL,
  `cAddress` varchar(150) NOT NULL,
  `cState` varchar(50) NOT NULL,
  `cPhoneNo1` varchar(50) NOT NULL,
  `cPhoneNo2` varchar(50) DEFAULT NULL,
  `cEmail` varchar(50) DEFAULT NULL,
  `cWeb` varchar(50) DEFAULT NULL,
  `iLogo` varchar(40) DEFAULT NULL,
  `dRegDate` date DEFAULT NULL,
  PRIMARY KEY (`cSSRNo`),
  UNIQUE KEY `reg_sch_auto_UNIQUE` (`AutoNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `reg_sch`
--

INSERT INTO `reg_sch` (`AutoNo`, `cSSRNo`, `cSName`, `cAddress`, `cState`, `cPhoneNo1`, `cPhoneNo2`, `cEmail`, `cWeb`, `iLogo`, `dRegDate`) VALUES
(1, 'OG/2010/765', 'Holythirst College', 'Onikolobo Abeokuta', 'Ogun', '+2348030765226', '+2348091805221', 'holythirst@yahoo.com', 'www.holythirst.com', 'images/sch/OG/2010/765', '2015-07-17'),
(2, 'FCT/2014/002', 'Gandoki College', 'Gandoki street Garki', 'Abuja FCT', '687900876567890', '5678987656789', 'gandoki@school.com', 'www.gandoki.com', 'ÿØÿà\0JFIF\0\0\0\0\0\0ÿþ\0;CREATOR: gd-jpeg', '2015-10-03'),
(3, 'KG/2011/043', 'uiohjpojiiy iuhoihGIU', 'ihojkp[ ihiuoihojp', 'Kogi', '687900876567890', '467897966546789', 'hoih@ih.com', 'www.yuioouiijpo.com', 'images/sch/3dce1fce9ac06d1349dfbd9186289', '2015-10-03'),
(4, 'FCT/2014/2448', 'Suki International College', 'Suki Drive, Asokoro, Abija', 'Abuja FCT', '67687685867', '5876858758758', 'info@sukicollege.com', 'www.sukicollege.com', 'img/sch/3dce1fce9ac06d1349dfbd9186289385', '2015-10-16'),
(5, 'Admin', 'Super Power', '', '', '', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reg_ses`
--

CREATE TABLE IF NOT EXISTS `reg_ses` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cSSRNo` varchar(20) NOT NULL,
  `cFName` varchar(10) NOT NULL,
  `dStart` date DEFAULT NULL,
  `dEnd` date DEFAULT NULL,
  `cStatus` varchar(10) NOT NULL,
  `dExpire` date NOT NULL,
  PRIMARY KEY (`cID`),
  KEY `FK_reg_ses_cSSRNo` (`cSSRNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `reg_ses`
--

INSERT INTO `reg_ses` (`cID`, `cSSRNo`, `cFName`, `dStart`, `dEnd`, `cStatus`, `dExpire`) VALUES
(1, 'OG/2010/765', '2015/2016', NULL, NULL, 'Open', '2015-11-15'),
(2, 'FCT/2014/2448', '2014/2015', NULL, NULL, 'Open', '2015-11-20'),
(3, 'Admin', '2000/2100', NULL, NULL, 'Open', '2020-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `reg_stu`
--

CREATE TABLE IF NOT EXISTS `reg_stu` (
  `cSID` varchar(30) NOT NULL,
  `cPSID` varchar(50) NOT NULL,
  `cSSRNo` varchar(20) NOT NULL,
  `cLName` varchar(20) NOT NULL,
  `cFName` varchar(20) NOT NULL,
  `cOName` varchar(20) DEFAULT NULL,
  `cSex` varchar(10) DEFAULT NULL,
  `dDOB` date DEFAULT NULL,
  `dDOA` date DEFAULT NULL,
  `cPhone` varchar(20) DEFAULT NULL,
  `cAddress` varchar(150) DEFAULT NULL,
  `cState` varchar(10) DEFAULT NULL,
  `cClass1` varchar(10) DEFAULT NULL,
  `cClass2` varchar(10) DEFAULT NULL,
  `cSession` varchar(10) DEFAULT NULL,
  `cPGName` varchar(50) DEFAULT NULL,
  `cPGPhone` varchar(20) DEFAULT NULL,
  `cEmail` varchar(50) DEFAULT NULL,
  `cPGAddress` varchar(150) DEFAULT NULL,
  `iPass` varchar(50) DEFAULT NULL,
  `dRegDate` date DEFAULT NULL,
  PRIMARY KEY (`cSID`),
  UNIQUE KEY `cEID_UNIQUE` (`cSID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_stu`
--

INSERT INTO `reg_stu` (`cSID`, `cPSID`, `cSSRNo`, `cLName`, `cFName`, `cOName`, `cSex`, `dDOB`, `dDOA`, `cPhone`, `cAddress`, `cState`, `cClass1`, `cClass2`, `cSession`, `cPGName`, `cPGPhone`, `cEmail`, `cPGAddress`, `iPass`, `dRegDate`) VALUES
('002', 'OG/2010/765/002', 'OG/2010/765', 'uiubi', 'biuu', 'hoijp', 'Female', '2000-12-12', NULL, NULL, NULL, 'Abuja FCT', 'Basic 7A', 'Basic 7A', '2015/2016', 'mpj u o', '0987789098', 'uiecihioi@yahoo.com', 'jhoi oubhoipoj oiviuoihj oiyf8ygiuo ihiy guiho iyguh', 'img/stu/_Passport.NOW.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reg_sub_tut`
--

CREATE TABLE IF NOT EXISTS `reg_sub_tut` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cEID` varchar(15) DEFAULT NULL,
  `cSSRNo` varchar(20) NOT NULL,
  `cSubject` varchar(100) DEFAULT NULL,
  `cSession` varchar(10) DEFAULT NULL,
  `cTerm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `FK_reg_tut_cEID` (`cSSRNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reg_sub_tut`
--

INSERT INTO `reg_sub_tut` (`cID`, `cEID`, `cSSRNo`, `cSubject`, `cSession`, `cTerm`) VALUES
(1, '768', 'OG/2010/765', 'Mathematics', '2015/2016', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reg_tut`
--

CREATE TABLE IF NOT EXISTS `reg_tut` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cEID` varchar(15) DEFAULT NULL,
  `cSSRNo` varchar(20) NOT NULL,
  `cStatus` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `FK_reg_tut_cEID` (`cSSRNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reg_tut`
--

INSERT INTO `reg_tut` (`cID`, `cEID`, `cSSRNo`, `cStatus`) VALUES
(1, '655754', 'OG/2010/765', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `scoresetup`
--

CREATE TABLE IF NOT EXISTS `scoresetup` (
  `cScoreID` int(11) NOT NULL AUTO_INCREMENT,
  `cCANo` int(11) NOT NULL,
  `cCADiv` varchar(20) NOT NULL,
  `cSCA` int(11) DEFAULT NULL,
  `cSExam` int(11) DEFAULT NULL,
  `cSTerm` int(11) DEFAULT NULL,
  `cPromo` int(11) DEFAULT NULL,
  `cPass` double DEFAULT NULL,
  `cTPass` int(11) DEFAULT NULL,
  PRIMARY KEY (`cScoreID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `scoresetup`
--


-- --------------------------------------------------------

--
-- Table structure for table `statecode`
--

CREATE TABLE IF NOT EXISTS `statecode` (
  `cCode` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(100) DEFAULT NULL,
  `cAbbr` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cCode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `statecode`
--

INSERT INTO `statecode` (`cCode`, `cName`, `cAbbr`) VALUES
(1, 'Abia', 'ABI'),
(2, 'Adamawa', 'ADA'),
(3, 'Akwa Ibom', 'AKI'),
(4, 'Anambra', 'ANA'),
(5, 'Bauchi', 'BAU'),
(6, 'Bayelsa', 'BAY'),
(7, 'Benue', 'BEN'),
(8, 'Borno', 'BOR'),
(9, 'Cross River', 'CRR'),
(10, 'Delta', 'DEL'),
(11, 'Ebonyi', 'EBO'),
(12, 'Edo', 'EDO'),
(13, 'Ekiti', 'EKT'),
(14, 'Enugu', 'ENU'),
(15, 'FCT', 'FCT'),
(16, 'Gombe', 'GOM'),
(17, 'Imo', 'IMO'),
(18, 'Jigawa', 'JIG'),
(19, 'Kaduna', 'KAD'),
(20, 'Kano', 'KAN'),
(21, 'Katsina', 'KAT'),
(22, 'Kebbi', 'KEB'),
(23, 'Kogi', 'KOG'),
(24, 'Kwara', 'KWA'),
(25, 'Lagos', 'LAG'),
(26, 'Nassarawa', 'NAS'),
(27, 'Niger', 'NIG'),
(28, 'Ogun', 'OGU'),
(29, 'Ondo', 'OND'),
(30, 'Osun', 'OSU'),
(31, 'Oyo', 'OYO'),
(32, 'Plateau', 'PLA'),
(33, 'Rivers', 'RIV'),
(34, 'Sokoto', 'SOK'),
(35, 'Taraba', 'TAR'),
(36, 'Yobe', 'YOB'),
(37, 'Zamfara', 'ZAM');

-- --------------------------------------------------------

--
-- Table structure for table `subjectgroup`
--

CREATE TABLE IF NOT EXISTS `subjectgroup` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(20) NOT NULL,
  `cDes` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  UNIQUE KEY `cName_UNIQUE` (`cName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `subjectgroup`
--

INSERT INTO `subjectgroup` (`cID`, `cName`, `cDes`) VALUES
(1, 'General', 'General for all classes'),
(2, 'Kindergarten', 'General For all Kindergarten'),
(3, 'Kindergarten 1', 'Specific for Kindergarten 1'),
(4, 'Kindergarten 2', 'Specific for Kindergarten 2'),
(5, 'Kindergarten 3', 'Specific for Kindergarten 3'),
(6, 'Nursery', 'General for all Nursery'),
(7, 'Nursery 1', 'Specific for Nursery 1'),
(8, 'Nursery 2', 'Specific for Nursery 2'),
(9, 'Nursery 3', 'Specific for Nursery 3'),
(10, 'Basic', 'General for all Basic classes'),
(11, 'Basic 1 - 6', 'Specific for Basic 1 - 6'),
(12, 'Basic 1', 'Specific for Basic 1'),
(13, 'Basic 2', 'Specific for Basic 2'),
(14, 'Basic 3', 'Specific for Basic 3'),
(15, 'Basic 4', 'Specific for Basic 4'),
(16, 'Basic 5', 'Specific for Basic 5'),
(17, 'Basic 6', 'Specific for Basic 6'),
(18, 'Basic 7 - 9', 'Specific for Basic 7 - 9'),
(19, 'Basic 7', 'Specific for Basic 7'),
(20, 'Basic 8', 'Specific for Basic 8'),
(21, 'Basic 9', 'Specific for Basic 9'),
(22, 'Senior High', 'General For all Senior High'),
(23, 'Sciences', 'Specific for Science classes of Senior High 7 - 9'),
(24, 'Commercial', 'Specific for Commercial classes of Senior High 7 - 9'),
(25, 'Arts', 'Specific for Arts classes of Senior High 7 - 9'),
(26, 'Senior High 1', 'Specific for Senior High 1'),
(27, 'Senior High 2', 'Specific for Senior High 2'),
(28, 'Senior High 3', 'Specific for Senior High 3');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cSSRNo` varchar(20) DEFAULT NULL,
  `cName` varchar(100) DEFAULT NULL,
  `cCode` varchar(10) DEFAULT NULL,
  `cSubGroup` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `FK_SubjecT` (`cSubGroup`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`cID`, `cSSRNo`, `cName`, `cCode`, `cSubGroup`) VALUES
(1, 'OG/2010/765', 'Mathematics', 'Maths', 'General');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `AutoNo` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(60) DEFAULT NULL,
  `cSujbect` varchar(100) NOT NULL,
  `cClass` varchar(20) NOT NULL,
  `cNoOfQ` int(11) NOT NULL,
  `cCorrect` int(11) NOT NULL,
  `cIncorrect` int(11) NOT NULL,
  `cTotalPercent` double NOT NULL,
  `dTestDate` date NOT NULL,
  PRIMARY KEY (`AutoNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `test`
--


-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE IF NOT EXISTS `userdetails` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cPName` varchar(100) NOT NULL,
  `cSSRNo` varchar(20) NOT NULL,
  `cName` varchar(20) NOT NULL,
  `cPass` varchar(50) NOT NULL,
  `cType` varchar(20) NOT NULL,
  `cStatus` varchar(20) NOT NULL,
  `dExpiryDate` date NOT NULL,
  `cSecret` varchar(100) NOT NULL,
  `cAnswer` varchar(20) NOT NULL,
  PRIMARY KEY (`cID`),
  UNIQUE KEY `cName_UNIQUE` (`cName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`cID`, `cPName`, `cSSRNo`, `cName`, `cPass`, `cType`, `cStatus`, `dExpiryDate`, `cSecret`, `cAnswer`) VALUES
(1, 'Olamide IJADUOLA', 'Admin', 'admin', 'admin', 'Admin', 'Active', '2016-10-28', 'who be this', 'na me'),
(5, 'Dr. Olamide', 'OG/2010/765', 'olamide', 'e231a571c085aab2e949ac7589e2331a', 'School-Admin', 'Active', '2020-12-12', 'who u be?', 'na me'),
(7, 'Dr. Suki Okupe', 'FCT/2014/2448', 'sukiman', '6a45c0297ea1b2ae0e7e2259db48c05b', 'School-Admin', 'Active', '2020-12-12', 'who I be?', 'suki'),
(8, 'Prof. Kayode Akinniyi', 'FCT/2014/002', 'simplykay', '70421707e90e1a91733b1cfcd51a4935', 'School-Admin', 'Active', '2020-12-12', 'Who u b?', 'Kay'),
(9, 'Holythirst', 'Admin', 'holythirst', '6335bfc1cc40194015a7842630c8eb54', 'Admin', 'Active', '2016-11-01', 'Who u be?', 'Na me'),
(10, 'Student', 'OG/2010/765', 'student', 'cd73502828457d15655bbd7a63fb0bc8', 'Student', 'Active', '2016-10-28', 'Who u be?', 'Na me');

-- --------------------------------------------------------

--
-- Table structure for table `user_session`
--

CREATE TABLE IF NOT EXISTS `user_session` (
  `cCode` int(11) NOT NULL AUTO_INCREMENT,
  `cUserName` varchar(100) DEFAULT NULL,
  `dLogIn` datetime DEFAULT NULL,
  PRIMARY KEY (`cCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `wondercard`
--

CREATE TABLE IF NOT EXISTS `wondercard` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cPin` varchar(20) NOT NULL,
  `cType` varchar(10) NOT NULL,
  `cAmount` double NOT NULL,
  `cStatus` varchar(10) NOT NULL,
  `cUser` varchar(30) NOT NULL DEFAULT 'Not Yet',
  `dDate` date DEFAULT NULL,
  PRIMARY KEY (`cID`),
  UNIQUE KEY `wondercard_UNIQUE` (`cPin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wondercard`
--

