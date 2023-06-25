<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jsplec.MemberDAO"%>
<%@ page import="com.jsplec.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberDAO dao = new MemberDAO();
	String name = dao.selectMember((String) session.getAttribute("id")).getName();
	%>

	<%=name%>님 반갑습니다!
	<br />
	<br />
	<a href="modify.jsp">정보수정</a>
	<br />
	<a href="logout.jsp">로그아웃</a>
</body>
</html>