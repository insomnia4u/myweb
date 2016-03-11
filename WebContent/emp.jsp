<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@ include file="header.jsp" %>

<section>
	<article>
		<h1>사원 관리 프로그램</h1>
		<form name="empAdd" action="empAdd_ok.jsp">
			<fieldset>
				<legend>사원 등록</legend>
				<ul>
					<!-- 필수정보에 한해서 자동으로 기술 -->
					<li><label for="addName">사원 이름</label>
						<input type="text" name="name" id="addName">
					</li>
					<li><label for="addEmail">이메일</label>
						<input type="text" name="email" id="addEmail">
					</li>	
					<li>
						<label for="addDept">부서</label>
						<input type="text" name="dept" id="addDept">
					</li>
				</ul>
				<p>
					<input type="submit" value="사원 등록">
					<input type="reset" value="다시 작성">
				</p>
			</fieldset>
			</form>
			</article>
			<article>
			<form name="empDel" action="empDel_ok.jsp">
			<fieldset>
				<legend>사원 삭제</legend>
				<label for="delName">사원 이름</label>
				<input type="text" name="name" id="delName">
				<input type="submit" value="사원 퇴사">
			</fieldset>
			</form>
			</article>
			<article>
				<h3><a href="empList.jsp">모든 사원 내역 보기</a></h3>
			</article>
			<article>
			<form name="empFind" action="empFind_ok.jsp">
			<fieldset>
				<legend>사원 검색</legend>
				<label for="findName">사원 이름</label>
				<input type="text" name="name" id="findName">
				<input type="submit" value="사원 찾기">
			</fieldset>
			</form>			
			</article>
			<article>
			<form name="empModi" action="empUpdate.jsp"> 
			<fieldset>
				<legend>사원 수정 조회</legend>
				<label for="modiName">사번</label>
				<input type="text" name="empno" id="modiName">
				<input type="submit" value="조회하기">
			</fieldset>
			</form>
			</article>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>