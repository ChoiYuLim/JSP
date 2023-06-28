<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
</head>
<body>
	<h1>Write Post</h1>
	<form action="write_view.do" method="post">
		<label for="name">이름</label> <input type="text" id="name" name="name"
			required><br> <br> <label for="title">제목</label> <input
			type="text" id="title" name="title" required><br> <br>
		<label for="content">내용</label>
		<textarea id="content" name="content" rows="5" required></textarea>
		<br> <br> <input type="submit" value="Submit">
	</form>

	<a href="list_view.do">목록으로 가기</a>
</body>
</html>
