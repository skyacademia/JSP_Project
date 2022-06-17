<%@page import="com.fpp.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
	<!-- 헤더와 카테고리 추가-->
	<jsp:include page="header.jsp" />
	<jsp:include page="category.jsp" />




	<!-- poster-top -->
	<div class="col-md-9 mt-5">
		
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">전체리스트</a></li>
            <li class="breadcrumb-item active" aria-current="page">인공지능</li>
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
            
            <%
            	MemberDAO memberDAO = new MemberDAO();
            	Connection conn = memberDAO.c;
	            PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from posttbl where pID=\"p001\"";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
            %>
            
            
            <div class="col-xl-6">
                <label class="fs-4"><%=rs.getString("pID") %></label><br> 
                <label class="fs-3 fw-bold"><%=rs.getString("pTitle") %></label><br> 
                <label class=""><%=rs.getString("pCategory") %></label>
                <div class="">
                    <span class="text-warning"> <i class="fa-solid fa-star"></i></span> 
                    <span class="fw-bold">4.5</span>
                </div>
                <div class="justify-content-end">
                    <div class="text-end">
                        <span class="fw-bold mx-4 fs-3"><%=rs.getString("pPrice") %>원</span>
                    </div>
                    <div class="text-center">
                        <input type="button" class="btn btn-warning w-75 mx-4" value="구매하기">
                    </div>
                </div>
            </div>
            <ul class="nav nav-pills nav-fill bg-light my-5 py-2">
                <li class="nav-item"><a class="nav-link text-black" href="#">서비스
                        설명</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="#">기술
                        소개</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="#">개발자
                        소개</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="#">리뷰
                        121</a></li>
            </ul>
        </div>
    </div>
    <!-- poster-top end -->

    <!-- poster-main -->
    <div class="container m-1">
        <div class="row">
            <div class="col">
                <h3 class="fw-bold">서비스 설명</h3>
                <div class="serviceBox">
                <p><%= rs.getString("pText") %></p>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    
                </div>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <h3 class="fw-bold">기술 소개</h3>
                <div class="skillBox">
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                </div>
            
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <h3 class="fw-bold">개발자 소개</h3>
                <div class="developerBox">
                	<p>
                	<p>membertbl을 불러오면 되는데
                	<p>conn을 껏다키면 비효율적인거같아
                	<p>조인을 해서 한번에 불러오게끔 해보기
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                    hi<br>
                </div>
            <hr>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <h3 class="fw-bold">리뷰</h3>
                <div class="reviewBox">
                	<p>리뷰테이블생성해야할듯...</p>
	                hi<br>
	                hi<br>
	                hi<br>
	                hi<br>
	                hi<br>
                </div>
                <% 
                }
				%>
                <hr>
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