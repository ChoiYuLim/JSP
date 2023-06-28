package model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardDetailReadCommand implements BoardCommand<BoardDTO> {

    @Override
    public BoardDTO execute(HttpServletRequest request, HttpServletResponse response) {
        BoardDAO dao = new BoardDAO();
        return dao.getInfoUpdateHit(Integer.parseInt(request.getParameter("id")));
    }
}