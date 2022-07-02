<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "응용프로그램");
	response.sendRedirect("../CategoryPosters.jsp");
%>