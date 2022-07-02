<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://kit.fontawesome.com/5547fa07a6.js"
	crossorigin="anonymous"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
  <link rel="stylesheet" href="./resources/css/carousel.css">
	
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
	.contour {
		border-right: 3px solid rgb(209, 209, 209);
		height: 100%;
		width: 55%;
	}
    .icon {
      font-size: 24px;
    }

    .cardImage {
      background-size: cover;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container mt-5">
		<div class = "input-form-background row">
			<div class = "input-form col-md-6 mx-auto my-auto">
				<form method="post" class="mt-5" action="<%= request.getContextPath()%>/LoginAction.jsp">
					<div class="row">
				    	<h3 class="mb-3" style="text-align: center;">로그인 화면</h3>
				    	<div class="col-md-10 mx-auto">
						<label for="name">아이디</label>
						<input type="text" class="form-control mb-3" id="mID" placeholder="아이디" maxlength = "20" name ="mID" required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-10 mx-auto d-grid">
							<label for="name">비밀번호</label>
							<input type="password" class="form-control" id="mPW" placeholder="비밀번호" maxlength = "20" name="mPW" required>
							<input type="submit" class="btn btn-primary btn-block mt-3 text-center" value="로그인">
				    	</div>
					</div>   
				</form>
			</div>
		</div>
	</div>
</body>
</html>