<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light p-4 mb-5">
        <a class="navbar-brand fs-2" href="#">ForProgram</a>
        <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarNav" 
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link fs-5" href="#">프로젝트 입력</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-5" href="#">프로젝트 등록</a>
                </li>
            </ul>
                <button class="btn btn-primary mx-1 px-5 fs-5" onclick="location.href='Login.jsp'">로그인</button>
                <button class="btn btn-outline-primary mx-1 px-5 fs-5" onclick="location.href='SignUP.jsp'">회원가입</button>
        </div>
    </nav>
    <!-- header end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>