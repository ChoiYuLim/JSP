<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="memberBean" class="kr.co.jsplec.ex.memberBean"
	scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<jsp:getProperty name="memberBean" property="id" />
	<jsp:getProperty name="memberBean" property="pwd" />
	<jsp:getProperty name="memberBean" property="name" />
	<jsp:getProperty name="memberBean" property="email" />

</body>
</html>