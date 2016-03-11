<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/myweb/css/mainLayout.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header.jsp" %>

<section>
<article>
<h1>회원 검색</h1>
	<form name="f"  method="post">
	<select name="key">
		<option value="id">아이디</option>
		<option value="name">이름</option>
	</select>
	<input type="text" name="value">
	<input type="submit" value="검색"  onclick="show()">
	
	</form>

<%
if(request.getMethod().equals("GET"))
{
	%>입력해라!<% 
}
else{
%>
<jsp:include page="result.jsp"></jsp:include>

<%
}
%>


</article>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>