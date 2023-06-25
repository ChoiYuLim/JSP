<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="joinOk.jsp" method="post">
		아이디 : <input type="text" name="id"> <br /> 비밀번호 : <input
			type="password" name="pw"> <br /> 이름: <input type="text"
			name="name"> <br /> 전화번호 1 : <input type="text"
			name="phone1"> <br /> 전화번호 2 : <input type="text"
			name="phone2"> <br /> 전화번호 3 : <input type="text"
			name="phone3"> <br /> 성별: <select name=gender>
			<option value="여자">여자</option>
			<option value="남자">남자</option>
		</select><br /> <br /> <input type="submit" value="확인">
	</form>

</body>
</html>