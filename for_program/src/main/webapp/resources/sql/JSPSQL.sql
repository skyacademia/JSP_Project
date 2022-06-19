drop schema if exists `jspsql`;
CREATE SCHEMA `jspsql` ;

-- 회원 테이블
CREATE TABLE `jspsql`.`membertbl` (
  `mID` VARCHAR(45) NOT NULL,			-- 아이디, 기본키
  `mPW` VARCHAR(45) NOT NULL,			-- 비밀번호
  `mName` VARCHAR(45) NOT NULL,			-- 회원명
  `mTel` VARCHAR(45) NOT NULL,			-- 연락처
  `mMail` VARCHAR(45) NULL,				-- 이메일
  `mAddress` VARCHAR(45) NULL,			-- 주소
  `mText` Text(100) NULL,				-- 자기소개
  `mCompany` VARCHAR(100),			-- 소속된 회사명
  `mThum` VARCHAR(100) NULL,			-- 업로드할 이미지 썸네일명
  
-- `mSkill` VARCHAR(100) NULL, 은 기술 스택을 1개만 등록할 수 있음,, 	
-- 기술 스택 3개까지 담기 위해
-- mSkill 사용 안하고
-- 기술 테이블을 새로 작성하겠음...
  PRIMARY KEY (`mID`));
  
  
  
  
  
--  기술 스택 테이블
   CREATE TABLE `jspsql`.`skilltbl` (
  `sMemberID` VARCHAR(45) NOT NULL,					-- 해당 기술을 가진 멤버, 외래키, 기본키
  `sSkill1`	VARCHAR(20) NOT NULL,					-- 기술스택1 NOT NULL
  `sSkill2`	VARCHAR(20) NULL,						-- 기술스택2 널 가능
  `sSkill3`	VARCHAR(20) NULL,						-- 기술스택3 널 가능
  
-- 여기서 기술스택 1, 2, 3 모두 같은 스택을 넣을 수 있는 문제가 있음... ex) Java, Java, Java 
-- 데이터를 불러올때 같은 값이면 불러오지 않게 if문 처리를 해 해결 하려고 하지만 더 좋은 방법 있으면 수정점....
 
  PRIMARY KEY (sMemberID),
  FOREIGN KEY (sMemberID) REFERENCES membertbl(mID) ON UPDATE CASCADE ON delete cascade
  );
  
  --  포스터 테이블
  CREATE TABLE `jspsql`.`posttbl` (
  `pID` int NOT NULL auto_increment,					-- 포스터아이디, 기본키
  `pTitle` VARCHAR(45) NOT NULL,				-- 제목
  `pWriter` VARCHAR(45) NOT NULL,				-- 글쓴이, 외래키 
  `pPrice` VARCHAR(45) NOT NULL,				-- 가격
  `pText` TEXT NOT NULL,						-- 포스팅 글
  `pSkillText` TEXT NOT NULL,					-- 기술 소개
  `pCategory` VARCHAR(45) NOT NULL,				-- 포스터 카테고리
  `pImageName` VARCHAR(45) NULL,				-- 업로드 이미지 명, 업로드한게 없다면 NULL -> 기본이미지를 띄우기
  
  PRIMARY KEY (`pID`),
  FOREIGN KEY (pWriter) REFERENCES membertbl(mID) ON UPDATE CASCADE ON delete cascade
  );
  
  
  
-- 리뷰 테이블
CREATE TABLE `jspsql`.`reviewtbl` (
  `rID` INT NOT NULL auto_increment,			-- 리뷰ID  기본키때문에 만든것,, 쓰이진 않을듯
  `rWriter` VARCHAR(45) NOT NULL,				-- 리뷰 작성자ID, 외래키
  `rPosterID` int NOT NULL,						-- 포스터ID
  `rScore` FLOAT  NOT NULL,						-- 리뷰점수
  `rText` text NOT NULL,					-- 가격
  PRIMARY KEY (`rID`),
  FOREIGN KEY (rWriter) REFERENCES membertbl(mID) ON UPDATE CASCADE ON delete cascade
  );
  
 
  use `jspsql`;
 
 -- membertbl 초기화
