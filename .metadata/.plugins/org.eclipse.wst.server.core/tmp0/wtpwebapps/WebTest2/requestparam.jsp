<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!String name, id, pwd, major, protocol;
    String[] hobby;%>

	<%
	request.setCharacterEncoding("EUC_KR");

	name = request.getParameter("name");
	id = request.getParameter("id");
	pwd = request.getParameter("passwd");
	major = request.getParameter("major");
	protocol = request.getParameter("protocol");

	hobby = request.getParameterValues("hobby");
	%>

	이름&nbsp;:&nbsp<%=name%><br /> 아이디&nbsp;:&nbsp<%=id%><br />
	비밀번호&nbsp;:&nbsp<%=pwd%><br /> 전공&nbsp;:&nbsp<%=major%><br />
	프로토콜&nbsp;:&nbsp<%=protocol%><br /> 취미&nbsp;:&nbsp<%=String.join(", ", hobby)%><br />
</body>
</html>