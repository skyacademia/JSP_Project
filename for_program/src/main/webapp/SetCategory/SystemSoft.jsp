<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "시스템소프트웨어");
	response.sendRedirect("../CategoryPosters.jsp");
%>