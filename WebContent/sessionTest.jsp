<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>sessionTest.jsp</h2>
<%
	String id=(String)session.getAttribute("id");
	String name=(String)session.getAttribute("name");
%>
<h3>id <%=id %></h3>
<h3>이름 <%=name %></h3>
<hr>
<%
	session.setAttribute("id", "hong");
	session.setAttribute("name", "홍길동");
	
%>
<h3>session save complete!</h3>
</body>
</html>