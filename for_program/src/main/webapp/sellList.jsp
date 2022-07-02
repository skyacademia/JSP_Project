<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매목록</title>
</head>
<body>
	<%


		String ID = (String)session.getAttribute("id");
		if(ID == null){
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('로그인을 해주세요.')");
	        script.println("location.href = 'Login.jsp'");
	        script.println("</script>");
		}
	%>
	<jsp:include page="header.jsp" />

	<div class="container">
		<div class="row mt-5">
			<jsp:include page="Mycategory.jsp" />
			<div class="col-md-9 mt-5">
				<div class="container ">
					<div class="row">
						<div class="col-xl-12">
							<div class="row">
								<div class="col">
									<h4 class="fw-bold" id="develop">구매목록</h4>
									<hr>
									
									<h3 class="fw" id="develop">판매목록</h3>
									<table class = "table table-hover table-sm" >
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
												
											String sql2 = String.format("SELECT bUser, bPosterID, bPrice, bTel, bEmail, bText, bTime, bSellTitle FROM buytbl where bSellUser = '%s' ORDER BY bTime DESC", ID);
											try {
									            Class.forName("com.mysql.jdbc.Driver");
									            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspsql?serverTimezone=UTC", "root", "root"); 
												Statement st = conn.createStatement();
												ResultSet rs = st.executeQuery(sql2);
												while(rs.next()){
													%>
														<tr>
															<td style="cursor:pointer;"><a href="poster.jsp?id=<%=rs.getInt("bPosterID")%>"><%=rs.getString("bSellTitle")%></a></td>
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

</body>
</html>