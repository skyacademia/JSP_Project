drop schema if exists `jspsql`;
CREATE SCHEMA `jspsql` ;
use `jspsql`;
-- 회원 테이블
CREATE TABLE `jspsql`.`membertbl` (
  `mID` VARCHAR(45) NOT NULL,			-- 아이디, 기본키
  `mPW` Text NOT NULL,			-- 비밀번호
  `mName` VARCHAR(45) NOT NULL,			-- 회원명
  `mTel` VARCHAR(45) NOT NULL,			-- 연락처
  `mMail` VARCHAR(45) NULL,				-- 이메일
  `mAddress` VARCHAR(45) NULL,			-- 주소
  `mText` Text NULL,				-- 자기소개
  `mCompany` VARCHAR(100),			-- 소속된 회사명
  `mThum` VARCHAR(100) default 'defaultMember.png',			-- 업로드할 이미지 썸네일명
  `mSkill` VARCHAR(100) NULL   ,

  PRIMARY KEY (`mID`));
  
  --  포스터 테이블
  CREATE TABLE `jspsql`.`posttbl` (
  `pID` int NOT NULL auto_increment,					-- 포스터아이디, 기본키
  `pTitle` VARCHAR(45) NOT NULL,				-- 제목
  `pWriter` VARCHAR(45) NOT NULL,				-- 글쓴이, 외래키 
  `pPrice` VARCHAR(45) NOT NULL,				-- 가격
  `pText` TEXT NOT NULL,						-- 포스팅 글
  `pSkillText` TEXT NOT NULL,					-- 기술 소개
  `pCategory` VARCHAR(45) NOT NULL,				-- 포스터 카테고리
  `pImageName` VARCHAR(45) NULL DEFAULT "basicThumnail.png",				-- 업로드 이미지 명, 업로드한게 없다면 NULL -> 기본이미지(basicThumnail.png)를 띄우기
  `pTime` date default (current_date),
  PRIMARY KEY (`pID`),
  FOREIGN KEY (pWriter) REFERENCES membertbl(mID) ON UPDATE CASCADE ON delete cascade
  );

-- 리뷰 테이블
CREATE TABLE `jspsql`.`reviewtbl` (
  `rID` INT NOT NULL auto_increment,			-- 리뷰ID  기본키때문에 만든것,, 쓰이진 않을듯
  `rWriter` VARCHAR(45) NOT NULL,				-- 리뷰 작성자ID, 외래키
  `rPosterID` int NOT NULL,						-- 포스터ID
  `rScore` FLOAT  NOT NULL,						-- 리뷰점수
  `rText` text NOT NULL,					-- 
  `rTime` date default (current_date),
  PRIMARY KEY (`rID`),
  FOREIGN KEY (rWriter) REFERENCES membertbl(mID) ON UPDATE CASCADE ON delete cascade
  );
  
 -- 구매 테이블
 CREATE TABLE `jspsql`.`buytbl`(
	`bID` INT NOT NULL auto_increment,
    `bUser` VARCHAR(45) NOT NULL,
    `bSellUser` varchar(45) not null,   -- 판매자 = pWriter
    `bPosterID` int NOT NULL,
    `bPrice` VARCHAR(45) NOT NULL,
    `bTel` VARCHAR(45) NOT NULL,
    `bEmail` VARCHAR(45) NOT NULL,
    `bText` TEXT NULL,
  `bTime` date default (current_date),
  `bSellTel` varchar(45),
  `bSellMail` varchar(45),
  `bSellTitle` varchar(45),
    PRIMARY KEY(`bID`),
  FOREIGN KEY (bUser) REFERENCES membertbl(mID) ON UPDATE CASCADE,
  FOREIGN KEY (bPosterID) REFERENCES posttbl(pID) ON UPDATE CASCADE
 
 );
 
 
 
  use `jspsql`;
 
 -- membertbl 초기화
