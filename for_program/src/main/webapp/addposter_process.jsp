<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fpp.dao.*" %>
<%@ page import = "java.sql.*" %>

<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		
		String userID = null;	
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
		
		PosterDAO pDAO = new PosterDAO();
		
		//만약 썸네일이미지가 없다면 null입력
	
		String add_p_title = request.getParameter("addTitle");
		String add_p_text = request.getParameter("addText");
		
		String add_p_price = request.getParameter("addPrice");
		if(add_p_price.equals(""))	add_p_price = "0";
		String add_p_category = request.getParameter("addCategory");
		
		String add_p_skillText = request.getParameter("addSkillText");
		String add_p_thum = request.getParameter("addThumnail");
			
		
			int row = pDAO.add_poster(conn,add_p_title,userID,add_p_price
					,add_p_text,add_p_skillText,add_p_category,add_p_thum);
			if(row == 0)
			{
				out.println("db에 등록 완료");
			}
			else
			{
				out.println("등록 실패");
			}
			response.sendRedirect("poster.jsp");
	%>
</body>
</html>