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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	UserDAO dao = new UserDAO();
	UserDTO dto = dao.getUserInfo(id);

	if (dto != null) {
	    if (dto.getRole().equals("관리자")) {
	        if (dto.getPw().equals(pw)) {
	    session.setAttribute("id", id);
	    out.println("<script>showAlertAndRedirect('관리자 로그인 성공', 'mainAdmin.jsp');</script>");
	        } else {
	    out.println("<script>showAlertAndRedirect('비밀번호가 틀립니다.', 'adminLogin.jsp');</script>");
	        }
	    } else {
	        out.println(
	        "<script>showAlertAndRedirect('일반 사용자입니다.', '../user/userLogin.jsp');</script>");
	    }
	} else {
	    out.println("<script>showAlertAndRedirect('없는 아이디입니다.', 'adminLogin.jsp');</script>");
	}
	%>

</body>
</html>