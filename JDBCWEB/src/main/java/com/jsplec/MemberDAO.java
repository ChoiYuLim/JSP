package com.jsplec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
            conn = DriverManager.getConnection(url, uid, upw);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM member2 where id = '" + id + "'");

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
            stmt = conn.createStatement();
            stmt.executeUpdate("update member2 set name = '" + dto.getName() + "', pw = '"
                    + dto.getPw() + "', phone1 = '" + dto.getPhone1() + "', phone2 = '"
                    + dto.getPhone2() + "', phone3 = '" + dto.getPhone3() + "', gender = '"
                    + dto.getGender() + "' where id = '" + dto.getId() + "'");

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
            stmt = conn.createStatement();
            num = stmt.executeUpdate("insert into member2 values('" + dto.getId() + "','"
                    + dto.getName() + "','" + dto.getPw() + "','" + dto.getPhone1() + "','"
                    + dto.getPhone2() + "','" + dto.getPhone3() + "','" + dto.getGender() + "')");

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
