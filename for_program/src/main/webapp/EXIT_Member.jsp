<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fpp.dao.*" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "javax.swing.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('로그인을 해주세요.')");
	        script.println("location.href = 'Login.jsp'");
	        script.println("</script>");
		}
	%>
	<jsp:include page="header.jsp" />
	<div class="container">
		<form method="post" class="mt-5" action="<%= request.getContextPath()%>/EXIT_Member_Action.jsp">
			<div class="row">
		    	<h3 class="mb-3" style="text-align: center;">회원 탈퇴</h3>
				<div class="col-md-4 mx-auto">
					<label for="name">비밀번호</label>
					<input type="password" class="form-control" id="iPW" placeholder="비밀번호" maxlength = "20" name="iPW" required>
					<input type="submit" class="btn btn-primary btn-block mt-3 text-center" value="탈퇴">
			    </div>
			</div>
		</form>
	</div>
</body>
</html>