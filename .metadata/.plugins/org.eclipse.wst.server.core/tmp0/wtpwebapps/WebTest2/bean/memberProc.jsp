<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="memberBean" class="kr.co.jsplec.ex.memberBean" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!String id;
    String pwd;
    String name;
    String email;%>

	<%
	id = request.getParameter("id");
	pwd = request.getParameter("pwd");
	name = request.getParameter("name");
	email = request.getParameter("email");
	%>

	<jsp:setProperty name="memberBean" property="id" value="<%=id%>" />
	<jsp:setProperty name="memberBean" property="pwd" value="<%=pwd%>" />
	<jsp:setProperty name="memberBean" property="name" value="<%=name%>" />
	<jsp:setProperty name="memberBean" property="email" value="<%=email%>" />

	<a href="memberConfirm.jsp">회원 정보 확인</a>
</body>
</html>