insert into membertbl values ("kys","1234","김예성","01011111111","temp1@naver.com","인천 부평구 머시깽이 거시기 어쩌구 저쩌구","이건 왜있는건가요? 잘 모르겟네요! 이건 왜있는건가요? 잘 모르겟네요!  이건 왜있는건가요? 잘 모르겟네요!","KAKAO","thumnail.png");
insert into membertbl values ("kms","1234","김민섭","01022222222","temp2@naver.com","서울 부평구 머시깽이 거시기 어쩌구 저쩌구","이건 왜있는건가요? 잘 모르겟네요!","KAKAO",null);
insert into membertbl values ("bdh","1234","배동훈","01033333333","temp3@naver.com","경기 부평구 머시깽이 거시기 어쩌구 저쩌구","이건 왜있는건가요? 잘 모르겟네요!","당근마켓",null);
insert into membertbl values ("kmj","1234","김미준","01044444444","temp4@naver.com","충북 부평구 머시깽이 거시기 어쩌구 저쩌구","이건 왜있는건가요? 잘 모르겟네요!","애플",null);
insert into membertbl values ("imp","1234","이무표","01055555555","temp5@naver.com","부산 부평구 머시깽이 거시기 어쩌구 저쩌구","이건 왜있는건가요? 잘 모르겟네요!","테슬라",null);


-- skilltbl 초기화
insert into skilltbl values ("kys","Java",null,null);
insert into skilltbl values ("kms","Cpp","Python",null);
insert into skilltbl values ("bdh","Python","Python","Unity");	-- 파이썬 두개 이렇게 중복이 들어갈 수가 있다..
insert into skilltbl values ("kmj","C","Python","JavaScript");
insert into skilltbl values ("imp","Cpp","Python","JavaScript");



-- reviewtbl 초기화
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("imp",1,5,"아 정말 좋은 회사입니다. 정말 인정인정~");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("imp",3,5,"아 킹아킹아 좋은 회사입니다. 정말 인정인정~");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("imp",1,5,"아 정말정정말말 좋은 회사입니다. 정말 인정인정~");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kys",6,4.5,"위에사람 매크로 쩌네 ㅡㅡ");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("bdh",6,5,"너무 좋은 회사.. 여기에 외주맡기세요");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kms",6,1,"다 돈주고 샀네 사기임 여기 하지마삼");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kys",3,4.5,"나이스 킹아킹아");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kmj",3,5,"너무 좋은 회사.. 내가 꼭 들어가고 말꺼야");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kms",3,1,"다 돈주고 샀네 사기임 여기 하지마삼");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("imp",1,3.7,"아 정말 좋은 회사입니다. 정말 인정인정~");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("imp",3,5,"아 킹아킹아 좋은 회사입니다. 정말 인정인정~");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("imp",1,2.2,"아 정말정정말말 좋은 회사입니다. 정말 인정인정~");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kys",6,4.5,"위에사람 매크로 쩌네 ㅡㅡ");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("bdh",6,5,"너무 좋은 회사.. 여기에 외주맡기세요");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kms",6,1,"다 돈주고 샀네 사기임 여기 하지마삼");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kys",3,4.5,"나이스 킹아킹아");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kmj",3,5,"너무 좋은 회사.. 내가 꼭 들어가고 말꺼야");
insert into reviewtbl(rWriter, rPosterID, rScore, rText) values ("kms",3,1,"다 돈주고 샀네 사기임 여기 하지마삼");




-- posttbl 초기화
insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName) values ("만능 개발자 구하시나요? 클릭클릭!","kys","500000",
"모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... ",
"모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...",
"인공지능","thumnail.png");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName) values ("다비켜! 전설 유니크 에픽 개발자가 나가신다!","kms","5000000",
"모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... ",
"모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...",
"데이터사이언스","thumnail2.png");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName) values ("모두 주목! 나는 한번만 말한다 클릭해라..","bdh","50000000",
"모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... ",
"모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...",
"프론트엔드",null);

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName) values ("만족도 500퍼센터 여러분 기대하셔도 좋습니다.","kmj","100000",
"모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 

모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 

모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 

모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 

모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... ",
"모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...",
"백엔드",null);

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName) values ("클릭클릭!","imp","50000",
"모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 
모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... 모시깽이... ",
"모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...
모시깽이2...모시깽이2...모시깽이2...모시깽이2...",
"풀스택",null);