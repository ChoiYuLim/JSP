<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴</title>
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
	margin-bottom: 15px;
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
	%>
	<h1>관리자 메뉴</h1>
	<div class="container">
		<p>다음의 링크를 통해 관리 작업을 수행할 수 있습니다.</p>
		<br /> <a href="readAllUsersInfo.jsp">회원 정보 조회하기</a> <a
			href="joinPermission.jsp">회원가입 승인 페이지</a> <a
			href="withdrawalPermission.jsp">회원탈퇴 승인 페이지</a> <a
			href="../logout.jsp">로그아웃</a>
	</div>
	<%
	}
	%>
</body>
</html>
