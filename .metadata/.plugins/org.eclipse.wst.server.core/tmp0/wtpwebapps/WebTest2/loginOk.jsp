<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!String id;
    String pwd;%>

	<%
	id = request.getParameter("id");
	pwd = request.getParameter("pwd");

	if (id.equals("yulim") && pwd.equals("1234")) {
	    //Cookie cookie = new Cookie(id, pwd);
	    /* Cookie cookie_id = new Cookie("id", id);
	    Cookie cookie_pwd = new Cookie("pwd", pwd); */
	    //유효기간을 설정 
	    //cookie.setMaxAge(60 * 60);
	    /* cookie_id.setMaxAge(60 * 60);
	    cookie_pwd.setMaxAge(60 * 60); */
	    //response.addCookie(cookie);
	    /* 
	    response.addCookie(cookie_id);
	    response.addCookie(cookie_pwd); */


	    //여기서부터는 세션
	    session.setMaxInactiveInterval(60 * 60);
	    session.setAttribute("id", id);
	    session.setAttribute("pwd", pwd);



	    response.sendRedirect("welcome.jsp");

	} else
	    response.sendRedirect("login.jsp");
	%>

</body>
</html>