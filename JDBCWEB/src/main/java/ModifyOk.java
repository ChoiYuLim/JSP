
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 * Servlet implementation class ModifyOk
 */
public class ModifyOk extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String name, id, pw, phone1, phone2, phone3, gender;
    private String query;
    private Connection conn;
    private Statement stmt;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
        System.out.println("doGet");
        actionDo(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("doPost");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        name = request.getParameter("name");
        pw = request.getParameter("pw");
        phone1 = request.getParameter("phone1");
        phone2 = request.getParameter("phone2");
        phone3 = request.getParameter("phone3");
        gender = request.getParameter("gender");

        HttpSession session = request.getSession(true);
        id = session.getAttribute("id").toString();

        query = "update member2 set name = '" + name + "', pw = '" + pw + "', phone1 = '" + phone1
                + "', phone2 = '" + phone2 + "', phone3 = '" + phone3 + "', gender = '" + gender
                + "' where id = '" + id + "'";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink21.dbsvr";
            String user = "scott";
            String pwd = "tiger";
            conn = DriverManager.getConnection(url, user, pwd);
            stmt = conn.createStatement();
            int iResult = stmt.executeUpdate(query);
            System.out.println(iResult);

            if (iResult != 0) {
                System.out.println("update success");
                response.sendRedirect("modifyResult.jsp");
            } else {
                System.out.println("update fail");
                response.sendRedirect("modify.html");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify.html");
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
