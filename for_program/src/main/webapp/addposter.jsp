<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function addFinish() {
		var form = document.getElementById("addForm");
		if (confirm("게시물을 등록 하시겠습니까?")) {
			
			form.submit();
			alert("등록이 완료되었습니다.");
		}
	}
	function cancel() {

		if (confirm("취소 하시겠습니까?")) {
			window.history.back();
		}
	}
</script>
</head>
<body>
	<!-- 헤더 추가-->
	<jsp:include page="header.jsp" />

	<!-- 포스터 등록 -->
	<%
	String userID = null;
	if (session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");
	}
	%>


	<form name="addForm" action = "<%= request.getContextPath()%>/addposter_process.jsp"
			method = "POST" id="addForm">
		<div class="container mt-5">
			<div class="row mx-5">
				<h3 class="mb-5" style="text-align: center;">게시물 등록 화면</h3>

				<div class="row">
					<div class="col-md-4">
						<div class="input-group mb-3 ">
							<label class="input-group-text" for="addCategory">카테고리</label> <select
								class="form-select" id="addCategory" name="addCategory">
								<option selected>인공지능</option>
								<option value="백앤드">백앤드</option>
								<option value="프론트앤드">프론트앤드</option>
								<option value="Three">Three</option>
							</select>
						</div>
					</div>
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<div class="input-group">
							<span class="input-group-text">가격</span> <input type="text"
								aria-label="First name" class="form-control"
								placeholder="1000000" id="addPrice" name="addPrice">
						</div>
					</div>
					<div class="col-md-4"></div>
				</div>

				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">
						제목 : </label> <input type="text" class="form-control" id="addTitle"
						name="addTitle" placeholder="포스터의 제목을 입력해주세요">
				</div>


				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">서비스
						설명 : </label>
					<textarea class="form-control" placeholder="제공하는 서비스를 입력해주세요"
						id="addText" name="addText" rows="18"></textarea>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">기술
						소개 : </label>
					<textarea class="form-control"
						placeholder="서비스에 필요한 기술에 대한 설명을 입력해주세요" id="addSkillText"
						name="addSkillText" rows="7"></textarea>

				</div>

				<div class="mb-3">
					<label for="formFile" class="form-label">썸네일 이미지 : </label> <input
						class="form-control" type="file" id="addThumnail"
						name="addThumnail">
				</div>

				<div class="my-5">
					<button type="button" class="btn btn-warning" onclick="addFinish()">등록
						완료</button>
					<button type="button" class="btn btn-outline-warning"
						onclick="cancel()">취소</button>
				</div>
			</div>
		</div>
	</form>
	<!-- 포스토 등록 end -->

	<script type="text/javascript">
		src = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	</script>
</body>

</html>