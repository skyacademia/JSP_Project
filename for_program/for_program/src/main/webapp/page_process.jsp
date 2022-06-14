<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id;
	try{	
		id = (String)pageContext.getSession().getAttribute("mID");
	}catch(Exception e){
		id = null;
	}
	if(id != null)
		out.println("페이지 이동 됨");
	else
		out.println("로그인 필요");
	%>
</body>
</html>