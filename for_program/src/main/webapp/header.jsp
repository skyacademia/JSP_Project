<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id;
	try{	
		id = (String)pageContext.getSession().getAttribute("id");
	}catch(Exception e){
		id = null;
	}

%>

<div class="container">
	<nav class="navbar navbar-expand-md fixed-top bg-white">
		<div class="container-fluid">
			<a class="navbar-brand" href="./index.jsp">ForProgram</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">프로젝트 입력</a></li>
					<li class="nav-item"><a class="nav-link" href="posters.jsp">프로젝트
							검색</a></li>
					<% if(id == null){ %>
					<li class="nav-item">
						<a class="nav-link" href="Login.jsp" onclick=msg()>프로젝트 등록</a>

					</li>

					<% }else { %>
					<li class="nav-item"><a class="nav-link" href="addposter.jsp">프로젝트
							등록</a></li>
					<% } %>
				</ul>
				<% if(id == null){ %>
				<button class="btn btn-outline-primary me-3"
					onclick="location='Login.jsp'">로그인</button>
				<button class="btn btn-outline-success"
					onclick="location='SignUP.jsp'">회원가입</button>
				<% }else { %>
				<button class="btn btn-outline-primary me-3"
					onclick="location='Login.jsp'">마이페이지</button>
				<form action="Logout.jsp" method="post">
					<button class="btn btn-outline-success"
						type="submit">로그아웃</button>
				</form>
				<% } %>
			</div>
		</div>
	</nav>
	<!--- 
    <nav class="navbar navbar-expand-lg navbar-light bg-light p-4">
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
                    <a class="nav-link" href="posters.jsp">(임시)프로젝트 목록</a>
                </li>
              <% if(id == null){ %>
               	<li class="nav-item">
                    <a class="nav-link fs-5" href="header.jsp">프로젝트 등록</a>
                </li>
                <li class="nav-item">
                	<span class="nav-link">로그인을 해주세요!!!!@!@!@</span>
                </li>
            	<% }else { %>
                <li class="nav-item">
                    <a class="nav-link fs-5" href="addposter.jsp">프로젝트 등록</a>
                </li>
                <li class="nav-item">
                	<span class="nav-link fs-5">로그인됨 : <%=id %></span>
                </li>
               <% } %>
            </ul>
            <% if(id == null){ %>
                <button class="btn btn-primary mx-1 px-5 fs-5" onclick="location='Login.jsp'">로그인</button>
                <button class="btn btn-outline-primary mx-1 px-5 fs-5" onclick="location='SignUP.jsp'" >회원가입</button>
                <% }else { %>
            	<button class="btn btn-primary mx-1 px-5 fs-5" onclick="location='Login.jsp'">마이페이지</button>
            	<form action="Logout.jsp" method = "post">
                	<button class="btn btn-outline-primary mx-1 px-5 fs-5" type = "submit" >로그아웃</button>
            	</form>
                
            <% } %>
        </div>
    </nav>
    --->

	<script>
    function msg(){
    	alert("로그인을 해주세요");
    }
    </script>