<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "사물인터넷");
	response.sendRedirect("../CategoryPosters.jsp");
%>