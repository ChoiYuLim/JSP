<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	/* Cookie[] cookies = request.getCookies();
	for (int i = 0; i < cookies.length; i++) {
	    String str = cookies[i].getName();

	    cookies[i].setMaxAge(0);
	    response.addCookie(cookies[i]);

	    out.println("삭제된 쿠키의 속성 이름(name[" + i + "]): " + cookies[i].getName() + "<br />");
	    out.println("삭제된 쿠키의 속성 값 (value[" + i + "]): " + cookies[i].getValue() + "<br />");
	    out.println("===================================================<br/>");

	} */

	// 여기서부터 세션
	session.invalidate();
	out.println("세션이 모두 삭제됐습니다.");

	response.sendRedirect("login.jsp");
	%>
</body>
</html>