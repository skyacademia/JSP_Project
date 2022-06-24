package com.fpp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PosterDAO {
	PreparedStatement pstmt = null;

// 여기에 정의한 함수들을 호출하려면 conn을 매개변수로 받는데 이는 호출하는 페이지에서 <%@ include file="dbconn.jsp">를 실행하여 conn을 얻을 수 있다.
//--------------------포스터ID에 해당하는 포스터 정보----------------------
	public ResultSet get_poster(Connection conn,int pID) {
		String sql = "SELECT * FROM posttbl where pid=?;";
		ResultSet rs = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pID);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
//---------------------포스터ID에 해당하는 작성자정보 + 포스터 정보-------------------
	public ResultSet get_poster_member(Connection conn,int pID) {
		String sql = "SELECT * FROM posttbl as P " + "inner join membertbl as M " + "on P.pWriter = M.mID "
				+ "inner join skilltbl as S on S.sMemberID = M.mID where pid=?;";
		ResultSet rs = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pID);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
//---------------------포스터ID에 해당하는 리뷰점수의 평균-------------------
	public ResultSet get_avgScore(Connection conn, int rPosterID) {
		String sql = "SELECT sum(rScore) as sum , count(rScore) as cnt FROM reviewtbl where rPosterID = ? ";
		
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rPosterID);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
//---------------------포스터ID에 해당하는 리뷰들-------------------
	public ResultSet get_review(Connection conn, int rPosterID) {
		String sql = "SELECT * FROM reviewtbl where rPosterID = ?";

		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rPosterID);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
//-------------------포스터 등록----------------------------------------
	public int add_poster(Connection conn, String pTitle,String pWriter, String pPrice, String pText, String pSkillText, String pCategory, String pImageName ) {

		int row = 0;
		String sql = "insert into posttbl values(0,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pTitle);
			pstmt.setString(2,pWriter);
			pstmt.setString(3,pPrice);
			pstmt.setString(4,pText);
			pstmt.setString(5,pSkillText);
			pstmt.setString(6,pCategory);
			pstmt.setString(7,null);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
}