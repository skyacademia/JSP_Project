<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "하이브리드");
	response.sendRedirect("../CategoryPosters.jsp");
%>