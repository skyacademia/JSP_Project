<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fpp.dao.*" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ page import="java.io.*"%>								<!-- 1. 업로드용임포트 -->
<%@ page import="com.oreilly.servlet.*"%>					<!-- 1. 업로드용임포트 -->
<%@ page import="com.oreilly.servlet.multipart.*"%>			<!-- 1. 업로드용임포트 -->
<%@ page import="java.util.*"%>								<!-- 1. 업로드용임포트 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>																			
	<%				
	
	//2. 업로드 모시깽이들  ~33
	String filename = null;
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	String realPath = request.getServletContext().getRealPath("resources/images");
	MultipartRequest multi = new MultipartRequest(request, realPath, 5 * 1024 * 1024, "utf-8", policy);
	
	Enumeration files = multi.getFileNames();
	String str = (String) files.nextElement();
	filename = multi.getFilesystemName(str);			//업로드한 이미지명
	
	if (filename == null)
		filename = "defaultMember.png";					//멤버썸네일용 이미지
	
	
	//3.request -> multi												
		String id = multi.getParameter("mID");			//아이디
		String pw = multi.getParameter("mPW");			//비밀번호
		String name = multi.getParameter("name");			//이름
		String tel = multi.getParameter("tel");			//연락처
		String email = multi.getParameter("email");		//이메일
		String company = multi.getParameter("company");	//회사명
		String about = multi.getParameter("about");		//자기소개
		String Skill = multi.getParameter("Skill");		//보유기술
		
		//request.getParameter("thum");			//지우면 됩니다 위에 =filename
		
		String post = multi.getParameter("post");			//우편번호
		String addr = multi.getParameter("addr");			//도로명 혹은 지번주소
		String addr2 = multi.getParameter("addr2");		//상세주소
		String address = addr + " (" + post + ") " + addr2;	
		//예시 ) 인천 남동구 OOO로 000 (21660) 000동 000호
		
		String input = "Login.jsp";	//로그인 성공시 이동할 페이지 명
		String pages = "'"+input+"'";
		
		String regExpPasswd = "^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@%^&*]).{8,25}$";
		boolean rs = Pattern.matches(regExpPasswd, pw);
		
		
		//4. 변수filename으로 변경
		if(rs == true){
		
		    MemberDAO memberDAO = new MemberDAO();
		    int result = memberDAO.Register(id, pw, name, tel, email, address, about, company, filename, Skill);
		    if (result >= 1) {
				//session.setAttribute("id", id); // 아이디 세션 저장
				//session.setAttribute("pw", pw); // 비밀번호 세션 저장
		        PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert('회원가입 성공')");
		        script.println("location.href = " + pages); // 로그인 되면 이동할페이지
		        script.println("</script>");
		    } else { // 비밀번호 불일치시
		        PrintWriter script = response.getWriter();
		        script.println("<script>");
		        script.println("alert('뭔가가 잘못되었습니다.')");
		        script.println("history.back()"); //뒤로가기, 다시 로그인 페이지
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