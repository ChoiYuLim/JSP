package model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardDeleteCommand implements BoardCommand<Integer> {

    @Override
    public Integer execute(HttpServletRequest request, HttpServletResponse response) {
        BoardDAO dao = new BoardDAO();
        return dao.deleteBoard(Integer.parseInt(request.getParameter("id")));
    }
}
