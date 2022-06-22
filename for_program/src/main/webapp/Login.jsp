<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://kit.fontawesome.com/5547fa07a6.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
	  .input-form {
	    max-width: 680px;
	
	    margin-top: 80px;
	    padding: 32px;
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
	<jsp:include page="category.jsp" />
		<div class = "input-form-background col-md-9">
			<div class = "input-form col-md-7 mx-auto my-auto">
				<form method="post" action="<%= request.getContextPath()%>/LoginAction.jsp">
				    <h3 class="mb-3" style="text-align: center;">로그인 화면</h3>
					<label for="name">아이디</label>
					<input type="text" class="form-control" id="mID" name="mID" placeholder="아이디" maxlength = "20" required>
					<label for="name">비밀번호</label>
					<input type="password" class="form-control" id="mPW" name="mPW" placeholder="비밀번호" maxlength = "20" required>
				    <input type="submit" class="btn btn-primary btn-lg btn-block" value="로그인">
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>