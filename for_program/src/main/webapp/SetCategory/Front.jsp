<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "프론트엔드");
	response.sendRedirect("../CategoryPosters.jsp");
%>