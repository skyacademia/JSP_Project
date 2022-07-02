<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "인공지능");
	response.sendRedirect("../CategoryPosters.jsp");
%>