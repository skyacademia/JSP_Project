package com.fpp.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

    public int Del_Member(String mID, String mPW) {
    	
    	String sql = "DELETE FROM membertbl WHERE mID=? AND mPW=?";
    	int value = -1;
    	try {
            String PW = encodeSha256(mPW);
            PreparedStatement pstmt = c.prepareStatement(sql);
            pstmt.setString(1, mID);
            pstmt.setString(2, PW);

            int r = pstmt.executeUpdate();
            return r;
            
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return -2;
    }

    public int Edit_Member(String mID, String mPW, String mName, String mTel, String mMail, String mAddress, String mText,
    		String mCompany, String mThum) {
        String sql = "UPDATE membertbl SET mPW=?, mName=?, mTel=?, mMail=?, mAddress=?, mText=? ,mCompany=?, mThum=? WHERE mID=?";
        try {
            PreparedStatement pstmt = c.prepareStatement(sql);
            
            String PW = encodeSha256(mPW);
            
            pstmt.setString(1, PW);
            pstmt.setString(2, mName);
            pstmt.setString(3, mTel);
            pstmt.setString(4, mMail);
            pstmt.setString(5, mAddress);
            pstmt.setString(6, mText);
            pstmt.setString(7, mCompany);
            pstmt.setString(8, mThum);
            pstmt.setString(9, mID);
            
            int r = pstmt.executeUpdate();
            return r;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -2;
    }
    
    private final static String mSalt ="코스";
    
    public String encodeSha256(String source) {
    	
    	String result = "";
    	
    	byte[] a = source.getBytes();
    	byte[] salt = mSalt.getBytes();
    	byte[] bytes = new byte[a.length + salt.length];
    	
    	System.arraycopy(a, 0, bytes, 0, a.length);
    	System.arraycopy(salt, 0, bytes, a.length, salt.length);
    	
    	try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			
			byte[] byteData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i]& 0xFF) * 256, 16).substring(1));
			}
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
    	
    	return result;
    }

    public int Register(String mID, String mPW, String mName, String mTel, String mMail, String mAddress, String mText,
    		String mCompany, String mThum) {
        String sql = "INSERT INTO membertbl VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = c.prepareStatement(sql);

            String PW = encodeSha256(mPW);
            pstmt.setString(1, mID);
            pstmt.setString(2, PW);
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
        String PW = encodeSha256(mPW);
        String sql = String.format("SELECT * FROM membertbl WHERE mID = '%s' AND mPW = '%s'", mID, PW);
        try {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(2).equals(PW)) {
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
