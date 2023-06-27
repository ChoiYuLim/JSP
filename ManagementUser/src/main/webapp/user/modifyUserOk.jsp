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
	String id = (String) session.getAttribute("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String status = request.getParameter("status");
	String role = request.getParameter("role");

	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO(name, id, pw, phone, email, status, role);
	if (dao.modifyByUser(dto) != 0) {
	    out.println("<script>showAlertAndRedirect('개인정보 수정 성공', 'readMyInfo.jsp');</script>");
	} else {
	    out.println("<script>showAlertAndRedirect('개인정보 수정 실패', 'modifyUser.jsp');</script>");
	}
	%>


</body>
</html>