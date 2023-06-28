<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 페이지</title>
</head>
<body>
	<h1>게시물 상세 내용</h1>
	<c:if test="${not empty board}">
		<h2>${board.title}</h2>
		<p>작성자: ${board.name}</p>
		<p>작성일: ${board.dateCreated}</p>
		<p>${board.content}</p>
	</c:if>

	<a href="list_view.do">목록으로 돌아가기</a>
</body>
</html>
