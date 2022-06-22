<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원가입</title>
	<style>
	  body {
	    min-height: 100vh;
	    background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
	    background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	    background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	    background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	    background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
	  }
	  .input-form {
	    max-width: 680px;
	
	    margin-top: 80px;
	    padding: 32px;
	
	    background: #fff;
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    border-radius: 10px;
	    -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	    -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
	  }
	</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class = "container">
		<div class = "input-form-background row">
			<div class = "input-form col-md-6 mx-auto my-auto">
				<h4 class = "mb-3">회원가입</h4>
				<form class = "validation-form" method="post" action="<%= request.getContextPath()%>/SignUPAction.jsp" novalidate>
					<div class = "mb-3">
						<label for="id">아이디</label>
						<input type="text" class = "form-control" id="mID" name="mID" maxlength="20" required>
						<div class = "invalid-feedback">아이디를 입력해주세요.</div>
					</div>
					<div class = "mb-3">
						<label for="name">비밀번호</label>
						<input type="password" class = "form-control" id="mPW" name="mPW" maxlength="20" required>
						<div class = "invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					<div class = "mb-3">
						<label for="name">이름</label>
						<input type="text" class = "form-control" id="name" name="name" maxlength="20" placeholder="홍길동" required>
						<div class = "invalid-feedback">이름을 입력해주세요.</div>
					</div>
					<div class = "mb-3">
						<label for="tel">연락처</label>
						<input type="text" class = "form-control" id="tel" name="tel" maxlength="20" placeholder="01000000000" required>
						<div class = "invalid-feedback">연락처를 입력해주세요.</div>
					</div>
					<div class = "mb-3">
						<label for="email">이메일</label>
						<input type="email" class = "form-control" id="email" name="email" maxlength="20" placeholder="ghdrlfehd@naver.com" required>
						<div class = "invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<div class = "mb-3">
						<label for="address">주소</label>
						<input type="text" class = "form-control" id="post" name="post" maxlength="20" placeholder="우편번호" readonly onclick="findAddr()">
						<input type="text" class = "form-control" id="addr" name="addr" maxlength="20" placeholder="주소" readonly onclick="findAddr()">
						<input type="text" class = "form-control" id="addr2" name="addr2" maxlength="20" placeholder="상세주소">
					</div>
					<div class = "mb-3">
						<label for="company">회사명</label>
						<input type="text" class = "form-control" id="company" name="company" maxlength="30" placeholder="회사명(개인사업자는 개인사업자라고 적어주세요.)" required>
						<div class = "invalid-feedback">회사명을 입력해주세요.</div>
					</div>
					<div class = "mb-3">
						<label for="about">자기소개</label>
						<Textarea class = "form-control" id="about" name="about" placeholder="자기소개를 해주세요." rows="10" required></Textarea>
						<div class = "invalid-feedback">자기소개를 입력해주세요.</div>
					</div>
					<div class = "mb-3">
						<label for="thum">프로필 사진</label>
						<input type="file" class = "form-control" id="thum" name="thum" maxlength="20">
						<!-- 사진업로드는 일단 나중...ㅠㅠ 넣으면 바로위 끝에 required 넣어야함!
						<div class = "invalid-feedback">프로필 사진을 꼭 넣어주세요!.</div>
						-->
					</div>
			        <hr class="mb-4">
			        <div class="custom-control custom-checkbox">
				        <input type="checkbox" class="custom-control-input" id="aggrement" required>
				        <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
			        </div>
			        <div class="mb-4"></div>
			        <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("addr").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<script>
	window.addEventListener('load', () => {
	  const forms = document.getElementsByClassName('validation-form');
	
	  Array.prototype.filter.call(forms, (form) => {
	    form.addEventListener('submit', function (event) {
	      if (form.checkValidity() === false) {
	        event.preventDefault();
	        event.stopPropagation();
	      }
	
	      form.classList.add('was-validated');
	    }, false);
	  });
	}, false);
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>