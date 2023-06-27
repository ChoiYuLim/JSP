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
	function showAlert(message) {
		alert(message);
	}
</script>
</head>
<body>
	<%
	String id = request.getParameter("id");

	UserDAO dao = new UserDAO();
	if (dao.changeStatus(id, "정상") != 0) {
	    out.println(
	    "<script>showAlert('회원가입 승인 성공'); window.location.href='joinPermission.jsp';</script>");
	} else {
	    out.println(
	    "<script>showAlert('회원가입 승인 실패'); window.location.href='joinPermission.jsp';</script>");
	}
	%>
</body>
</html>
