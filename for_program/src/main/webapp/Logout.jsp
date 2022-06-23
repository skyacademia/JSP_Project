<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.removeAttribute("id");
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('로그아웃 완료')");
	    script.println("</script>");
	    String referer = (String)request.getHeader("REFERER");
	    response.sendRedirect(referer);
	%>
</body>
</html>