<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 프로그램</title>
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

a {
	display: block;
	margin: 0 auto 10px;
	text-align: center;
	text-decoration: none;
	color: #ffffff;
	background-color: #4caf50;
	padding: 10px 10px; /* Adjust the padding values to modify the width */
	border-radius: 4px;
	width: 20%; /* Adjust the width as desired */
}

a:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<h1>회원 관리 프로그램</h1>
	<a href="user/userLogin.jsp">회원 로그인</a>
	<a href="admin/adminLogin.jsp">관리자 로그인</a>
</body>
</html>
