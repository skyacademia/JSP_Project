<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fpp.dao.*" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
		<%--
		<%
			String id = (String)session.getAttribute("id");
			String pw = (String)session.getAttribute("pw"); // 계정 세션 불러오는 방법
			out.println(id + " + " + pw);
		%>
		--%>
<body>
	<%
		String id = request.getParameter("mID");
		String pw = request.getParameter("mPW");
		
        MemberDAO memberDAO = new MemberDAO();
        int result = memberDAO.Login(id, pw);
        if (result == 1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 성공')");
            session.setAttribute("id", id); // 아이디 세션 저장
    		session.setAttribute("pw", pw); // 비밀번호 세션 저장
            script.println("location.href = 'index.jsp'"); // 로그인 되면 이동할페이지
            script.println("</script>");
        } else if (result == 0) { // 비밀번호 불일치시
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()"); //뒤로가기, 다시 로그인 페이지
            script.println("</script>");
        } else if (result == -1) { 
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else if (result == -2) { 
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생했습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
    %>
</body>
</html>