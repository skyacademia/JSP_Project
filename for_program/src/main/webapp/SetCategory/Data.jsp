<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "데이터엔지니어");
	response.sendRedirect("../CategoryPosters.jsp");
%>