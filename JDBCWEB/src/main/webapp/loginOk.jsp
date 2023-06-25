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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	// 회원 인증을 할 때, dao로 가져와
	// 1. select * from member2 where id = id, pw = pw으로 다 가져와서, id 와 pw를 비교하기 -> 재사용성이 없음
	// 2. select * from member2 where id = id로 가져와서 loginOk에서 pw만 비교하기

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO(id, pw);
	dto = dao.selectMember(id);

	if (dto.getPw().equals(pw)) {
	    System.out.println("login success");

	    // 로그인이 성공하면 세션에 id, name 생성
	    session.setAttribute("id", id);

	    response.sendRedirect("main.jsp");
	} else {
	    System.out.println("login fail");
	    response.sendRedirect("login.jsp");
	}
	%>

</body>
</html>