<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.ResultSetMetaData"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!Connection connection;
    Statement statement;
    ResultSet resultSet;

    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink21.dbsvr";

    String user = "scott";
    String pwd = "tiger";
    String insertQuery;

    String id, pw, name, phone;%>

	<%
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	name = request.getParameter("name");
	phone = request.getParameter("phone");

	try {
	    Class.forName(driver);
	    connection = DriverManager.getConnection(url, user, pwd);
	    statement = connection.createStatement();

	    insertQuery = "insert into member(id, pw, name, phone) values('" + id + "','" + pw + "','"
	    + name + "','" + phone + "')";
	    statement.executeUpdate(insertQuery);

	    resultSet = statement.executeQuery("select * from member");

	    while (resultSet.next()) {
	        String id = resultSet.getString("id");
	        String pw = resultSet.getString("pw");
	        String name = resultSet.getString("name");
	        String phone = resultSet.getString("phone");

	        out.println(
	        "아이디: " + id + ", 비밀번호: " + pw + ", 이름: " + name + ", 전화번호: " + phone + "<br/>");
	    }
	} catch (ClassNotFoundException e) {
	    // 드라이버 로드 중 예외가 발생한 경우 처리합니다.
	    e.printStackTrace();
	} catch (SQLException e) {
	    // 데이터베이스 연결 및 쿼리 실행 중 예외가 발생한 경우 처리합니다.
	    e.printStackTrace();
	} finally {
	    resultSet.close();
	    statement.close();
	    connection.close();
	}
	%>

</body>
</html>
