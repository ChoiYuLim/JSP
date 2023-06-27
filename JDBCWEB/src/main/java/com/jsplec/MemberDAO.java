package com.jsplec;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
   
    private DataSource ds;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String name = null, id = null, pw = null, phone1 = null, phone2 = null, phone3 = null,
            gender = null;

    // 얘 자체의 객체 변수, 공유됨
    private static MemberDAO instance = new MemberDAO();


    public MemberDAO() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static MemberDAO getInstance() {
        return instance;
    }

    // 아이디로 멤버 정보 가져오는 함수
    public MemberDTO selectMember(String id) {

        MemberDTO dto = null;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("SELECT * FROM member2 WHERE id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            rs.next();
            name = rs.getString("name");
            pw = rs.getString("pw");
            phone1 = rs.getString("phone1");
            phone2 = rs.getString("phone2");
            phone3 = rs.getString("phone3");
            gender = rs.getString("gender");

            dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);

        } catch (Exception e) {

        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dto;
    }

    // 해당 아이디인 멤버의 정보를 수정
    public void modifyMember(MemberDTO dto) {
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(
                    "UPDATE member2 SET name = ?, pw = ?, phone1 = ?, phone2 = ?, phone3 = ?, gender = ? WHERE id = ?");
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getPw());
            pstmt.setString(3, dto.getPhone1());
            pstmt.setString(4, dto.getPhone2());
            pstmt.setString(5, dto.getPhone3());
            pstmt.setString(6, dto.getGender());
            pstmt.setString(7, dto.getId());

            pstmt.executeUpdate();

        } catch (Exception e) {

        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // dto를 member2 테이블에 삽입
    public int insertMember(MemberDTO dto) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("INSERT INTO member2 VALUES (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getPw());
            pstmt.setString(4, dto.getPhone1());
            pstmt.setString(5, dto.getPhone2());
            pstmt.setString(6, dto.getPhone3());
            pstmt.setString(7, dto.getGender());

            num = pstmt.executeUpdate();

        } catch (Exception e) {

        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return num;
    }
}
