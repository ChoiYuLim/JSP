<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자로 로그인</title>
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

form {
	max-width: 300px;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 20px;
	border: 1px solid #dddddd;
}

form label {
	display: block;
	margin-bottom: 10px;
	color: #333333;
	font-weight: bold;
}

form input[type="text"], form input[type="password"], form input[type="submit"]
	{
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #dddddd;
}

form input[type="text"], form input[type="password"] {
	box-sizing: border-box;
}

form input[type="submit"] {
	width: 100%;
	background-color: #4caf50;
	color: #ffffff;
	border: none;
	cursor: pointer;
}

form input[type="submit"]:hover {
	background-color: #45a049; . link-style { display : inline-block;
	margin-top: 20px;
	text-decoration: none;
	color: #ffffff;
	background-color: #4caf50;
	padding: 10px 20px;
	border-radius: 4px;
	transition: background-color 0.3s;
}

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
</head>
<body>
	<%
	if (session.getAttribute("id") == null) {
	%>
	<h1>관리자로 로그인</h1>
	<form action="loginOkAdmin.jsp" method="post">
		<label for="id">아이디</label> <input type="text" id="id" name="id"
			required> <label for="pw">비밀번호</label> <input
			type="password" id="pw " name="pw" required> <input
			type="submit" value="로그인">
	</form>

	<a href="../loginMain.jsp" class="link-style">로그인 메인 페이지로 가기</a>

	<%
	} else {
	%>
	<script>
		window.location.href = 'mainAdmin.jsp';
	</script>

	<%
	}
	%>
</body>
</html>
