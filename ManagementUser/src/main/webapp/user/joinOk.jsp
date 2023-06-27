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
	function showAlertAndRedirect(message, url) {
		alert(message);
		window.location.href = url;
	}
</script>
</head>
<body>
	<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO(name, id, pw, phone, email);

	// 일단 db에 넣고, 승인을 기다려야 함 
	// status를 '승인 전'으로 넣기
	if (dao.insertUser(dto) == 0) {
	    out.println("<script>showAlertAndRedirect('회원가입 실패', 'join.jsp');</script>");
	} else {
	    out.println("<script>showAlertAndRedirect('회원가입 성공, 승인 전 상태', 'userLogin.jsp');</script>");
	}
	%>
</body>
</html>