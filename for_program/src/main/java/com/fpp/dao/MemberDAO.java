package com.fpp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.fpp.dto.*;;

public class MemberDAO {
    public Connection c;
    MemberDTO member = new MemberDTO();

    public MemberDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspsql?serverTimezone=UTC", "root", "root");
//            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspsql?serverTimezone=UTC", "root", "1234");
         
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int Register(String mID, String mPW, String mName, String mTel, String mMail, String mAddress, String mText,
    		String mCompany, String mThum) {
        String sql = "INSERT INTO membertbl VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = c.prepareStatement(sql);

            pstmt.setString(1, mID);
            pstmt.setString(2, mPW);
            pstmt.setString(3, mName);
            pstmt.setString(4, mTel);
            pstmt.setString(5, mMail);
            pstmt.setString(6, mAddress);
            pstmt.setString(7, mText);
            pstmt.setString(8, mCompany);
            pstmt.setString(9, mThum);
            
            int r = pstmt.executeUpdate();
            return r;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -2;
    }
    
    public int idCheck(String mID) {
    	
    	String sql = "SELECT mID FROM membertbl WHERE mID = ?";
    	int value = -1;
    	try {
            PreparedStatement pstmt = c.prepareStatement(sql);
            pstmt.setString(1, mID);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next())
            	value = 0;
            else
            	value = 1;
            
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return value;
    }

    
    
    

    public int Login(String mID, String mPW) {
        String sql = String.format("SELECT * FROM membertbl WHERE mID = '%s' AND mPW = '%s'", mID, mPW);
        try {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(2).equals(mPW)) {
                    member.setMember(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                    rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                    return 1;
                } else {
                    return 0;
                }
            }
            return -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -2;
    }
    
    //----------------------회원 ID에 해당하는 회원 정보------------------
    public ResultSet get_info(String mID) {
    	String sql = String.format("select * from membertbl where mID = ?");
    	ResultSet rs = null;
        try {
			PreparedStatement pstmt = c.prepareStatement(sql);
			pstmt.setString(1, mID);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        return rs;
    }
    
}
