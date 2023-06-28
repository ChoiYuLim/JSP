package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardCommand;
import model.BoardDTO;
import model.BoardReadCommand;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class BoardFrontController
 */
public class BoardFrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet");
        actionDo(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("actionDo");
        request.setCharacterEncoding("UTF-8");

        String viewPage = null;
        BoardCommand cmd = null;

        String uri = request.getRequestURI();
        String conPath = request.getContextPath();
        String command = uri.substring(conPath.length());

        if (command.equals("/list_view.do")) {
            // BoardReadCommand 인스턴스 생성
            cmd = new BoardReadCommand();

            // BoardReadCommand의 execute 메서드 호출하여 board 목록 가져오기
            ArrayList<BoardDTO> boardList = cmd.execute(request, response);

            // 가져온 board 목록을 request에 저장
            request.setAttribute("boardList", boardList);
            viewPage = "list_view.jsp";

        } else {
        }

        // 포워딩
        RequestDispatcher reqDpt = request.getRequestDispatcher(viewPage);
        reqDpt.forward(request, response);
    }

}
