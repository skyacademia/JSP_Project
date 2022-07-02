<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("category", "VR/AR/3D");
	response.sendRedirect("../CategoryPosters.jsp");
%>