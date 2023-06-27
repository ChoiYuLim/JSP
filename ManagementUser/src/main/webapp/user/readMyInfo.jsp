<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.UserDAO"%>
<%@ page import="com.jsp.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 조회</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

h1 {
	color: #333333;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #dddddd;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f5f5f5;
}

th {
	background-color: #4caf50;
	color: white;
}

form {
	display: inline;
}

button {
	background-color: #4caf50;
	border: none;
	color: white;
	padding: 8px 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

.link-style {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	color: black;
	padding: 10px 20px;
	border-radius: 4px;
}

.link-style:hover {
	color: #45a049;
}
</style>
<script>
	function showAlert(message, redirectUrl) {
		alert(message);
		window.location.href = redirectUrl;
	}
</script>
</head>
<body>
	<%
	if (session.getAttribute("id") == null) {
	    out.println("<script>showAlert('로그인이 만료되었습니다.', '../loginMain.jsp');</script>");
	} else {
	%>
	<h1>내 정보 조회</h1>
	<%
	UserDAO dao = new UserDAO();
	UserDTO dto = dao.getUserInfo((String) session.getAttribute("id"));
	%>

	<!-- 테이블 형태로 dtos의 정보 출력 -->
	<table>
		<tr>
			<th>Name</th>
			<th>ID</th>
			<th>Password</th>
			<th>Phone</th>
			<th>Email</th>
			<th>Status</th>
			<th>Role</th>
			<th>Modify</th>
		</tr>
		<tr>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getPw().replaceAll(".", "*")%></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getStatus()%></td>
			<td><%=dto.getRole()%></td>
			<td>
				<form method="post" action="modifyUser.jsp">
					<button type="submit">수정하기</button>
				</form>
			</td>
		</tr>
	</table>
	<a href="mainUser.jsp" class="link-style">회원 메뉴로 가기</a>
	<%
	}
	%>
</body>
</html>
