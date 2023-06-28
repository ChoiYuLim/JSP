package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardCommand;
import model.BoardDTO;
import model.BoardDetailReadCommand;
import model.BoardModifyCommand;
import model.BoardReadCommand;
import model.BoardWriteCommand;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class BoardFrontController
 */

@WebServlet("*.do")
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
        System.out.println(uri);
        String conPath = request.getContextPath();
        System.out.println(conPath);
        String command = uri.substring(conPath.length());
        System.out.println(command);

        if (command.equals("/view/list_view.do")) {
            // BoardReadCommand 인스턴스 생성
            cmd = new BoardReadCommand();

            // BoardReadCommand의 execute 메서드 호출하여 board 목록 가져오기
            ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>) cmd.execute(request, response);

            // 가져온 board 목록을 request에 저장
            request.setAttribute("boardList", boardList);
            viewPage = "list_view.jsp";

            // 포워딩
            RequestDispatcher reqDpt = request.getRequestDispatcher(viewPage);
            reqDpt.forward(request, response);

        } else if (command.equals("/view/write_view.do")) {
            cmd = new BoardWriteCommand();
            cmd.execute(request, response);
            response.sendRedirect("list_view.do");

        } else if (command.equals("/view/detail_view.do")) {

            cmd = new BoardDetailReadCommand();
            BoardDTO board = (BoardDTO) cmd.execute(request, response);

            // JSP 파일로 전달할 데이터 설정
            request.setAttribute("board", board);

            viewPage = "detail_view.jsp";

            // 포워딩
            RequestDispatcher reqDpt = request.getRequestDispatcher(viewPage);
            reqDpt.forward(request, response);

        } else if (command.equals("/view/modify_view.do")) {
            cmd = new BoardModifyCommand();
            cmd.execute(request, response);
            response.sendRedirect("list_view.do");

        } else {
            System.out.println("연결 실패");
        }


    }

}
