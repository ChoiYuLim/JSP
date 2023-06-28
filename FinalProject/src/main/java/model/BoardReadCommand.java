package model;

import java.util.ArrayList;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardReadCommand implements BoardCommand<ArrayList<BoardDTO>> {

    @Override
    public ArrayList<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response) {

        BoardDAO dao = new BoardDAO();
        return dao.getAllList();
    }

}
