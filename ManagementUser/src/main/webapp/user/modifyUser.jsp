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
	} else {
	    UserDAO dao = new UserDAO();
	    UserDTO dto = dao.getUserInfo((String) session.getAttribute("id"));

	    String name = dto.getName();
	    String email = dto.getEmail();
	    String pw = dto.getPw();
	    String phone = dto.getPhone();

	    String status = dto.getStatus();
	    String role = dto.getRole();
	%>

	<h1 style="text-align: center;">내 정보 수정</h1>
	<form action="modifyUserOk.jsp" method="post">
		<label for="name">이름</label> <input type="text" id="name" name="name"
			value="<%=name%>" maxlength="20" required> <label for="pw">비밀번호</label>
		<input type="password" name="pw" value="<%=pw%>"
			pattern="(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}"
			title="비밀번호는 영문과 숫자를 포함하여 최소 4글자 이상이어야 합니다." maxlength="20" required>
		<label for="phone">전화번호</label> <input type="text" name="phone"
			value="<%=phone%>" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
			title="전화번호는 000-0000-0000 형식이어야 합니다." maxlength="13" required>
		<label for="email">이메일</label> <input type="email" id="email"
			name="email" value="<%=email%>" title="유효한 이메일 주소를 입력해주세요."
			maxlength="20" required> <input type="hidden" name="status"
			value="<%=status%>"> <input type="hidden" name="role"
			value="<%=role%>"> <input type="submit" value="전송">
	</form>
	<div class="link-container">
		<a href="readMyInfo.jsp" class="link-style">뒤로 가기</a>
	</div>
	<%
	}
	%>
</body>
</html>
