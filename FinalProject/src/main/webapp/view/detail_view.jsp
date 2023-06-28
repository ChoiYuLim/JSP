<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

h1 {
	text-align: center;
}

table {
	width: 500px;
	margin: 20px auto;
	border-collapse: collapse;
}

table th, table td {
	padding: 10px;
	border: 1px solid #ccc;
}

table th {
	background-color: #f2f2f2;
	font-weight: bold;
}

table td {
	text-align: center;
}

input[type="text"] {
	width: 100%;
	padding: 5px;
	box-sizing: border-box;
}

textarea {
	width: 100%;
	height: 100px;
	padding: 5px;
	box-sizing: border-box;
}

.btn-container {
	margin-top: 20px;
	text-align: center;
}

.btn-container input[type="submit"] {
	margin: 5px;
}

a {
	display: block;
	margin-top: 20px;
	text-align: center;
}
</style>
</head>

<body>
	<h1>게시물 상세 내용</h1>
	<c:if test="${not empty board}">

		<form action="modify_view.do" method="post">
			<input type="hidden" name="id" value="${board.id}"> <input
				type="hidden" name="groupId" value="${board.groupId}"> <input
				type="hidden" name="levelNum" value="${board.levelNum}">
			<table>
				<tr>
					<th>번호</th>
					<td>${board.id}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${board.hit}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${board.name}"
						required></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${board.title}"
						required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" required>${board.content}</textarea></td>
				</tr>
			</table>
			<div class="btn-container">
				<input type="submit" value="수정"> <a href="list_view.do">목록보기</a><a
					href="delete_view.do?id=${board.id}">삭제</a> <a
					href="write_reply_view.do">답변</a>
			</div>
			<a href="write_view.jsp">글 작성</a>
		</form>
	</c:if>

</body>
</html>
