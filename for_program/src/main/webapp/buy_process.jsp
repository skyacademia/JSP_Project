<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.fpp.dao.*"%>
<%@ page import="java.time.*, java.time.format.DateTimeFormatter" %>
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
	String bSellUser = request.getParameter("bSellUser");
	String bTel = request.getParameter("bTel");
	String bEmail = request.getParameter("bEmail");
	String bText = request.getParameter("buyText");
	String pID = request.getParameter("pID");
	String bUser = id;
	String bTime = null;
	
	//판매자 정보추가 7/1
	String bSellTel = request.getParameter("bSellTel");  	//판매자 연락처
	String bSellMail = request.getParameter("bSellMail");	//판매자 메일
	String pTitle = request.getParameter("pTitle");			//판매 포스터 명
	
	BuyDAO bDAO = new BuyDAO();
	
	int row = bDAO.buy(conn, bUser,bSellUser, Integer.parseInt(pID), bPrice, bTel, bEmail, bText,bTime,bSellTel,bSellMail,pTitle);
	

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