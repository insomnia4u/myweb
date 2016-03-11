<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramTest3.jsp</title>
</head>
<body>
<h1>paramTest3.jsp</h1>
<%
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	String tel=request.getParameter("tel");
	String addr=request.getParameter("addr");

	//request는 다음 페이지까지만 살 수 있음
	
%>

<h2>이름 <%=name %></h2>
<h2>나이 <%=age %></h2>
<h2>전화번호 <%=tel %></h2>
<h2>주소 <%=addr %></h2>
</body>
</html>