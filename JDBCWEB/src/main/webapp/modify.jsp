<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<%
	String pw = "", name = "", phone1 = "", phone2 = "", phone3 = "", gender = "";
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.119.119:1521/dink21.dbsvr";
	String uid = "scott";
	String upw = "tiger";
	String query = "SELECT * FROM member2 where id = '" + session.getAttribute("id") + "'";

	try {
	    Class.forName(driver);
	    connection = DriverManager.getConnection(url, uid, upw);
	    statement = connection.createStatement();
	    resultSet = statement.executeQuery(query);

	    while (resultSet.next()) {
	        pw = resultSet.getString("pw");
	        name = resultSet.getString("name");
	        phone1 = resultSet.getString("phone1");
	        phone2 = resultSet.getString("phone2");
	        phone3 = resultSet.getString("phone3");
	        gender = resultSet.getString("gender");
	    }
	} catch (SQLException | ClassNotFoundException e) {
	    e.printStackTrace();
	} finally {
	    // Close resources in the finally block
	    if (resultSet != null) {
	        try {
	    resultSet.close();
	        } catch (SQLException e) {
	    e.printStackTrace();
	        }
	    }
	    if (statement != null) {
	        try {
	    statement.close();
	        } catch (SQLException e) {
	    e.printStackTrace();
	        }
	    }
	    if (connection != null) {
	        try {
	    connection.close();
	        } catch (SQLException e) {
	    e.printStackTrace();
	        }
	    }
	}
	%>
	<form action="ModifyOk" method="post">
		비밀번호 : <input type="password" name="pw" value=<%=pw%>> <br />
		이름: <input type="text" name="name" value=<%=name%>> <br />
		전화번호 1 : <input type="text" name="phone1" value=<%=phone1%>> <br />
		전화번호 2 : <input type="text" name="phone2" value=<%=phone2%>> <br />
		전화번호 3 : <input type=text name="phone3" value=<%=phone3%>> <br />
		성별: <select name="gender">
			<option value="여자" <%=gender.equals("여자") ? "selected" : ""%>>여자</option>
			<option value="남자" <%=gender.equals("남자") ? "selected" : ""%>>남자</option>
		</select><br /> <input type="submit" value="전송">

	</form>

</body>
</html>