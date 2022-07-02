<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "IOS");
	response.sendRedirect("../CategoryPosters.jsp");
%>