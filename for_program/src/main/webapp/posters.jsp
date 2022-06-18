<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="category.jsp" />
	
	
	
	<!-- 임시로 만듬 -->
	<div class="col-xl-9 mt-5">
		<form action="posters_process.jsp" method="post">
		  <div class="col-md-4">
		    <input type="text" class="form-control" id="id" name="id" placeholder="원하는 페이지 입력 예) 5">
		  </div>
		  <div class="col-md-4">
			<input type="submit" value="go"/>
		  </div>
		</form>
	</div>
</body>
</html>