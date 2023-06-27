<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.UserDAO"%>
<%@ page import="com.jsp.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script>
	function showAlertAndRedirect(message, url) {
		alert(message);
		window.location.href = url;
	}
</script>
</head>
<body>
	<%
	String id = (String) session.getAttribute("id");
	UserDAO dao = new UserDAO();
	if (dao.changeStatus(id, "일시정지") != 0) {
	%>
	<script>
		showAlertAndRedirect('회원탈퇴 요청 성공', '../logout.jsp');
	</script>
	<%
	} else {
	%>
	<script>
		showAlertAndRedirect('회원탈퇴 요청 실패', 'mainUser.jsp');
	</script>
	<%
	}
	%>

</body>
</html>
