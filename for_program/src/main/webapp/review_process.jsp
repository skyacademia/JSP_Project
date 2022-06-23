<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="dbconn.jsp"%>
	<%
	String pid_ = request.getParameter("pid");
	int pid;
	//페이지id가 제대로 들어오지않았으면 error발생
	if (pid_ == null) {

		out.println("error");
		response.sendRedirect("posters.jsp");

	} 

	//리뷰 테이블에 리뷰글을 등록한다.
	else {

		float score;
		String score_ = request.getParameter("rating");
		if (score_ == null) {
			score = 0;
		} else {
			score = Float.parseFloat(score_);
		}

		pid = Integer.parseInt(pid_);
		String id = (String) pageContext.getSession().getAttribute("id");
		if(id == null)
		{
			response.sendRedirect("Login.jsp");
		}
		String text = request.getParameter("addReviewText");

		out.println(id+pid+score+text);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into reviewtbl(rWriter, rPosterID, rScore, rText) values (?,?,?,?);";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setInt(2, pid);
		pstmt.setFloat(3, score);
		pstmt.setString(4, text);
		pstmt.executeUpdate();
		response.sendRedirect("poster.jsp?id=" + pid);
		pstmt.close();
		conn.close();
	}
	%>

</body>
</html>