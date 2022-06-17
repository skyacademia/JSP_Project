CREATE SCHEMA `jspsql` ;

CREATE TABLE `jspsql`.`membertbl` (
  `mID` VARCHAR(45) NOT NULL,
  `mPW` VARCHAR(45) NOT NULL,
  `mName` VARCHAR(45) NOT NULL,
  `mTel` VARCHAR(45) NOT NULL,
  `mMail` VARCHAR(45) NULL,
  `mAddress` VARCHAR(45) NULL,
  `mText` VARCHAR(100) NULL,
  `mSkill` VARCHAR(100) NULL,
  PRIMARY KEY (`mID`));

CREATE TABLE `jspsql`.`posttbl` (
  `pID` VARCHAR(45) NOT NULL,
  `pTitle` VARCHAR(45) NOT NULL,
  `pWriter` VARCHAR(45) NOT NULL,
  `pPrice` VARCHAR(45) NOT NULL,
  `pText` TEXT(10000) NOT NULL,
  `pSikll` VARCHAR(45) NULL,	
  PRIMARY KEY (`pID`),
  FOREIGN KEY (pWriter) REFERENCES membertbl(mID) ON UPDATE CASCADE ON delete cascade
  );
  
  
  