<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="student" class="kr.co.jsplec.ex.Student" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty name="student" property="name" value="최유림" />
	<jsp:setProperty name="student" property="age" value="26" />
	
	<jsp:getProperty name="student" property="name" />
	<jsp:getProperty name="student" property="age" />
</body>
</html>
