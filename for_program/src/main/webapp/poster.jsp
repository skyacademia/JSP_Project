<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fpp.dao.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
<script src="https://kit.fontawesome.com/5547fa07a6.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.contour {
	border-right: 3px solid rgb(209, 209, 209);
	height: 100%;
	width: 55%;
}
</style>
</head>
<body>
	<!-- 임시로 pID = 1인 페이지를 불러온 상태 -->



	<!-- 헤더와 카테고리 추가-->
	<jsp:include page="header.jsp" />
	<jsp:include page="category.jsp" />




	<%@ include file="dbconn.jsp"%>
	<%
	float score = 0;
	float cnt = 0;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//--------------------------------------------------------------------------------------------------------
	String sql3 = "SELECT sum(rScore) as sum , count(rScore) as cnt FROM reviewtbl where rPosterID=1;";
	pstmt = conn.prepareStatement(sql3);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		cnt = rs.getFloat("cnt");
		score = rs.getFloat("sum") / cnt;

	}

	String score_ = String.format("%.2f", score);
	//--------------------------------------------------------------------------------------------------------
	String sql = "SELECT * FROM posttbl as P " + "inner join membertbl as M " + "on P.pWriter = M.mID "
			+ "inner join skilltbl as S on S.sMemberID = M.mID where pid=1;";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while (rs.next()) {
	%>

	<!-- poster-top -->
	<div class="col-md-9 mt-5">

		<nav style="-bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="header.jsp">전체리스트</a></li>
				<li class="breadcrumb-item active" aria-current="page"><%=rs.getString("pCategory")%></li>
			</ol>
		</nav>

		<div class="container">
			<div class="row">
				<div class="col-xl-5">
					<!-- 이미지 제목필요 -->
					<img src="resources/images/thumnail.png" class="img-fluid w-100%"
						alt="...">
				</div>
				<div class="col-xl-1">
					<div class="contour"></div>
				</div>



				<div class="col-xl-6">
					<label class="fs-7"><%=rs.getString("pID")%></label><br>
					<label class="fs-5"><%=rs.getString("mCompany")%></label>
					 <label
						class="fs-3 fw-bold"><%=rs.getString("pTitle")%></label><br>
					<label class=""><%=rs.getString("pCategory")%></label>
					<div class="">
						<span class="text-warning"> <i class="fa-solid fa-star"></i></span>
						<span class="fw-bold"> <%=score_%></span>
					</div>
					<div class="justify-content-end">
						<div class="text-end">
							<span class="fw-bold mx-4 fs-3"><%=rs.getString("pPrice")%>원</span>
						</div>
						<div class="text-center">
							<a href="header.jsp"><input type="button" class="btn btn-warning w-75 mx-4"
								value="구매하기"></a>
						</div>
					</div>
				</div>
				<ul class="nav nav-pills nav-fill bg-light my-5 py-2">
					<li class="nav-item"><a class="nav-link text-black" href="#service">서비스
							설명</a></li>
					<li class="nav-item"><a class="nav-link text-black" href="#skill">기술
							소개</a></li>
					<li class="nav-item"><a class="nav-link text-black" href="#develop">개발자
							소개</a></li>
					<li class="nav-item"><a class="nav-link text-black" href="#review">리뷰
							<%=Math.round(cnt)%></a></li>
				</ul>
			</div>
		</div>
		<!-- poster-top end -->

		<!-- poster-main -->
		<div class="container m-1">
			<div class="row">
				<div class="col">
					<h3 class="fw-bold" id="service">서비스 설명</h3>
					<div class="serviceBox">
						<p><%=rs.getString("pText")%></p>
					</div>
					<p>h1</p>
						<p>h1</p>
						<p>h1</p>
						<p>h1</p>
						<p>h1</p>
						<p>h1</p>
						<p>h1</p>
						<p>h1</p>
						<p>h1</p>
						<p>h1</p>
						<p>h1</p>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<h3 class="fw-bold" id="skill">기술 소개</h3>
					<div class="skillBox">
						<%=rs.getString("pSkillText")%>
					</div>

					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<h3 class="fw-bold" id="develop">개발자 소개</h3>
					<div class="developerBox">
						<p><%=rs.getString("mCompany")%></p>
						<p><%=rs.getString("pWriter")%></p>
						<p><%=rs.getString("mTel")%></p>
						<p><%=rs.getString("mMail")%></p>
						<p><%=rs.getString("mText")%></p>




						<p><%=rs.getString("sSkill1")%></p>

						<%
							if (rs.getString("sSkill2") != null) 
							{
						%>
						<p><%=rs.getString("sSkill2")%></p>
						<%
							}

						if (rs.getString("sSkill3") != null) {
						%>
						
						<p><%=rs.getString("sSkill3")%></p>
						<%
							}

						}
						%>
					</div>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<h3 class="fw-bold" id="review">리뷰</h3>
					<div class="reviewBox">
						<%
						String sql2 = "SELECT * FROM reviewtbl where rPosterID=1;";
						pstmt = conn.prepareStatement(sql2);
						rs = pstmt.executeQuery();
						while (rs.next()) {
						%>
						<p><%=rs.getString("rWriter")%>
							<%=rs.getFloat("rScore")%></p>
						<p><%=rs.getString("rText")%></p>
						<p>h1</p>
						<p>h1</p>
						<hr>
						<%
						}
						pstmt.close();
						conn.close();
						%>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<footer>footer</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>