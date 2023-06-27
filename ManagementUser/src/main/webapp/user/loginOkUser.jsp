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

	// 체크해야하는 것
	//0. id가 있는지 먼저 확인하고 있으면 가져와 dto를
	//1. 회원 권한이 일반 사용자가 맞는지
	//2. 회원 상태가 정상인지
	//3. 비밀번호가 맞는지

	if (dto != null) {
	    if (dto.getRole().equals("일반사용자")) {
	        if (dto.getStatus().equals("정상")) {
	    if (dto.getPw().equals(pw)) {
	        session.setAttribute("id", id);
	        out.println("<script>showAlertAndRedirect('로그인 성공', 'mainUser.jsp');</script>");
	    } else {
	        out.println(
	                "<script>showAlertAndRedirect('비밀번호가 틀립니다.', 'userLogin.jsp');</script>");
	    }
	        } else {
	    out.println("<script>showAlertAndRedirect('정상 회원이 아닙니다.', 'userLogin.jsp');</script>");
	        }
	    } else {
	        out.println("<script>showAlertAndRedirect('관리자입니다.', '../admin/adminLogin.jsp');</script>");
	    }
	} else {
	    out.println("<script>showAlertAndRedirect('없는 아이디입니다.', 'userLogin.jsp');</script>");
	}
	%>
</body>
</html>
