<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "게임서버");
	response.sendRedirect("../CategoryPosters.jsp");
%>