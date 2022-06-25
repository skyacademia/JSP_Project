<%@page import="java.io.PrintWriter"%>
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
	
	if(id != null){
		String referer = request.getHeader("REFERER");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href =" + referer); 
		script.println("</script>");
		}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
    	script.println("alert('로그인이 필요합니다')");
    	script.println("location.href = 'Login.jsp'"); 
    	script.println("</script>");
	}
	%>
</body>
</html>