<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h1>beanTest_ok.jsp</h1>
<jsp:useBean id="btest" class="sam.bean.BeanTest"/>

<!-- 폼 태그 이름과 빈(bean) 객체 안의 멤버변수가 완전히 똑같아야 함 -->
<jsp:setProperty property="*" name="btest"/>


<h3>이름 : 
<jsp:getProperty property="name" name="btest"/></h3>
<h3>나이 :
<jsp:getProperty property="age" name="btest"/></h3>
<h3>주소 :
<jsp:getProperty property="addr" name="btest"/></h3>
</body>
</html>