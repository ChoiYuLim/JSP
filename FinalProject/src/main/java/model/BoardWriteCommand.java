package model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardWriteCommand implements BoardCommand<Integer> {

    @Override
    public Integer execute(HttpServletRequest request, HttpServletResponse response) {
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = new BoardDTO(request.getParameter("name"), request.getParameter("title"),
                request.getParameter("content"), dao.getGroupNew(), 1);
        return dao.insertBoard(dto);
    }
}
