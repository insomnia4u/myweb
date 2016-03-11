<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<article>
<h1>넘어온 파라미터들</h1>
<%
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String sex=request.getParameter("sex");
	String cbs[]=request.getParameterValues("cb");
%>

<h3>넘어온 이름값 <%=name %></h3>
<h3>넘어온 비밀번호값 <%=pwd %></h3>
<h3>넘어온 성별 <%=sex %></h3>
<h3>넘어온 취미
<%
	if(cbs==null||cbs.length==0)
	{
		out.println("선택한 취미가 없다.");
	}
	else
	{
		for(int i=0;i<cbs.length;i++)
		{
			out.println(cbs[i]);
		}
	}
%>

</h3>
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>