<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fpp.dao.*"%>
<%@ page import="java.sql.*"%>


<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>



<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

</script>
</head>
<body>

	<%@ include file="dbconn.jsp"%>
	<%

	PrintWriter script = response.getWriter();
	
	
	
	String userID = null;
	if (session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");
	}

	PosterDAO pDAO = new PosterDAO();

	String filename = null;

	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

	String realPath = request.getServletContext().getRealPath("resources/images");
	MultipartRequest multi = new MultipartRequest(request, realPath, 5 * 1024 * 1024, "utf-8", policy);

	Enumeration files = multi.getFileNames();
	String str = (String) files.nextElement();
	filename = multi.getFilesystemName(str);


	String add_p_title = multi.getParameter("addTitle");
	String add_p_text = multi.getParameter("addText");

	String add_p_price = multi.getParameter("addPrice");
	if (add_p_price == null)
		add_p_price = "0";
	String add_p_category = multi.getParameter("addCategory");

	String add_p_skillText = multi.getParameter("addSkillText");


	if (filename == null)
		filename = "defaultThum.png";


	int row = pDAO.add_poster(conn, add_p_title, userID, add_p_price, add_p_text, add_p_skillText, add_p_category,
			filename,null);
	if (row != 0) {
		
	    script.println("<script>");
	    script.println("alert('등록완료')");
        script.println("location.href = 'posters.jsp'"); 
	    script.println("</script>");
	}  
	else {
		 script.println("<script>");
		    script.println("alert('등록실패')");
	        script.println("location.href = 'posters.jsp'"); 
		    script.println("</script>");
	}
	%>

</body>
</html>