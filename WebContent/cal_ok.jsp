<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">

<meta charset="UTF-8">
<title>사칙 결과</title>
</head>
<body>
<%@ include file="header.jsp" %>

<%
	String num1_s=request.getParameter("num1");
	int num1=Integer.parseInt(num1_s);	

	String num2_s=request.getParameter("num2");
	int num2=Integer.parseInt(num2_s);
	
	String oper=request.getParameter("oper");
	int result=0;
	char oper_c=oper.charAt(0);
	
	switch(oper_c)
	{
	case '+':result=num1+num2;break;
	case '-':result=num1-num2;break;
	case '*':result=num1*num2;break;
	case '/':result=num1/num2;break;
	}
%>
<h1><%=num1%><%=oper_c%><%=num2%>=<%=result %></h1>
<%@ include file="footer.jsp" %>
</body>
</html>