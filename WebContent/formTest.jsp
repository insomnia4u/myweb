<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
	<%@include file="header.jsp" %>
	<section>
		<article>
		<h1>Form Test</h1>
		<form name="f" action="formTest_ok.jsp">
			<fieldset>
				<legend>기본 정보</legend>
				이름 <input type="text" name="name"><hr>
				비밀번호 <input type="password" name="pwd"><hr>
				성별 <input type="radio" name="sex" value="남자">남자 
					<input type="radio" name="sex" value="여자">여자
					<input type="radio" name="sex" value="트랜스">트랜스
					<hr>
				취미 <input type="checkbox" name="cb" value="공부">공부
					<input type="checkbox" name="cb" value="독서">독서
					<input type="checkbox" name="cb" value="컴퓨터">컴퓨터
					<input type="checkbox" name="cb" value="운동">운동
					<input type="checkbox" name="cb" value="게임">게임
					<hr>
					<input type="submit" value="전달하기">
					<input type="reset" value="다시 작성">
					
			</fieldset>
		</form>
		</article>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>