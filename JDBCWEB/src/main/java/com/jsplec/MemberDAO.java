package com.jsplec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MemberDAO {
    private String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink21.dbsvr";
    private String uid = "scott";
    private String upw = "tiger";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String name = null, id = null, pw = null, phone1 = null, phone2 = null, phone3 = null,
            gender = null;

    public MemberDAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * // 멤버 전부 불러오는 함수 public ArrayList<MemberDTO> memberSelect() { ArrayList<MemberDTO> dtos = new
     * ArrayList<MemberDTO>();
     * 
     * try { conn = DriverManager.getConnection(url, uid, upw); stmt = conn.createStatement(); rs =
     * stmt.executeQuery("select * from member2");
     * 
     * while (rs.next()) { name = rs.getString("name"); id = rs.getString("id"); pw =
     * rs.getString("pw"); phone1 = rs.getString("phone1"); phone2 = rs.getString("phone2"); phone3
     * = rs.getString("phone3"); gender = rs.getString("gender");
     * 
     * MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender); dtos.add(dto); }
     * } catch (Exception e) {
     * 
     * } finally { try { if (rs != null) rs.close(); if (stmt != null) stmt.close(); if (conn !=
     * null) conn.close(); } catch (Exception e) { e.printStackTrace(); } }
     * 
     * return dtos; }
     */

    // 아이디로 멤버 정보 가져오는 함수
    public MemberDTO selectMember(String id) {
        MemberDTO dto = null;
        try {
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM member2 WHERE id = ?");
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
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println(dto.getGender());
        return dto;
    }

    // 해당 아이디인 멤버의 정보를 수정
    public void modifyMember(MemberDTO dto) {
        try {
            conn = DriverManager.getConnection(url, uid, upw);
            PreparedStatement pstmt = conn.prepareStatement(
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
                if (stmt != null)
                    stmt.close();
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
            conn = DriverManager.getConnection(url, uid, upw);
            PreparedStatement pstmt =
                    conn.prepareStatement("INSERT INTO member2 VALUES (?, ?, ?, ?, ?, ?, ?)");
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
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return num;
    }
}
