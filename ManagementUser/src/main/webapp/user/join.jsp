<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	padding: 20px;
}

h1 {
	text-align: center;
}

form {
	max-width: 400px;
	margin: 0 auto;
	background-color: #ffffff;
	padding: 20px;
	border: 1px solid #dddddd;
	border-radius: 4px;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

input[type="text"], input[type="password"], input[type="email"] {
	width: 100%;
	padding: 8px;
	border: 1px solid #dddddd;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

input[type="submit"] {
	display: block;
	width: 100%;
	padding: 8px 16px;
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
	text-decoration: none;
	color: black;
	padding: 10px 20px;
	border-radius: 4px;
}

.link-style:hover {
	color: #45a049;
}
</style>

</head>
<body>
	<h1>회원가입</h1>
	<form action="joinOk.jsp" method="post">
		<label for="id">아이디</label> <input type="text" name="id" id="id"
			placeholder="아이디를 입력해주세요." maxlength="20" required> <br /> <label
			for="pw">비밀번호</label> <input type="password" name="pw" id="pw"
			placeholder="영문과 숫자 포함, 최소 4글자 이상으로 입력해주세요."
			pattern="(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}"
			title="비밀번호는 영문과 숫자를 포함하여 최소 4글자 이상이어야 합니다." maxlength="20" required>
		<br /> <label for="name">이름</label> <input type="text" name="name"
			id="name" placeholder="이름을 입력해주세요." maxlength="20" required>
		<br /> <label for="phone">전화번호</label> <input type="text"
			name="phone" id="phone" placeholder="000-0000-0000 형식으로 입력해주세요."
			pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
			title="전화번호는 000-0000-0000 형식이어야 합니다." maxlength="13" required>
		<br /> <label for="email">이메일</label> <input type="email"
			name="email" id="email" title="유효한 이메일 주소를 입력해주세요."
			placeholder="이메일을 입력해주세요." maxlength="20" required> <br /> <br />
		<input type="submit" value="확인">
	</form>
	<div class="link-container">
		<a href="../loginMain.jsp" class="link-style">로그인 메인 페이지로 가기</a>
	</div>
</body>
</html>
