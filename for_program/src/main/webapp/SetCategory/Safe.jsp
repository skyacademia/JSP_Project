<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "인터넷보안");
	response.sendRedirect("../CategoryPosters.jsp");
%>