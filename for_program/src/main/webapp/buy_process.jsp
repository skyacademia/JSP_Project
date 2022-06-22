<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.fpp.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
	request.setCharacterEncoding("UTF-8");
	String id;
	try {
		id = (String) pageContext.getSession().getAttribute("id");
	} catch (Exception e) {
		id = null;
	}
	
	String bPrice = request.getParameter("bPrice");
	String bTel = request.getParameter("bTel");
	String bEmail = request.getParameter("bEmail");
	String bText = request.getParameter("buyText");
	String pID = request.getParameter("pID");
	String bUser = id;
	BuyDAO bDAO = new BuyDAO();
	
	int row = bDAO.buy(conn, bUser, Integer.parseInt(pID), bPrice, bTel, bEmail, bText);
	

	PrintWriter script = response.getWriter();
	if(row == 0)
	{

		script.println("<script>");
		script.println("alert('error')");
		script.println("history.back()");
		script.println("</script>");
	}
	else
	{
		//구매완료시 나오는 페이지

		script.println("<script>");
		script.println("alert('구매 신청 완료!')");
		script.println("location.href = 'thankyou.jsp'");
		script.println("</script>");
	}
	
	%>
</body>
</html>