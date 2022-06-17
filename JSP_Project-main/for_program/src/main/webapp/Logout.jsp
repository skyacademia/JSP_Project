<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("id", null);
	session.setMaxInactiveInterval(0);
	response.sendRedirect("poster.jsp");
%>