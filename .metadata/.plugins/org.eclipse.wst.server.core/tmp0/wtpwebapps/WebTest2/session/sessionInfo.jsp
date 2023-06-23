<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- 세션 속성 출력 --%>
	<%
	Object obj1 = session.getAttribute("memberId");
	String id = (String) obj1;
	out.println("memberId: " + id + "<br/>");


	Object obj2 = session.getAttribute("memberPwd");
	String pwd = (String) obj2;
	out.println("memberPwd: " + pwd + "<br/>");

	Object obj3 = session.getAttribute("memberName");
	String name = (String) obj3;
	out.println("memberName: " + name + "<br/>");


	out.println("========================================<br/>");

	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

	long createionTime = session.getCreationTime();
	String creationTimeStr = dateFormat.format(new Date(createionTime));

	long lastTime = session.getLastAccessedTime();
	String lastTimeStr = dateFormat.format(new Date(lastTime));

	out.println("세션 유지 시간: " + session.getMaxInactiveInterval() + "<br/>");
	out.println("세션 아이디: " + session.getId() + "<br/>");
	out.println("세션 시작 시간: " + creationTimeStr + "<br/>");
	out.println("세션 종료 시간: " + lastTimeStr + "<br/>");


	//Enumeration<String> attributeNames = session.getAttributeNames();
	%>
	<a href="deleteSession.jsp">세션 삭제하기</a>
	<%-- <h3>Session Attributes:</h3>
	<ul>
		<%
		while (attributeNames.hasMoreElements()) {
		    String attributeName = attributeNames.nextElement();
		%>
		<li><%=attributeName%>: <%=session.getAttribute(attributeName)%></li>
		<%
		}
		%>
	</ul> --%>
</body>
</html>