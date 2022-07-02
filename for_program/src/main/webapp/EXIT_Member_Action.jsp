<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fpp.dao.*" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%
    	MemberDAO memberDAO = new MemberDAO();
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		String ipw = request.getParameter("iPW");

		if(pw.equals(ipw)){
			System.out.println("비밀번호가 같다! 삭제를 진행합니다.");
		    int result = memberDAO.Del_Member(id, pw);
		    if (result >= 1) {
				session.removeAttribute("id");
		        PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert('회원탈퇴 성공')");
		        script.println("location.href = 'poster.jsp'"); // 로그인 되면 이동할페이지
		        script.println("</script>");
		    } else { // 비밀번호 불일치시
		        PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert('뭔가가 잘못되었습니다.')");
		        script.println("history.back()"); //뒤로가기
		        script.println("</script>");
		    }
		}else{
			System.out.println("무언가가 잘못되었다 무엇이 문제인가 pw : " + pw + "ipw : " + ipw);
		}
	%>
</body>
</html>