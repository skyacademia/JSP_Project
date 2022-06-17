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
.contour {
	border-right: 3px solid rgb(209, 209, 209);
	height: 100%;
	width: 55%;
}
</style>
</head>
<body>
	
	<jsp:include page="header.jsp" />
	
	<form method="post" action="<%= request.getContextPath()%>/LoginAction.jsp">
	    <h3 class="mb-3" style="text-align: center;">로그인 화면</h3>
		<label for="name">아이디</label>
		<input type="text" class="form-control" id="mID" placeholder="아이디" maxlength = "20" name ="mID" required>
		<label for="name">비밀번호</label>
		<input type="password" class="form-control" id="mPW" placeholder="비밀번호" maxlength = "20" name="mPW" required>
	    <input type="submit" class="btn btn-primary btn-lg btn-block" value="로그인">
	</form>
</body>
</html>