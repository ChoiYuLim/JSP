<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.jsplec.MemberDAO"%>
<%@ page import="com.jsplec.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<%
	// 세션에 저장된 id 값 가져오기
	String id = session.getAttribute("id").toString();

	MemberDAO dao = new MemberDAO();
	// id로 현재 로그인 된 멤버의 정보(dto 객체로) 가져오기
	MemberDTO dto = dao.selectMember(id);

	String pw = dto.getPw();
	String name = dto.getName();
	String phone1 = dto.getPhone1();
	String phone2 = dto.getPhone2();
	String phone3 = dto.getPhone3();
	String gender = dto.getGender();
	%>

	<form action="ModifyOk" method="post">
		비밀번호 : <input type="password" name="pw" value=<%=pw%>> <br />
		이름: <input type="text" name="name" value=<%=name%>> <br />
		전화번호 1 : <input type="text" name="phone1" value=<%=phone1%>> <br />
		전화번호 2 : <input type="text" name="phone2" value=<%=phone2%>> <br />
		전화번호 3 : <input type=text name="phone3" value=<%=phone3%>> <br />
		성별: <select name="gender">
			<option value="여자" <%=gender.equals("여자") ? "selected" : ""%>>여자</option>
			<option value="남자" <%=gender.equals("남자") ? "selected" : ""%>>남자</option>
		</select><br /> <input type="submit" value="전송">

	</form>

</body>
</html>