<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsp.UserDAO"%>
<%@ page import="com.jsp.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	padding: 20px;
}

form {
	margin-top: 20px;
	max-width: 400px;
	background-color: #ffffff;
	padding: 20px;
	border: 1px solid #dddddd;
	border-radius: 4px;
	margin: 0 auto;
	text-align: center;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
	text-align: left;
}

input[type="text"], input[type="password"], input[type="email"], select
	{
	width: 100%;
	padding: 8px;
	border: 1px solid #dddddd;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

input[type="submit"] {
	padding: 8px;
	width: 100%;
	background-color: #4caf50;
	color: #ffffff;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.link-container {
	display: flex;
	justify-content: center;
}

.link-style {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	color: black;
	padding: 10px 20px;
	border-radius: 4px;
}

.link-style:hover {
	color: #45a049;
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
	} else if (request.getParameter("id") == null) {
	    out.println("<script>showAlert('잘못된 접근입니다.', 'readAllUsersInfo.jsp');</script>");
	} else {
	    String id = request.getParameter("id");
	    System.out.println(id);
	    UserDAO dao = new UserDAO();
	    UserDTO dto = dao.getUserInfo(id);

	    String name = dto.getName();
	    String email = dto.getEmail();
	    String status = dto.getStatus();
	    String role = dto.getRole();
	    String phone = dto.getPhone();
	    String pw = dto.getPw();
	%>
	<h1 style="text-align: center;">회원 정보 수정</h1>
	<form action="modifyAdminOk.jsp" method="post">
		<label for="name">이름</label> <input type="text" id="name" name="name"
			value="<%=name%>" maxlength="20" required> <label for="email">이메일</label>
		<input type="email" id="email" name="email" value="<%=email%>"
			title="유효한 이메일 주소를 입력해주세요." maxlength="20" required> <label
			for="status">상태</label> <select id="status" name="status">
			<option value="승인 전" <%=status.equals("승인 전") ? "selected" : ""%>>승인
				전</option>
			<option value="정상" <%=status.equals("정상") ? "selected" : ""%>>정상</option>
			<option value="일시정지" <%=status.equals("일시정지") ? "selected" : ""%>>일시정지</option>
		</select> <label for="role">권한</label> <select id="role" name="role">
			<option value="일반사용자" <%=role.equals("일반사용자") ? "selected" : ""%>>일반사용자</option>
			<option value="관리자" <%=role.equals("관리자") ? "selected" : ""%>>관리자</option>
		</select> <input type="hidden" name="id" value="<%=id%>"> <input
			type="hidden" name="phone" value="<%=phone%>"> <input
			type="hidden" name="pw" value="<%=pw%>"> <input type="submit"
			value="전송">
	</form>
	<div class="link-container">
		<a href="readAllUsersInfo.jsp" class="link-style">뒤로 가기</a>
	</div>
	<%
	}
	%>
</body>
</html>
