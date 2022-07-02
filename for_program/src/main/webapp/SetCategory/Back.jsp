<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "백엔드");
	response.sendRedirect("../CategoryPosters.jsp");
%>