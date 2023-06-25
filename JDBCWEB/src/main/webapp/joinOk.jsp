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
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);

	if (dao.insertMember(dto) == 0) {
	    System.out.println("join fail");
	    response.sendRedirect("join.jsp");
	} else {
	    System.out.println("join success");
	    response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>