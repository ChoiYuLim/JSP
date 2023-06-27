<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.UserDAO"%>
<%@ page import="com.jsp.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 메뉴</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	padding: 20px;
}

h1 {
	color: #333333;
	text-align: center;
}

.container {
	max-width: 400px;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 20px;
	border: 1px solid #dddddd;
	border-radius: 4px;
}

.container h2 {
	margin: 0 0 20px;
}

.container p {
	margin: 0 0 10px;
}

.container a {
	display: block;
	margin-bottom: 10px;
	text-align: center;
	text-decoration: none;
	color: #ffffff;
	background-color: #4caf50;
	padding: 10px 20px;
	border-radius: 4px;
}

.container a:hover {
	background-color: #45a049;
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
		UserDAO dao = new UserDAO();
		String name = dao.getUserInfo((String) session.getAttribute("id")).getName();
	%>
	<div class="container">
		<h2>회원 메뉴</h2>
		<p><%=name%>님 반갑습니다!
		</p>
		<a href="readMyInfo.jsp">개인정보 조회/수정</a> <a href="javascript:void(0);"
			onclick="confirmWithdrawal();">회원탈퇴</a> <a href="../logout.jsp">로그아웃</a>
	</div>
	<%
	}
	%>
	<script>
		function confirmWithdrawal() {
			var confirmation = confirm("정말 회원 탈퇴를 하시겠습니까?");
			if (confirmation) {
				window.location.href = "withdrawalOk.jsp";
			}
		}
	</script>

</body>
</html>
