<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str2="JSP!";
	String str=request.getParameter("str");
	String str3=request.getParameter("str3");
	

%>
<h2 style="color:deeppink;">sub.jsp에서 출력한 문장 A</h2>
<h2 style="color:deeppink;">sub.jsp의 str 값 : <%=str2 %></h2>
<h2 style="color:dimviolet;">Super로부터 받은 str : <%=str %></h2>
<h2 style="color:brown;">Super가 받은 str3값 : <%=str3 %></h2>
<h2 style="color:deeppink;">sub.jsp에서 출력한 문장 B</h2>
</body>
</html>