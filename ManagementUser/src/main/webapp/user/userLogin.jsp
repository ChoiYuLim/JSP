<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원으로 로그인</title>
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

.container {
	max-width: 400px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 4px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-top: 0;
}

form {
	margin-top: 20px;
}

form label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

form input[type="text"], form input[type="password"], form input[type="submit"]
	{
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

form input[type="submit"] {
	background-color: #4caf50;
	color: #fff;
	border: none;
	cursor: pointer;
}

form input[type="submit"]:hover {
	background-color: #45a049;
}

.link-container {
	text-align: center;
	margin-top: 10px;
}

.link-container a {
	color: #000;
	text-decoration: none;
}

.link-container a:hover {
	text-decoration: underline;
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
	<div class="container">
		<h1>회원으로 로그인</h1>
		<form action="loginOkUser.jsp" method="post">
			<label for="id">아이디</label> <input type="text" name="id" id="id">
			<label for="pw">비밀번호</label> <input type="password" name="pw" id="pw">
			<input type="submit" value="로그인">
		</form>
		<div class="link-container">
			<a href="join.jsp">회원가입</a>
		</div>
	</div>
	<a href="../loginMain.jsp" class="link-style">로그인 메인 페이지로 가기</a>
	<%
	} else {
	%>
	<script>
		window.location.href = 'mainUser.jsp';
	</script>

	<%
	}
	%>
</body>
</html>
