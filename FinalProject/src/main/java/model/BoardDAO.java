package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

    private DataSource ds;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String name = null, title = null, content = null;
    Timestamp dateCreated = null;
    int id = 0, hit = 0, groupId = 0, levelNum = 0, indent = 0, pid = 0;

    public BoardDAO() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // BOARD 리스트 전부 불러오는 함수
    public ArrayList<BoardDTO> getAllList() {
        ArrayList<BoardDTO> dtos = new ArrayList<BoardDTO>();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(
                    "SELECT * FROM (SELECT id, name, title, content, date_created, hit, group_id, level_num, indent, pid, SYS_CONNECT_BY_PATH(id, '/') AS path FROM MVC_BOARD START WITH pid = 0 CONNECT BY PRIOR id = pid ORDER SIBLINGS BY level_num ASC, date_created DESC) t ORDER BY path");


            rs = pstmt.executeQuery();

            while (rs.next()) {
                id = rs.getInt("ID");
                name = rs.getString("NAME");
                title = rs.getString("TITLE");
                content = rs.getString("CONTENT");
                dateCreated = rs.getTimestamp("DATE_CREATED");
                hit = rs.getInt("HIT");
                groupId = rs.getInt("GROUP_ID");
                levelNum = rs.getInt("LEVEL_NUM");
                indent = rs.getInt("INDENT");
                pid = rs.getInt("PID");

                BoardDTO dto = new BoardDTO(id, name, title, content, dateCreated, hit, groupId,
                        levelNum, indent, pid);
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

    // dto를 MVC_BOARD 테이블에 삽입
    public int insertBoard(BoardDTO dto) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(
                    "INSERT INTO MVC_BOARD(NAME, TITLE, CONTENT, DATE_CREATED, GROUP_ID, LEVEL_NUM) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            pstmt.setInt(5, dto.getGroupId());
            pstmt.setInt(6, 0);

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

    // dto를 MVC_BOARD 테이블에 삽입
    public int writeReplyBoard(int pId, BoardDTO dto) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(
                    "INSERT INTO MVC_BOARD(NAME, TITLE, CONTENT, DATE_CREATED, GROUP_ID, LEVEL_NUM, INDENT, PID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            pstmt.setInt(5, dto.getGroupId());
            pstmt.setInt(6, dto.getLevelNum() + 1);
            pstmt.setInt(7, dto.getIndent() + 1);
            pstmt.setInt(8, pId);

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



    // 아이디로 멤버 정보 가져오는 함수
    public BoardDTO getInfoUpdateHit(int id) {

        BoardDTO dto = null;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("SELECT * FROM MVC_BOARD WHERE id = ?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            rs.next();
            name = rs.getString("NAME");
            title = rs.getString("TITLE");
            content = rs.getString("CONTENT");
            dateCreated = rs.getTimestamp("DATE_CREATED");
            hit = rs.getInt("HIT") + 1;
            groupId = rs.getInt("GROUP_ID");
            levelNum = rs.getInt("LEVEL_NUM");
            indent = rs.getInt("INDENT");
            pid = rs.getInt("PID");

            dto = new BoardDTO(id, name, title, content, dateCreated, hit, groupId, levelNum,
                    indent, pid);

            pstmt = conn.prepareStatement("UPDATE MVC_BOARD SET HIT = ? WHERE id = ?");
            pstmt.setInt(1, dto.getHit());
            pstmt.setInt(2, id);
            pstmt.executeUpdate();

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
        return dto;
    }

    // 해당 ID값의 글을 수정
    public int modifyBoard(int id, BoardDTO dto) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(
                    "UPDATE MVC_BOARD SET name = ?, title = ?, content = ?, DATE_CREATED = ? WHERE id = ?");
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            pstmt.setInt(5, id);

            System.out.println(id);
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

    // 새로 작성하는 글의 group값
    public int getGroupNew() {
        int num = 1;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("SELECT MAX(ID) FROM MVC_BOARD");

            rs = pstmt.executeQuery();
            rs.next();
            num = rs.getInt(1) + 1;

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

    // 현재 level 최대값 받아오기
    public int getLevel(int id) {
        int num = 1;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("SELECT MAX(LEVEL_NUM) FROM MVC_BOARD WHERE PID = ?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            rs.next();
            num = rs.getInt(1);

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

    // 해당 ID값의 글 삭제
    public int deleteBoard(int id) {
        int num = 0;
        try {
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("DELETE MVC_BOARD WHERE ID = ?");
            pstmt.setInt(1, id);
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
