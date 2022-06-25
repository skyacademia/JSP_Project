<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fpp.dao.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="./resources/css/carousel.css">
<style>
.icon {
	font-size: 24px;
}

.cardImage {
	background-size: cover;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="row my-5">
			<jsp:include page="category.jsp" />
			<div class="col-md-9">
				<form class='mt-2 mb-2 row' action="posters_search.jsp" method="post">
					<div class="col-md-10">
						<input type="text" class="form-control" id="search" name="search_text"
							aria-describedby="emailHelp">
					</div>
					<div class="col-md-2">
						<input type="submit" class="btn btn-primary" value="검색">
					</div>
				</form>
				<div class="row">
					<%
					/*Connection conn = null;
					try {
						String url = "jdbc:mysql://localhost:3306/jspsql";
						String user = "root";
						//String password = "root";
						String password = "1234";

						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection(url, user, password);
					} catch (SQLException ex) {
						out.println("데이터베이스 연결이 실패했습니다.<br>");
						out.println("SQLException: " + ex.getMessage());
					}*/
					%><%@ include file="dbconn.jsp"%><%
					request.setCharacterEncoding("UTF-8");
					String search = request.getParameter("search_text");
					search = "%"+search+"%";

					String sql = "SELECT * FROM posttbl WHERE pTitle LIKE ? OR pCategory LIKE ?";
					String pId = "";
					String pTitle = "";
					String pWriter = "";
					String pPrice = "";
					String pSkillText = "";
					String pImageName = "";
					PreparedStatement prest = conn.prepareStatement(sql);
					prest.setString(1, search);
					prest.setString(2, search);
					ResultSet rs = prest.executeQuery();
					while (rs.next()) {
						pId = rs.getString("pId");
						pTitle = rs.getString("pTitle");
						pWriter = rs.getString("pWriter");
						pPrice = rs.getString("pPrice");
						pSkillText = rs.getString("pSkillText");
						pImageName = rs.getString("pImageName");
					%>

					<div class="col-md-4 mt-5">
						<div class="card" style="width: 100%;">
							<img src="./resources/images/<%=pImageName%>"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><%=pTitle%></h5>
								<h6 class="card-subtitle mb-2 text-muted"><%=pWriter%></h6>
								<h6 class="card-subtitle mb-2 text-muted"><%=pSkillText%></h6>
								<p class="card-text"><%=pPrice%>원</p>
								<a href="#" class="btn btn-warning">자세히 보기</a>
							</div>
						</div>
					</div>
					<%
					}
					%>

				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>

</body>
</html>