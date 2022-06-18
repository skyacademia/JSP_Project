<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fpp.dao.*" %>
<%@ page import = "java.sql.*" %>

<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 포스터 pID, pTitle, pWriter, pPrice, pText, pCategory, pImageName ++pSkillText-->
	<%
		MemberDAO memberDAO = new MemberDAO();
		Connection conn = memberDAO.c;
    	PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		String userID = null;	//아이디 불러오기 왜 안되지? ㅜㅜ
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
		
		
		
		
		
		
		/* 요기서안씀 나중에 필요하믄 dao클래스에 넣어보겟응ㅇ
		String add_m_id="";	String add_m_mail=""; String add_m_text=""; String add_m_thum="";
		String add_m_company=""; String add_m_tel=""; String add_m_address=""; 
		String add_m_name="";
		
		
		String sql = "select * from membertbl where mID=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userID);
		rs = pstmt.executeQuery();
		while(rs.next()){
			 add_m_id = rs.getString("mID");	
			 add_m_mail = rs.getString("mMail");
			 add_m_text = rs.getString("mText");
			 add_m_thum = rs.getString("mThum");
			 add_m_company = rs.getString("mCompany");
			 add_m_tel = rs.getString("mTel");
			 add_m_address = rs.getString("mAddress");
			 add_m_name = rs.getString("mName");
		}
		pstmt.close();
		*/
		
		
		
		
		/*
		세션 아이디 불러오고 해당 아이디에 관한 멤버테이블, 스킬테이블 로드
		
		
		
		만약 썸네일이미지가 없다면 null입력
		
		*/
	
		String add_p_title = request.getParameter("addTitle");
		String add_p_text = request.getParameter("addText");
		
		String add_p_price = request.getParameter("addPrice");
		if(add_p_price.equals(""))	add_p_price = "0";
		String add_p_category = request.getParameter("addCategory");
		
		String add_p_skillText = request.getParameter("addSkillText");
		String add_p_thum = request.getParameter("addThumnail");
			
			
			String sql_ = "insert into posttbl values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql_);
			pstmt.setString(1,"0");
			pstmt.setString(2,add_p_title);
			pstmt.setString(3,userID);
			pstmt.setString(4,add_p_price);
			pstmt.setString(5,add_p_text);
			pstmt.setString(6,add_p_skillText);
			pstmt.setString(7,add_p_category);
			pstmt.setString(8,null);
			
			int row = pstmt.executeUpdate();
			if(row == 0)
			{
				out.println("db에 등록 완료");
			}
			else
			{
				out.println("등록 실패");
			}
			pstmt.close();

			response.sendRedirect("poster.jsp");
	%>
</body>
</html>