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
	<h1>회원정보 수정 성공</h1>
	<%
	// 세션에 저장된 id 값 가져오기
	String id = (String) session.getAttribute("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
	dao.modifyMember(dto);
	%>

	이름:
	<%=name%>
	<br /> 비밀번호:
	<%=pw%>
	<br /> 전화번호 1:
	<%=phone1%>
	<br /> 전화번호 2:
	<%=phone2%>
	<br /> 전화번호 3:
	<%=phone3%>
	<br /> 성별:
	<%=gender%>
	<br />

</body>
</html>