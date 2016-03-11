<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h3{
   text-align: center;
}
/*속성선택자[]*/
input[type=text]{
   height:50px;
   font-size: 30px;
}
select{
   height:50px;
}
</style>
<meta charset="UTF-8">
<title>사칙 계산기</title>
</head>
<body>
<%@ include file="header.jsp" %>

<h1>사칙 계산기</h1>
<form name="f" action="cal_ok.jsp">
<input type="text" name="num1" size="6">
<select name="oper">
	<option value="+">+</option>
	<option value="-">-</option>
	<option value="*">*</option>
	<option value="/">/</option>
</select> 
<input type="text" name="num2" size="6">
<input type="submit" value="결과 보기">

</form>
<%@ include file="footer.jsp" %>
</html>