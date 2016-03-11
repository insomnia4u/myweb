<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<%
	Cookie [] cks=request.getCookies();
String id="";
	if(cks!=null)
	{
		for(int i=0;i<cks.length;i++)
		{
			if(cks[i].getName().equals("id"))
			{
				id=cks[i].getValue();
			}
		}
		
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="f" action="/myweb/member/login_ok.jsp">
<h1>로그인</h1>
ID <input type="text" name="id" value="<%=id%>">
<br>
PW <input type="password" name="pw">
<hr>
<input type="checkbox" name="chk" value="on">Remember ID <input type="submit" value="로그인">
</form>
</body>
</html>
