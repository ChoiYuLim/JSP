<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.jsplec.MemberDAO"%>
<%@ page import="com.jsplec.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	// ȸ�� ������ �� ��, dao�� ������
	// 1. select * from member2 where id = id, pw = pw���� �� �����ͼ�, id �� pw�� ���ϱ� -> ���뼺�� ����
	// 2. select * from member2 where id = id�� �����ͼ� loginOk���� pw�� ���ϱ�

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO(id, pw);
	dto = dao.selectMember(id);

	if (dto.getPw().equals(pw)) {
	    System.out.println("login success");

	    // �α����� �����ϸ� ���� ����
	    HttpSession ss = request.getSession(true);
	    ss.setAttribute("id", id);
	    ss.setAttribute("pw", pw);

	    response.sendRedirect("main.jsp");
	} else {
	    System.out.println("login fail");
	    response.sendRedirect("login.jsp");
	}
	%>

</body>
</html>