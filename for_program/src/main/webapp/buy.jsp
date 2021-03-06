<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.fpp.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<script type="text/javascript">
	function buyFinish() {
		var form = document.getElementById("buyForm");
		if (confirm("구매 신청 하시겠습니까?")) {

			form.submit();
		}
	}
	function cancel() {

		if (confirm("취소 하시겠습니까?")) {
			window.history.back();
		}
	}
</script>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	String id;
	try {
		id = (String) pageContext.getSession().getAttribute("id");
	} catch (Exception e) {
		id = null;
	}

	PrintWriter script = response.getWriter();

	if (id == null) {
		script.println("<script>");
		script.println("alert('로그인을 해주세요')");
		script.println("location.href = 'Login.jsp'");
		script.println("</script>");
	} else {
		String pWriter = request.getParameter("pWriter");
		if (pWriter.equals(id)) {
			script.println("<script>");
			script.println("alert('회원님이 작성하신 글입니다.')");
			script.println("location.href = history.back()");
			script.println("</script>");
		} else {
			String pID = request.getParameter("pID");
	%>


	<jsp:include page="header.jsp" />

	<%@ include file="dbconn.jsp"%>

	<%
	PosterDAO pDAO = new PosterDAO();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String bSellUser = "";
	String bPrice = "";
	String bMail = "";
	String bTel = "";
	String pTitle = "";
	rs = pDAO.get_poster(conn, Integer.parseInt(pID));
	while (rs.next()) {
		bPrice = rs.getString("pPrice");			//판매가격 (구매가격)
		bSellUser = rs.getString("pWriter");		//판매자ID
		pTitle  = rs.getString("pTitle");			//판매 게시글명
	}

	MemberDAO mDAO = new MemberDAO();	//판매자정보
	
	String bSellTel = "";
	String bSellMail = "";
	rs = mDAO.get_info(bSellUser);		
	while (rs.next()){
		bSellTel = rs.getString("mTel");			//판매자 연락처
		bSellMail = rs.getString("mMail");		//판매자 이메일
	}
	
	
	rs = mDAO.get_info(id);				//구매자정보
	while (rs.next()) {
		bTel = rs.getString("mTel");				//구매자 연락처
		bMail = rs.getString("mMail");				//구매자 이메일
	}												//구매자 id는 현재 로그인된 id 사용
													
	%>												
	<!-- buy -->
	<div class="container">
		<div class="row">
			<form name="buyForm" method="post"
				action="<%=request.getContextPath()%>/buy_process.jsp" method="POST"
				id="buyForm">
				<fieldset>
					<legend class="mt-5 text-center">구매 정보</legend>
					<textarea class="d-none" id="pID" name="pID"><%=pID%></textarea>		
					<textarea class="d-none" id="pTitle" name="pTitle"><%=pTitle%></textarea>
					<textarea class="d-none" id="bSellTel" name="bSellTel"><%=bSellTel%></textarea>
					<textarea class="d-none" id="bSellMail" name="bSellMail"><%=bSellMail%></textarea>		
					<div class="mb-2 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">구매
							회원ID</label>
						<div class="col-lg-5">
							<input type="text" readonly
								class="form-control-plaintext fw-bold" id="bUser" name="bUser"
								value="<%=id%>">
						</div>
					</div>
					<div class="mb-2 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">구매
							가격</label>
						<div class="col-lg-5">
							<input type="text" readonly
								class="form-control-plaintext fw-bold" id="bPrice" name="bPrice"
								value="<%=bPrice%>">
						</div>
					</div>
					<div class="mb-2 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">연락처</label>
						<div class="col-lg-5">
							<input type="text" readonly
								class="form-control-plaintext fw-bold" id="bTel" name="bTel"
								value="<%=bTel%>">
						</div>
					</div>
					<div class="mb-2 row">
						<label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
						<div class="col-lg-5">
							<input type="text" readonly
								class="form-control-plaintext fw-bold" id="bEmail" name="bEmail"
								value="<%=bMail%>">
						</div>
					</div>
					<div class="mb-2 row">
						<label for="staticEmail" class="col-sm-2 col-form-label text-primary">판매 회원ID</label>
						<div class="col-lg-5">
							<input type="text" readonly
								class="form-control-plaintext fw-bold" id="bSellUser" name="bSellUser"
								value="<%=bSellUser%>">
						</div>
					</div>
					<div class="mb-2 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">희망
							요구사항</label>
						<div class="col-lg-12">
							<textarea class="form-control" placeholder="구체적으로 요구사항을 입력해 주세요"
								id="buyText" name="buyText" cols="20" wrap="hard" rows="7">직접 상담</textarea>
						</div>
					</div>
					<div class="mb-2 row">
						<div class="col-lg">
							<input type="button" value="구매 신청하기" class="btn btn-primary"
								onclick="buyFinish()"> <input type="button" value="뒤로가기"
								class="btn btn-outline-primary" onclick="cancel()">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		src = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	</script>





	<%
	}
	}
	%>
</body>
</html>