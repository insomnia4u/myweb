<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
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
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<article>
<h1>Join Us</h1>
	<form name="f" action="join_ok.jsp" method="post">
	<fieldset>
	<ul>
		<li><label for="userId">아이디</label> <input type="text" readonly name="id" onclick="idCheck()" id="userId"></li>
		<li><label for="userName">이름</label> <input type="text" name="name" id="userName"></li>
		<li><label for="userPw">비밀번호</label> <input type="password" name="pw" id="userPw"></li>
		<li><label for="userEmail">이메일</label> <input type="text" name="email" id="userEmail"></li>
		<li><label for="userAddr">주소</label> <input type="text" name="addr" id="userAddr"></li>
	</ul>
	<p><input type="submit" value="회원 가입"></p>
	</fieldset>
	</form>

</article>
</section>
<%@ include file="../footer.jsp" %>
<script>
	function idCheck()
	{
		window.open('idCheck.jsp', 'idCheck', 'width=400, height=300');
	}
</script>
</body>
</html>