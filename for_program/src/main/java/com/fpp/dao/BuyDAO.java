package com.fpp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BuyDAO {

	
	public int buy(Connection conn, String bUser, int pID, String bPrice, String bTel, String bEmail, String bText) {
	
		String sql = "insert into buytbl values(0,?,?,?,?,?,?)";
		
		int row = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bUser);
			pstmt.setInt(2, pID);
			pstmt.setString(3,bPrice);
			pstmt.setString(4, bTel);
			pstmt.setString(5, bEmail);
			pstmt.setString(6, bText);
			row = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	//-------------------포스터ID에 해당하는 구매회원 정보--------------
	public ResultSet get_info(Connection conn, int pID) {
		
		String sql = "select * from buytbl where bPosterID = ? groupBy bUser";
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pID);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
				
	}
}
