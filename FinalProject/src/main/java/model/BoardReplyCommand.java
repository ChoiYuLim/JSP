package model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardReplyCommand implements BoardCommand<Integer> {

    @Override
    public Integer execute(HttpServletRequest request, HttpServletResponse response) {
        BoardDAO dao = new BoardDAO();

        BoardDTO dto = new BoardDTO(request.getParameter("name"), request.getParameter("title"),
                request.getParameter("content"), Integer.parseInt(request.getParameter("groupId")),
                Integer.parseInt(request.getParameter("levelNum")),
                Integer.parseInt(request.getParameter("indent")));

        return dao.writeReplyBoard(Integer.parseInt(request.getParameter("pid")), dto);
    }

}
