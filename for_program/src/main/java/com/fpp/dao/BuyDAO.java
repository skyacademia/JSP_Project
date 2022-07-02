package com.fpp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BuyDAO {

	
	public int buy(Connection conn, String bUser, String bSellUser,int pID, String bPrice, String bTel, String bEmail, String bText,String bTime,String bSellTel,String bSellMail,String pTitle) {
	
		String sql = "insert into buytbl(bID, bUser,bSellUser,bPosterID,bPrice,bTel,bEmail,bText,bSellTel,bSellMail,bSellTitle) values(0,?,?,?,?,?,?,?,?,?,?)";
		
		int row = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bUser);
			pstmt.setString(2, bSellUser);
			pstmt.setInt(3, pID);
			pstmt.setString(4,bPrice);
			pstmt.setString(5, bTel);
			pstmt.setString(6, bEmail);
			pstmt.setString(7, bText);
			pstmt.setString(8, bSellTel);
			pstmt.setString(9, bSellMail);
			pstmt.setString(10, pTitle);
			row = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	//-------------------구매자ID에 해당하는 구매회원 정보--------------
	public ResultSet get_info(Connection conn, String ID) {
		
		String sql = "select * from buytbl where bUser = ? group by bUser";
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
				
	}
}
