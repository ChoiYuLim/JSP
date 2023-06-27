package com.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {

    private DataSource ds;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String name = null, id = null, pw = null, phone = null, email = null, status = null,
            role = null;


    public UserDAO() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // 멤버 전부 불러오는 함수
    public ArrayList<UserDTO> getAllUsers() {
        ArrayList<UserDTO> dtos = new ArrayList<UserDTO>();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement("select * from users where role='일반사용자'");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                name = rs.getString("name");
                id = rs.getString("id");
                pw = rs.getString("pw");
                phone = rs.getString("phone");
                email = rs.getString("email");
                status = rs.getString("status");
                role = rs.getString("role");

                UserDTO dto = new UserDTO(name, id, pw, phone, email, status, role);
                dtos.add(dto);
            }
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

        return dtos;
    }

    // 아이디로 멤버 정보 가져오는 함수
    public UserDTO getUserInfo(String id) {
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM USERS WHERE ID = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                pw = rs.getString("pw");
                phone = rs.getString("phone");
                email = rs.getString("email");
                status = rs.getString("status");
                role = rs.getString("role");

                return new UserDTO(name, id, pw, phone, email, status, role);
            }

        } catch (Exception e) {
            e.printStackTrace();
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
        return null;
    }

    // status에 따라 멤버들의 정보 가져오는 함수
    public ArrayList<UserDTO> getUserByStatus(String status) {
        ArrayList<UserDTO> dtos = new ArrayList<UserDTO>();
        try {
            conn = ds.getConnection();
            pstmt = conn
                    .prepareStatement("SELECT * FROM USERS WHERE STATUS = ? AND ROLE = '일반사용자'");
            pstmt.setString(1, status);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                name = rs.getString("name");
                id = rs.getString("id");
                pw = rs.getString("pw");
                phone = rs.getString("phone");
                email = rs.getString("email");
                status = rs.getString("status");
                role = rs.getString("role");

                UserDTO dto = new UserDTO(name, id, pw, phone, email, status, role);
                dtos.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
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
        return dtos;
    }


    // 해당 아이디인 멤버의 정보를 수정
    public int modifyByUser(UserDTO dto) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(
                    "UPDATE USERS SET name = ?, pw = ?, phone = ?, email = ? WHERE id = ?");
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getPw());
            pstmt.setString(3, dto.getPhone());
            pstmt.setString(4, dto.getEmail());
            pstmt.setString(5, dto.getId());

            num = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
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

    // 해당 아이디인 멤버의 정보를 수정
    public int modifyByAdmin(UserDTO dto) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(
                    "UPDATE USERS SET name = ?, email = ?, status = ?, role = ? WHERE id = ?");
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getEmail());
            pstmt.setString(3, dto.getStatus());
            pstmt.setString(4, dto.getRole());
            pstmt.setString(5, dto.getId());

            num = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
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



    // 해당 아이디인 멤버의 status 수정
    public int changeStatus(String id, String status) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("UPDATE USERS SET status = ? WHERE id = ?");
            pstmt.setString(1, status);
            pstmt.setString(2, id);
            num = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
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

    // dto를 users 테이블에 삽입
    public int insertUser(UserDTO dto) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getId());
            pstmt.setString(3, dto.getPw());
            pstmt.setString(4, dto.getPhone());
            pstmt.setString(5, dto.getEmail());
            pstmt.setString(6, "승인 전");
            pstmt.setString(7, "일반사용자");

            num = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
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

    // 해당 아이디인 멤버 삭제
    public int deleteUser(String id) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("DELETE USERS WHERE id = ?");
            pstmt.setString(1, id);
            num = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
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
