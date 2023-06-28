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
    int id = 0, hit = 0, groupId = 0, levelNum = 0, indent = 0;


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
            pstmt = conn.prepareStatement("SELECT * FROM MVC_BOARD");
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

                BoardDTO dto = new BoardDTO(id, name, title, content, dateCreated, hit, groupId,
                        levelNum, indent);
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
                    "INSERT INTO MVC_BOARD(NAME, TITLE, CONTENT, GROUP_ID, LEVEL_NUM) VALUES (?, ?, ?, ?, ?)");
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setInt(4, dto.getGroupId());
            pstmt.setInt(5, dto.getLevelNum());

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
