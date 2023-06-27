<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.UserDAO"%>
<%@ page import="com.jsp.UserDTO"%>
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
	String id = request.getParameter("id");

	UserDAO dao = new UserDAO();
	if (dao.deleteUser(id) != 0) {
	    out.println("<script>showAlert('회원탈퇴 승인 성공', 'withdrawalPermission.jsp');</script>");
	} else {
	    out.println("<script>showAlert('회원탈퇴 승인 실패', 'withdrawalPermission.jsp');</script>");
	}
	%>
</body>
</html>
