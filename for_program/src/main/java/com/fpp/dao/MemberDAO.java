package com.fpp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.fpp.dto.*;;

public class MemberDAO {
    private Connection c;
    MemberDTO member = new MemberDTO();

    public MemberDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspsql?serverTimezone=UTC", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int Register(String mID, String mPW, String mName, String mTel, String mMail, String mAddress, String mText,
            String mSkill) {
        String sql = "INSERT INTO membertbl VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = c.prepareStatement(sql);

            pstmt.setString(1, "");
            pstmt.setString(2, "");
            pstmt.setString(3, "");
            pstmt.setString(4, "");
            pstmt.setString(5, "");
            pstmt.setString(6, "");
            pstmt.setString(7, "");
            pstmt.setString(8, "");

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int Login(String mID, String mPW) {
        String sql = String.format("SELECT * FROM membertbl WHERE mID = '%s' AND mPW = '%s'", mID, mPW);
        try {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(2).equals(mPW)) {
                    member.setMember(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                            rs.getString(5),
                            rs.getString(6), rs.getString(7), rs.getString(8));
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
}
