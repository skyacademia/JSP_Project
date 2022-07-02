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
<%
	String category = (String)session.getAttribute("category");
	System.out.println(category);
%>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="row my-5">
			<jsp:include page="category.jsp" />
			<div class="col-md-9">
				<form class='mt-2 mb-2 row' action="posters_search.jsp"
					method="get">
					<div class="col-md-10">
						<input type="text" class="form-control" id="search"
							name="search_text" aria-describedby="emailHelp" placeholder="원하시는 검색어 및 카테고리를 입력해주세요">
					</div>
					<div class="col-md-2">
						<input type="submit" class="btn btn-primary" value="검색">
					</div>
				</form>
				<div class="row">
					<%@ include file="dbconn.jsp"%>
					<%
					request.setCharacterEncoding("UTF-8");
					int pageNum = 0;
					int totalCount = 0;
					int contentInPage = 0;

					String sql = "SELECT COUNT(*) as total FROM posttbl WHERE pCategory LIKE ?" ;
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,category);
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
						totalCount = rs.getInt("total");
					}

					String pageString = request.getParameter("page");
					if (pageString == null) {
						pageNum = 1;
					} else {
						pageNum = Integer.parseInt(pageString);
					}
					PagingDAO paging = new PagingDAO(totalCount, pageNum);
					contentInPage = paging.getCountList();

					sql = "SELECT * FROM posttbl WHERE pCategory LIKE ? ORDER BY pId DESC LIMIT ?, ?";
					try {
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, category);
						pstmt.setInt(2, (pageNum - 1) * contentInPage);
						pstmt.setInt(3, contentInPage);
						rs = pstmt.executeQuery();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					String pId = "";
					String pTitle = "";
					String pWriter = "";
					String pPrice = "";
					String pSkillText = "";
					String pImageName = "";
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
								class="card-img-top" alt="..." width="200px" height="250px">
							<div class="card-body">
								<h5 class="card-title"><%=pTitle%></h5>
								<h6 class="card-subtitle mb-2 text-muted"><%=pWriter%></h6>
								<h6 class="card-subtitle mb-2 text-muted"><%=pSkillText%></h6>
								<p class="card-text"><%=pPrice%>원
								</p>
								<a href="poster.jsp?id=<%=pId %>" class="btn btn-warning">자세히 보기</a>
							</div>
						</div>
					</div>
					<%
					}
					%>
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
							int startPage = paging.getPages()[0];
							int endPage = paging.getPages()[1];
							for (int singlePage = startPage; singlePage <= endPage; singlePage++) {
							%>
							<li class="page-item"><a class="page-link"
								href="posters.jsp?page=<%=singlePage%>"><%=singlePage%></a></li>
							<%
							}
							%>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>

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