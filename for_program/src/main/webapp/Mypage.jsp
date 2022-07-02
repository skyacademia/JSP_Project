<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fpp.dao.*"%>
<%@ page import="com.fpp.dto.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://kit.fontawesome.com/5547fa07a6.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/css/root.css">
<link rel="stylesheet" href="./resources/css/carousel.css">
</head>
<body>
	<%
	//내가 데이터를 가져오는 방식이랑 달라서
	%>

	<%
	MemberDTO memberDTO = new MemberDTO();
	String Thum = memberDTO.getmThum();
	String ID = (String) session.getAttribute("id");
	String Company = memberDTO.getmCompany();
	String Mail = memberDTO.getmMail();
	String Tel = memberDTO.getmTel();
	String Skill = memberDTO.getmSkill();

	if (ID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'Login.jsp'");
		script.println("</script>");
	}
	%>
	<!-- 헤더와 카테고리 추가-->
	<jsp:include page="header.jsp" />

	<div class="container mt-2">
		<div class="row">
			<jsp:include page="Mycategory.jsp" />
			<div class="col-md-9 mt-2">
				<div class="container ">
					<div class="row">
						<div class="col-xl-12">
							<div class="row">
								<div class="col">
									<h3 class="fw-bold" id="develop">마이페이지</h3>
									<div class="developerBox d-flex flex-row row">
										<div class="col-md-2 d-flex flex-column align-items-center ">
											<img src="./resources/images/<%=Thum%>" width="100px"
												height="100px" style="border-radius: 50%">
											<p class="fw-bold fs-3 "><%=ID%></p>
										</div>
										<div
											class="col-md-4 d-flex flex-column justify-content-center border-end">
											<p>
												<span class="fw-bold"> 기관명 : <%=Company%></span>
											</p>

											<p>
												<span class="fw-bold"> Tel : <%=Tel%></span>
											</p>
										</div>
										<div
											class="col-md-6 d-flex flex-column justify-content-center">
											<p>
												<span class="fw-bold"> Email : <%=Mail%></span>
											</p>
											<p>
												<span class="fw-bold"> Stack : <%=Skill%></span>
											</p>
										</div>
									</div>

									<hr>

									<h3 class="fw" id="develop">구매목록</h3>
									<div class="table-responsive-md">
										<table class="table table-hover table-sm">
											<thead class="table-light">
												<tr>
													<th scope="col">구매글 제목</th>
													<th scope="col">가격</th>
													<th scope="col">판매자</th>
													<th scope="col">판매자연락처</th>
													<th scope="col">판매자이메일</th>
													<th scope="col">구매일자</th>
												</tr>
											</thead>
											<tbody>
												<%
												String sql = String.format(
														"SELECT bSellUser, bPosterID, bPrice, bSellTel, bSellMail, bTime, bSellTitle FROM buytbl where bUser = '%s' ORDER BY bTime DESC",
														ID);
												try {
													Class.forName("com.mysql.jdbc.Driver");
													Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspsql?serverTimezone=UTC", "root",
													"root");
													Statement st = conn.createStatement();
													ResultSet rs = st.executeQuery(sql);
													while (rs.next()) {
												%>
												<tr>
													<td style="cursor: pointer;"><a
														href="poster.jsp?id=<%=rs.getInt("bPosterID")%>"><%=rs.getString("bSellTitle")%></a></td>
													<td><%=rs.getString("bPrice")%></td>
													<td><%=rs.getString("bSellUser")%></td>
													<td><%=rs.getString("bSellTel")%></td>
													<td><%=rs.getString("bSellMail")%></td>
													<td><%=rs.getString("bTime")%></td>
												</tr>
												<%
												}
												} catch (SQLException e) {
												e.printStackTrace();
												}
												%>
											</tbody>
										</table>
									</div>

									<hr>

									<h3 class="fw" id="develop">판매목록</h3>
									<div class="table-responsive-md">
										<table class="table table-hover table-sm">
											<thead class="table-light">
												<tr>
													<th scope="col">판매글 제목</th>
													<th scope="col">가격</th>
													<th scope="col">구매자</th>
													<th scope="col">구매자연락처</th>
													<th scope="col">구매자이메일</th>
													<th scope="col">요구사항</th>
													<th scope="col">판매일자</th>
												</tr>
											</thead>
											<tbody>
												<%
												String sql2 = String.format(
														"SELECT bUser, bPosterID, bPrice, bTel, bEmail, bText, bTime, bSellTitle FROM buytbl where bSellUser = '%s' ORDER BY bTime DESC",
														ID);
												try {
													Class.forName("com.mysql.jdbc.Driver");
													Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspsql?serverTimezone=UTC", "root",
													"root");
													Statement st = conn.createStatement();
													ResultSet rs = st.executeQuery(sql2);
													while (rs.next()) {
												%>
												<tr>
													<td style="cursor: pointer;"><a
														href="poster.jsp?id=<%=rs.getInt("bPosterID")%>"><%=rs.getString("bSellTitle")%></a></td>
													<td><%=rs.getString("bPrice")%></td>
													<td><%=rs.getString("bUser")%></td>
													<td><%=rs.getString("bTel")%></td>
													<td><%=rs.getString("bEmail")%></td>
													<td><%=rs.getString("bText")%></td>
													<td><%=rs.getString("bTime")%></td>
												</tr>
												<%
												}
												} catch (SQLException e) {
												e.printStackTrace();
												}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>