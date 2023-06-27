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
	String name = request.getParameter("name");
	String status = request.getParameter("status");
	String role = request.getParameter("role");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String pw = request.getParameter("pw");

	out.println("<script>console.log('" + role + " " + status + "');</script>");

	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO(name, id, pw, phone, email, status, role);
	if (dao.modifyByAdmin(dto) != 0) {
	    out.println(
	    "<script>showAlert('개인정보 수정 성공'); window.location.href='readAllUsersInfo.jsp';</script>");
	} else {
	    out.println(
	    "<script>showAlert('개인정보 수정 실패'); window.location.href='readAllUsersInfo.jsp';</script>");
	}
	%>
</body>
</html>
