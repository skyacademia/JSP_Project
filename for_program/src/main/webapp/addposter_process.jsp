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
function msg(){
	alert("등록이 완료되었습니다");
}

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
	//테스트 해볼때는.... 파일저장 경로 변경 각자 자기 절대경로로 바꾸기..... 포스터등록 다되고나서 자바 리프레쉬로 해줘야함 으휴...
	//리프레쉬 안하는방법은 자바설정뭐 해줘야된다는데 안함 귀찬아
	MultipartRequest multi = new MultipartRequest(request, "D:\\git_project\\fpp\\src\\main\\webapp\\resources\\images", 5 * 1024 * 1024, "utf-8", policy);

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
			filename);
	if (row != 0) {

	    script.println("<script>");
	    script.println("alert('등록완료')");
	    script.println("</script>");
	}   
	response.sendRedirect("posters.jsp");
	%>

</body>
</html>