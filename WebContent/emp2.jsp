<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h1
{
	text-align: center;
}
fieldset
{
	width: 350px;
	margin: 0px auto;
}
li
{
	list-style-type: none;
}

label
{
	width: 80px;
	float: left;
}
p
{
	text-align: center;
}
</style>
<title></title>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
	<article>
	<h1>사원 관리 프로그램(beans)</h1>
	<form name="empAdd2" action="empAdd2_ok.jsp">
		<fieldset>
			<legend>사원 등록</legend>
			<ul>
				<li><label>이름</label> <input type="text" name="name"></li>
				<li><label>이메일</label> <input type="text" name="email"></li>
				<li><label>부서</label> <input type="text" name="dept"></li>
			</ul>
			<p>
				<input type="submit" value="등록">
				<input type="reset" value="다시 작성">
			</p>
		</fieldset>
	</form>
	</article>
	<article>
	<form name="empDel2" action="empDel2_ok.jsp">
		<fieldset>
			<legend>사원 삭제</legend>
			이름 <input type="text" name="name">
			<input type="submit" value="삭제">
		</fieldset>
	</form>
	</article>
	<article>
	<h2><a href="empList2.jsp">모두 보기</a></h2>
	</article>
	<article>
	<form name="empFind2" action="empFind2_ok.jsp">
		<fieldset>
		<legend>사원 검색</legend>
		이름 <input type="text" name="name">
		<input type="submit" value="검색">
		</fieldset>
	</form>
	</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>