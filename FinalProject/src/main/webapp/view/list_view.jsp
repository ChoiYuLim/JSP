<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD List</title>
<style>
body {
	font-family: Arial, sans-serif;
}

h1 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<h1>Board List</h1>
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Title</th>
				<th>Content</th>
				<th>Date</th>
				<th>Hit</th>
				<th>GroupId</th>
				<th>Level</th>
				<th>Indent</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boardList}" var="board">
				<tr>
					<td>${board.id}</td>
					<td>${board.name}</td>
					<td><a href="detail_view.do?id=${board.id}">${board.title}</a></td>
					<td>${board.content}</td>
					<td>${board.dateCreated}</td>
					<td>${board.hit}</td>
					<td>${board.groupId}</td>
					<td>${board.levelNum}</td>
					<td>${board.indent}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<a href="write_view.jsp">글 작성</a>
</body>
</html>
