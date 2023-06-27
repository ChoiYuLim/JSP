<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.UserDAO"%>
<%@ page import="com.jsp.UserDTO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 승인 페이지</title>
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
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #ffffff;
	border: 1px solid #dddddd;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #dddddd;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

form {
	display: inline-block;
}

button {
	padding: 5px 10px;
	background-color: #4caf50;
	color: #ffffff;
	border: none;
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
	<h1>회원탈퇴 승인 페이지</h1>
	<%
	UserDAO dao = new UserDAO();
	ArrayList<UserDTO> dtos = dao.getUserByStatus("일시정지");
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
			<th>Permission</th>
		</tr>
		<%
		for (UserDTO dto : dtos) {
		    String phone = dto.getPhone();
		    String modifiedPhone = phone.substring(0, 3) + "-XXXX-XXXX";
		%>
		<tr>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getPw()%></td>
			<td><%=modifiedPhone%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getStatus()%></td>
			<td><%=dto.getRole()%></td>
			<td>
				<form method="post" action="withdrawalPermissionOk.jsp">
					<input type="hidden" name="id" value="<%=dto.getId()%>">
					<button type="submit">탈퇴 승인</button>
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}
	%>
	<a href="mainAdmin.jsp" class="link-style">관리자 메뉴로 가기</a>
</body>
</html>
