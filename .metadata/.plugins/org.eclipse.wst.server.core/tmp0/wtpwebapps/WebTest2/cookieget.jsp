<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Cookie[] cookies = request.getCookies();
out.println("현재 설정된 쿠키의 개수 -> " + cookies.length + "<br />");
out.println("===================================================<br/>");

for(int i = 0;i<cookies.length;i++){
    out.println("설정된 쿠키의 속성 이름 (name[" + i + "]): " + cookies[i].getName() + "<br />");
    out.println("설정된 쿠키의 속성 값 (value[" + i + "]): " + cookies[i].getValue() + "<br />");
    out.println("===================================================<br/>");
}


%>
<a href="cookiedel.jsp">cookie del</a>
</body>
</html>