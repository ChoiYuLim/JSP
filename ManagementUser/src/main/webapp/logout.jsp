<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function showAlert(message, redirectUrl) {
		alert(message);
		window.location.href = redirectUrl;
	}
</script>
</head>
<body>
	<%
	session.removeAttribute("id");
	out.println("<script>showAlert('로그아웃', 'loginMain.jsp');</script>");
	%>
</body>
</html>