<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 작성 페이지</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}

.readonly-text {
	border: none;
	background-color: transparent;
	padding: 0;
	font-family: inherit;
	font-size: inherit;
	outline: none;
}
</style>
</head>
<body>
	<h1>Write Reply</h1>
	<form action="write_reply_view.do" method="post">
		<input type="hidden" name="groupId"
			value="<%=request.getParameter("groupId")%>"> <input
			type="hidden" name="levelNum"
			value="<%=request.getParameter("levelNum")%>"> <input
			type="hidden" name="indent"
			value="<%=request.getParameter("indent")%>">
		<table>
			<tr>
				<th>번호</th>
				<td><input type="text" id="number" name="id" value="0" readonly
					class="readonly-text"></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><input type="text" id="hit" name="hit" value="0" readonly
					class="readonly-text"></td>
			</tr>
			<tr>
				<th><label for="name">이름</label></th>
				<td><input type="text" id="name" name="name" required></td>
			</tr>
			<tr>
				<th><label for="title">제목</label></th>
				<td><input type="text" id="title" name="title" required></td>
			</tr>
			<tr>
				<th><label for="content">내용</label></th>
				<td><textarea id="content" name="content" rows="5" required></textarea></td>
			</tr>
		</table>
		<br> <input type="submit" value="글쓰기">
	</form>
	<a href="list_view.do">목록으로 가기</a>
</body>
</html>
