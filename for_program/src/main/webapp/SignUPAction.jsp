<%@page import="java.util.regex.Pattern"%>
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
<body>
	<%
		String id = request.getParameter("mID");			//아이디
		String pw = request.getParameter("mPW");			//비밀번호
		String name = request.getParameter("name");			//이름
		String tel = request.getParameter("tel");			//연락처
		String email = request.getParameter("email");		//이메일
		String company = request.getParameter("company");	//회사명
		String about = request.getParameter("about");		//자기소개
		String thum = "";
		//request.getParameter("thum");			//프로필사진
		
		String post = request.getParameter("post");			//우편번호
		String addr = request.getParameter("addr");			//도로명 혹은 지번주소
		String addr2 = request.getParameter("addr2");		//상세주소
		String address = addr + " (" + post + ") " + addr2;	
		//예시 ) 인천 남동구 OOO로 000 (21660) 000동 000호
		
		String input = "Login.jsp";	//로그인 성공시 이동할 페이지 명
		String pages = "'"+input+"'";
		
		String regExpPasswd = "^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@%^&*]).{8,25}$";
		boolean rs = Pattern.matches(regExpPasswd, pw);
		
		if(rs == true){
		
		    MemberDAO memberDAO = new MemberDAO();
		    int result = memberDAO.Register(id, pw, name, tel, email, address, about, company, thum);
		    if (result >= 1) {
				//session.setAttribute("id", id); // 아이디 세션 저장
				//session.setAttribute("pw", pw); // 비밀번호 세션 저장
		        PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert('회원가입 성공')");
		        script.println("location.href = " + pages); // 로그인 되면 이동할페이지
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
		}else{
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('비밀번호는 8자 이상 25자 미만이여야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.')");
	        script.println("history.back()");
	        script.println("</script>");
		}
	%>
</body>
</html>