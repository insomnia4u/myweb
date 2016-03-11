<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>scopeTest_ok.jsp</h2>
<jsp:useBean id="stest" class="sam.bean.ScopeTest" scope="application"/>
<h3>count의 값</h3>
<jsp:getProperty property="count" name="stest"/>
<a href="scopeTest.jsp">이전페이지로...</a>
</body>
</html>