insert into membertbl values ("kys","100500800900d00100600b00a00800000f00900500e00300d00400900700d00c00500400200900700100a00500500b00","김예성","01011111111","temp1@naver.com","기에나의 바다 남동쪽에 림레이크 북섬",'안녕하세요. MAKEHOMES DESIGN 입니다.

메이크홈즈는

* 한국언론진흥재단 "2019 정부광고협력사"
* 중소벤처기업부 "2019 성과공유도입기업"
* 청년창업센터 "CEO육성사업 9기"
* 청년창업CEO "청년창업 우수파트너"
* 행정안전부 "2019년 지역주도형 청년일자리 참여수기 공모전" 창업생태계조성형 분야 은상 수상

"디자이너7명, 기획1명, 아트디렉터1명으로 구성된 홈페이지제작, 웹디자인, 편집디자인,로고디자인,웹에이전시입니다.',"KAKAO","pimg1.png","JAVA");
insert into membertbl values ("kms","100500800900d00100600b00a00800000f00900500e00300d00400900700d00c00500400200900700100a00500500b00","김민섭","01022222222","temp2@naver.com","청공섬 엘가시아","안녕하세요
For Program 개발자 SEAN 입니다.
문의사항이 있으시면 메시지 남겨주세요~","KAKAO","pimg2.png","C++");
insert into membertbl values ("bdh","100500800900d00100600b00a00800000f00900500e00300d00400900700d00c00500400200900700100a00500500b00","배동훈","01033333333","temp3@naver.com","아크라시아 서남단 파푸니카 섬","안녕하세요. 친절한전문가 입니다. 

IT 대기업에서 근무 중이며 데이터베이스 및 데이터 다루기를 전문적으로 하고 있습니다.

고객님의 만족을 위해 최선을 다할것이며 만족하지 못하신다면 전액 환불도 해드립니다.

많이 이용해주세요 

감사합니다.","당근마켓","pimg3.png","PYTHON");
insert into membertbl values ("kmj","100500800900d00100600b00a00800000f00900500e00300d00400900700d00c00500400200900700100a00500500b00","김미준","01044444444","temp4@naver.com","베른 남부 벨리온 유적지","사용언어 >> 파이썬, 매트랩

GUI 프로그래밍
데이터 취득/처리/관리
장비 통신
매크로","애플","pimg4.png","KOTLIN");
insert into membertbl values ("imp","100500800900d00100600b00a00800000f00900500e00300d00400900700d00c00500400200900700100a00500500b00","이무표","01055555555","temp5@naver.com","칸다리아 영지","다양한 실무 현장에서 업무를 자동화할 수 있는 매크로 프로그램을 제작하였습니다. 친절한 상담을 통해 고객님이 업무를 완벽히 지원할 수 있는 편리한 프로그램을 만들 수 있도록 하겠습니다. 

파이썬 활용 업무자동화 프로그램 제작 전문

파이썬 셀레니움을 활용한 웹브라우저 기반 실시간 데이터 수집, 웹사이트 내 반복적 업무 수행 매크로 제작","테슬라",default,"JAVA SPRING");





-- reviewtbl 초기화
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("imp",1,5,"작업물 퀄리티 너무 훌륭합니다.  
친절하고 스피디 하게 진행해 주셔서  진심으로 감사드립니다.
다음에 또 의뢰드릴께요~","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("imp",3,5,"진짜 많은곳들을 봣지만 여기가 제일 퀄리티 최고...감사해요","2022-05-21");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("imp",1,5,"홈페이지 관련 경험이 많지 않았는데 차근차근 설명해주시며 홈페이지 멋있고 빠르게 제작해주셨습니다. ㅎㅎ
완전 추천합니다!!","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kys",6,4.5,"까다로운 업무들이었는데 일정안에 잘 마무리해주셔서 감사합니다. 추천드리는 업체에요 ^^","2022-06-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("bdh",6,5,"너무 좋은 회사.. 여기에 외주맡기세요","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kms",6,1,"늦은 밤까지 고생해주셔서 고마웠어요.^^","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kys",3,4.5,"무엇보다 커뮤니케이션이 원활하였고 책임감있게 업무를 진행해주셔서 믿을 수 있었습니다.","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kmj",3,5,"다양한 요구사항들을 잘 응대해주셔서 감사합니다. 다음에 또 이용하겠습니다.","2022-05-27");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kms",3,5,"bdh님 짱 너무조아요 ! 감사합니다 :)","2022-06-21");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("imp",1,3.7,' "전문가는 시작부터 달라야한다" 라는 생각이 확 듭니다.
건물을 짓는다라고 생각했을때
시공은 누구나 몸으로 때울 수 있지만
해당 건물의 용도와 컨셉에 맞는 설계는 전문가만 가능합니다.

시작부터 정말 전문가답게 컨설팅 해주셔서 
너무 감사합니다.

잘되서 꼭 보답하도록 하겠습니다 :)',"2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("imp",3,5,"손도 빠르시고 답장도 빠르시고 친절하세요 ! 감사합니다 기회가 된다면 재의뢰하고싶어요","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("imp",1,2.2,"빠른 대응과 기획, 디자인 한것을 토대로 정확하게 퍼블리싱 해주셨습니다~ 기회가 있으면 또 이용할것입니다^^","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kys",6,4.5,"늘 문제가있을때 찾게되는 해결사님이세요! 너무 친절하시고 빠르시고 짱짱! 감사합니다:-)","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("bdh",6,5,"너무 좋은 회사.. 여기에 외주맡기세요","2022-05-22");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kms",6,1,"최고최고최고최고최고","2022-05-21");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kys",3,4.5,"너무 너무 너무너무 잘해주셔서 너무 감사드립니다!","2022-05-25");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kmj",3,5,"솔직히 너무 잘해주셔서 나만 알고 싶은데 
이 분은 더 알려져야 해요..","2022-06-01");
insert into reviewtbl(rWriter, rPosterID, rScore, rText, rTime) values ("kms",3,1,"부탁 드린거 너무 완벽하게 잘 해주셨어요 감사합니다!","2022-06-30");




-- posttbl 초기화
insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("웹사이트 퍼블리싱해 드립니다.","kms","50000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p><br></p><p>안녕하세요 도순입니다.</p><p><br></p><p>여러 프로젝트 경험이 있으며, 고객님들이 원하시는대로 퍼블리싱 작업을 해드리겠습니다.</p><p><br></p><p>궁금한 점이 있으시면 언제든지 문의주세요.</p><p>결제 전 메세지로 상담 부탁드립니다.</p><p><br></p><p><strong>작업비용안내</strong></p><p><br></p><p>1. 서브페이지 PC퍼블리싱 = 20,000원 (1일)</p><p>2. 메인페이지 PC퍼블리싱 = 50,000원 (2일)</p><p>3. 서브페이지 반응형 퍼블리싱 = 30,000원 (1일)</p><p>4. 메인페이지 반응형 퍼블리싱 = 70,000원 (2일)</p><p>5. 그외에 다른 사항은 문의주세요</p><p><br></p><p><strong>수정작업안내</strong></p><p><br></p><p>요구사항 미반영된 부분 혹은 버그/오류는</p><p>횟수차감없이 A/S해드리고 있으며,</p><p><br></p><p>2회에 한해 단순 텍스트/이미지 변경 수정 가능합니다.</p></div>',
"3000px이내  1페이지 기준
서브페이지 30,000원
메인페이지 60,000원.",
"프론트엔드","img1.png","2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("데이터 수집 / 업무 자동화 프로그램을 제작해 드립니다.","bdh","20000",
'<div class="css-qopeqa e1rfybc42"><p>1. 데이터 수집 </p><p>- SNS 데이터, 쇼핑몰 데이터, 뉴스 데이터 수집</p><p><br></p><p>2. 데이터 표준화</p><p>- 엑셀 등과 같은 정형데이터 등을 DB로 업로드</p><p>- 필요한 형태로 데이터 변형 및 집계</p><p><br></p><p>3. 데이터 및 업무 자동화</p><p>- 데이터 수집 및 기타 업무에 대한 자동화</p><p>- 스케줄링 및 업무 최적화 </p><p><br></p></div><div class="css-qopeqa e1rfybc42"><p>1. 상담을 통해 필요한 업무 정의</p><p>2. 필요한 업무에 대한 상세한 견적 결정</p><p>3. 작업 수행</p><p>4. 작업 결과를 보고 피드백 수렴</p><p><br></p></div><div class="css-qopeqa e1rfybc42"><p>1. 데이터 수집에 대한 대상 정의</p><p>2. 데이터 표준화를 위한 데이터 정의</p><p>3. 업무 자동화를 위한 업무 정의</p></div>',
"이미지 및 여러가지 데이터 수집
간단한 업무 자동화 프로그램",
"데이터엔지니어",'img2.png',"2022-06-10");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("데이터 맞춤 Python 기반 딥러닝 알고리즘 개발해 드립니다.","kmj","200000",
'<div class="css-qopeqa e1rfybc42"><p>단순히 데이터를  딥러닝 모델에 입력한다고 최적의 솔루션이 완성되지 않습니다.</p><p><br></p><p>단순히 딥러닝 모델링 뿐만 아니라</p><p><br></p><p>딥러닝 입력을 위한 데이터 맞춤 전처리 방법, 최적의 딥러닝 모델 적용방법 등을 성실히 알려 드립니다.</p><p><br></p><p>다음과 같은 서비스를 제공할 수 있습니다.</p><p><br></p><p></p><p>컴퓨터 비전은 시각적 이미지 데이터를 해석하고 컴퓨터를 학습시키는 인공 지능 분야입니다.</p><p>딥러닝은 컴퓨터 비전분야에서 많은 발전을 해왔습니다.</p><p><br></p><p>컴퓨터 비전 분야는 관련 연구가 많고 사용처도 많기 때문에 현재 상업적으로도 많이 사용하고 있는 분야 입니다.</p><p><br></p><p>ex) 물체 감지,  열화상 이미지 기반 열감지, 이미지 분류, 이미지기반 물체 가치 추정</p><p><br></p><p></p><p>신호 분석은 현재 산업에서 많이 시도하고 있는 분야입니다.</p><p>주로 진동 신호등, 센서 데이터 분석을 통해 결함 감지나 상태 이상 유무등 다양 방법으로 사용됩니다.</p><p><br></p><p>신호 분석에 대한 관련 연구는 현재 연구가 활발한 분야이고, 앞으로 산업군에서 많은 도입중인 분야 입니다.</p><p><br></p><p>ex) 진동신호 기반 결함 감지, 배터리 상태 분석</p></div>',
"딥러닝 네트워크 개발
- 데이터 맞춤 딥러닝 솔루션 제공
- 소스코드 제공 및 사용방법 안내",
"인공지능",'img3.png',"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("데이터사이언스 박사의 데이터 분석 서비스 드립니다.","imp","100000",
'<div class="css-qopeqa e1rfybc42"><p>의뢰 내용에 따라 작업 기간과 금액 등이 상이할 수 있으므로, 먼저 문의부탁드립니다.</p><p><br></p><p><strong>요청 가능 분야</strong></p><p>- 머신러닝 모델 개발: 불량 탐지, 매출 예측, 이상 탐지 등</p><p>- 머신러닝 알고리즘 설계 및 구현</p><p>- 수리 최적화: 문제정의부터 솔루션 개발까지</p><p>- 머신러닝 자동화 시스템 구축</p><p>- 데이터 분석 및 시각화: 로그 데이터 분석, 데이터 정제, 보고서 작성</p><p>- 파이썬을 이용한 데이터 관련 업무 자동화</p><p>- 데이터 분석 및 사이언스 분야 이력서/경력기술서 첨삭 및 면접 컨설팅</p><p>- 주니어를 위한 데이터 사이언스 업무 지원 및 컨설팅 </p><p>- 기타 데이터사이언스/인공지능/산업공학 과제</p><p><br></p><p>* 딥러닝 과제(자연어, 컴퓨터 비전, 강화학습 등)는 요청받지 않습니다.</p><p>* 파이썬 외 다른 언어는 사용하지 않습니다.</p><p>* 웹, GUI 개발 등은 하지 않습니다. </p><p><br></p><p><strong>산출물</strong></p><p>- word 포맷의 분석 보고서</p><p>- 시스템 사용 매뉴얼</p><p>- 파이썬 소스코드 등</p><p><br></p><p>* 중간 산출물은 크몽 메시지를 통해 전달하며, 상황에 따라 최종 산출물도 크몽 메시지로 전달할 수 있습니다. </p><p><br></p></div>',
"데이터 분석을 위한 파이썬 개발
데이터 사이언스/머신러닝/수리최적화/통계분석/컨설팅 등
(반드시 구매 전 문의주세요)
[결과 해석]
[소스 코드 제공]
[분석 : 2개]",
"데이터엔지니어",'img4.png',"2022-06-30");





-- 페이징 테스트

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("디자인,SEO 제대로 된 최고의 홈페이지를 제작해 드립니다.","kys","100000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p>30여년간 IT 관련 업무를 하면서 가진 노하우를 모두 공유하겠습니다.</p><p>의뢰자가 만족하는 홈페이지보다 사용자가 만족하는 편리한 홈페이지를 제작 해드리겠습니다.</p><p><br></p><p>상식밖의 요청만 아니라면 언제든 요청에 실시간으로 대응해드립니다.</p><p><br></p><p>아무리 잘만든 홈페이지라도 접속자가 없으면 쓸모없는 홈페이지 입니다 .</p><p><br></p><p>검색포탈 노출작업에 최대한 신경을 쓰겠습니다 </p><p><br></p><p><br></p><p>최고급 개발자 3명 / 디자이너2명 / 퍼블리셔3명 이 완벽한 홈페이지 제작에 임하고 있습니다</p><p><br></p><p><br></p><p>포트폴리오를 방문 해 주십시요..</p><p><br></p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><a class="text-underline color-purple" href="http://8285.co.kr/" target="_blank" rel="noopener noreferrer">http://8285.co.kr/</a> </p><p><br></p><p><br></p><p><strong>공통사항</strong></p><p><strong><br></strong></p><p>제작범위 </p><p><br></p><p><u>* 페이지라 함은 </u></p><p><u>메인 제외 </u></p><p><u>- 회사소개 </u></p><p><u>   연혁</u></p><p><u>   오시는 길 </u></p><p><br></p><p><u>﻿등등의 페이지를 말합니다.</u></p><p><br></p><p><u>*홈페이지 완성후 홈페이지 관리 방법등을 교육포함입니다 </u></p><p><br></p><p><u>*맞춤형 의 경우 몇시간만에 셋팅가능한 천편일률적인 템플릿은 사용하지 않습니다.</u></p><p><br></p><p><u>*반응형으로 제작시에는 모바일 홈페이지는 별도제작이 필요없습니다 <br></u></p><p><u>*호스팅 및 도메인 구입은 재능 구매하시면 안내지원 해드립니다 <br></u></p><p><u>*반응형 홈페이지 또는 PC + 모바일 용 홈페이지</u></p><p><br></p><p><br></p><p><br></p><p><br></p><p><u>기본적으로 포함되는 무료기능&nbsp;</u></p><p><br></p><p>1. 회원관리 기능&nbsp;</p><p>2.회원 포인트 기능&nbsp;</p><p>3.편리하고 쉬운 완벽한 관리자 기능&nbsp;</p><p>4.배너및 팝업 관리 기능 </p><p>5.완벽한 SEO 최적화 작업 각종 포탈 싸이트 노출 최적화 </p><p>6.커뮤니티 용을 위한 각종 기능 </p><p>7.기능형 홈페이지를 위한 100 여가지의 기능 ( 문의시 설명 가능 함 )</p><p>8.웹표준 100% 적용 제작 </p><p>9.다국어 지원 기능 탑재 ( 다국어 추가시 1외국어당 홈페이지 제작비용의 50% 추가됩니다)10.홈페이지운영중 실수로 손상시 복구기능 탑재11.완벽한&nbsp;&nbsp;SEO&nbsp;기능 모듈&nbsp;탑재로&nbsp;검색&nbsp;최적화&nbsp;&nbsp;구현&nbsp;</p><p><br></p><p><br></p><p><br></p><p><br></p><p><strong><u>상담이 필요합니다 .유료 기능&nbsp;</u></strong></p><p><br></p><p>홈페이지에 필요한 기능 개발 요청시 상의후 실비로 지원 해드립니다.</p><p><br></p><p>IT 에서는 안되는 것은 없습니다 단지 시간과 비용이 들뿐입니다 </p><p><br></p><p><br></p><p><br></p><p>홈페이지 제작 상담시 준비 해주실것 </p><p><br></p><p>홈페이지에 사용하실 메뉴 카테고리를 알려주십시요 </p><p><br></p><p>평소봐두신 예제 홈페이지가 있다면 주소를 주십시요.</p><p><br></p><p>포토폴리오에서 디자인 선택후 알려주십시요.</p><p><br></p><p><br></p><p>상담시 다음 유의사항을 지켜주십시요.</p><p><br></p><p>크몽의 규정상 거래성사전에는 개인간 연락을 금하고 있습니다.</p><p><br></p><p>전화요청 미팅요청등은 응하지 않습니다.</p><p><br></p><p>텍스트로 상담이 어려운 경우 크몽의 어플을 다운받으신후 판매자와 크몽앱 전화로 통화 가능 합니다 </p><p><br></p><p><br></p><p>기타사항</p><p><br></p><p>특별한 기능 및 디자인이 필요하실때는 상담해주시면 확실하게 지원 해드리겠습니다.</p><p><br></p><p>디자인/기능의 복잡함에 따라 재능가격은 가감이 될 수 있습니다 </p><p><br></p><p><br></p><p><br></p></div>',
"한 땀 한 땀 정성들인 디자인
누구 도 흉내 낼 수 없는 나만의 고퀄리티 /고기능 홈페이지 제작해드립니다.",
"웹풀스택",DEFAULT,"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("웹사이트 퍼블리싱해 드립니다.","kms","50000",
'<div class="css-qopeqa e1rfybc42"><p><strong>서비스 설명</strong></p><p><br></p><p>안녕하세요 도순입니다.</p><p><br></p><p>여러 프로젝트 경험이 있으며, 고객님들이 원하시는대로 퍼블리싱 작업을 해드리겠습니다.</p><p><br></p><p>궁금한 점이 있으시면 언제든지 문의주세요.</p><p>결제 전 메세지로 상담 부탁드립니다.</p><p><br></p><p><strong>작업비용안내</strong></p><p><br></p><p>1. 서브페이지 PC퍼블리싱 = 20,000원 (1일)</p><p>2. 메인페이지 PC퍼블리싱 = 50,000원 (2일)</p><p>3. 서브페이지 반응형 퍼블리싱 = 30,000원 (1일)</p><p>4. 메인페이지 반응형 퍼블리싱 = 70,000원 (2일)</p><p>5. 그외에 다른 사항은 문의주세요</p><p><br></p><p><strong>수정작업안내</strong></p><p><br></p><p>요구사항 미반영된 부분 혹은 버그/오류는</p><p>횟수차감없이 A/S해드리고 있으며,</p><p><br></p><p>2회에 한해 단순 텍스트/이미지 변경 수정 가능합니다.</p></div>',
"3000px이내  1페이지 기준
서브페이지 30,000원
메인페이지 60,000원.",
"프론트엔드","img1.png","2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("데이터 수집 / 업무 자동화 프로그램을 제작해 드립니다.","bdh","20000",
'<div class="css-qopeqa e1rfybc42"><p>1. 데이터 수집 </p><p>- SNS 데이터, 쇼핑몰 데이터, 뉴스 데이터 수집</p><p><br></p><p>2. 데이터 표준화</p><p>- 엑셀 등과 같은 정형데이터 등을 DB로 업로드</p><p>- 필요한 형태로 데이터 변형 및 집계</p><p><br></p><p>3. 데이터 및 업무 자동화</p><p>- 데이터 수집 및 기타 업무에 대한 자동화</p><p>- 스케줄링 및 업무 최적화 </p><p><br></p></div><div class="css-qopeqa e1rfybc42"><p>1. 상담을 통해 필요한 업무 정의</p><p>2. 필요한 업무에 대한 상세한 견적 결정</p><p>3. 작업 수행</p><p>4. 작업 결과를 보고 피드백 수렴</p><p><br></p></div><div class="css-qopeqa e1rfybc42"><p>1. 데이터 수집에 대한 대상 정의</p><p>2. 데이터 표준화를 위한 데이터 정의</p><p>3. 업무 자동화를 위한 업무 정의</p></div>',
"이미지 및 여러가지 데이터 수집
간단한 업무 자동화 프로그램",
"데이터엔지니어",'img2.png',"2022-06-10");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("데이터 맞춤 Python 기반 딥러닝 알고리즘 개발해 드립니다.","kmj","200000",
'<div class="css-qopeqa e1rfybc42"><p>단순히 데이터를  딥러닝 모델에 입력한다고 최적의 솔루션이 완성되지 않습니다.</p><p><br></p><p>단순히 딥러닝 모델링 뿐만 아니라</p><p><br></p><p>딥러닝 입력을 위한 데이터 맞춤 전처리 방법, 최적의 딥러닝 모델 적용방법 등을 성실히 알려 드립니다.</p><p><br></p><p>다음과 같은 서비스를 제공할 수 있습니다.</p><p><br></p><p></p><p>컴퓨터 비전은 시각적 이미지 데이터를 해석하고 컴퓨터를 학습시키는 인공 지능 분야입니다.</p><p>딥러닝은 컴퓨터 비전분야에서 많은 발전을 해왔습니다.</p><p><br></p><p>컴퓨터 비전 분야는 관련 연구가 많고 사용처도 많기 때문에 현재 상업적으로도 많이 사용하고 있는 분야 입니다.</p><p><br></p><p>ex) 물체 감지,  열화상 이미지 기반 열감지, 이미지 분류, 이미지기반 물체 가치 추정</p><p><br></p><p></p><p>신호 분석은 현재 산업에서 많이 시도하고 있는 분야입니다.</p><p>주로 진동 신호등, 센서 데이터 분석을 통해 결함 감지나 상태 이상 유무등 다양 방법으로 사용됩니다.</p><p><br></p><p>신호 분석에 대한 관련 연구는 현재 연구가 활발한 분야이고, 앞으로 산업군에서 많은 도입중인 분야 입니다.</p><p><br></p><p>ex) 진동신호 기반 결함 감지, 배터리 상태 분석</p></div>',
"딥러닝 네트워크 개발
- 데이터 맞춤 딥러닝 솔루션 제공
- 소스코드 제공 및 사용방법 안내",
"인공지능",'img3.png',"2022-06-30");

insert into posttbl(pTitle,pWriter,pPrice,pText,pSkillText,pCategory,pImageName,pTime) values ("데이터사이언스 박사의 데이터 분석 서비스 드립니다.","imp","100000",
'<div class="css-qopeqa e1rfybc42"><p>의뢰 내용에 따라 작업 기간과 금액 등이 상이할 수 있으므로, 먼저 문의부탁드립니다.</p><p><br></p><p><strong>요청 가능 분야</strong></p><p>- 머신러닝 모델 개발: 불량 탐지, 매출 예측, 이상 탐지 등</p><p>- 머신러닝 알고리즘 설계 및 구현</p><p>- 수리 최적화: 문제정의부터 솔루션 개발까지</p><p>- 머신러닝 자동화 시스템 구축</p><p>- 데이터 분석 및 시각화: 로그 데이터 분석, 데이터 정제, 보고서 작성</p><p>- 파이썬을 이용한 데이터 관련 업무 자동화</p><p>- 데이터 분석 및 사이언스 분야 이력서/경력기술서 첨삭 및 면접 컨설팅</p><p>- 주니어를 위한 데이터 사이언스 업무 지원 및 컨설팅 </p><p>- 기타 데이터사이언스/인공지능/산업공학 과제</p><p><br></p><p>* 딥러닝 과제(자연어, 컴퓨터 비전, 강화학습 등)는 요청받지 않습니다.</p><p>* 파이썬 외 다른 언어는 사용하지 않습니다.</p><p>* 웹, GUI 개발 등은 하지 않습니다. </p><p><br></p><p><strong>산출물</strong></p><p>- word 포맷의 분석 보고서</p><p>- 시스템 사용 매뉴얼</p><p>- 파이썬 소스코드 등</p><p><br></p><p>* 중간 산출물은 크몽 메시지를 통해 전달하며, 상황에 따라 최종 산출물도 크몽 메시지로 전달할 수 있습니다. </p><p><br></p></div>',
"데이터 분석을 위한 파이썬 개발
데이터 사이언스/머신러닝/수리최적화/통계분석/컨설팅 등
(반드시 구매 전 문의주세요)
[결과 해석]
[소스 코드 제공]
[분석 : 2개]",
"데이터엔지니어",'img4.png',"2022-06-30");

