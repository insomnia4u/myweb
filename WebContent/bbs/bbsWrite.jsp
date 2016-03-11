<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bDAO" class="sam.bbs.BbsDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2{
	text-align: center;
	font-size: 35px;
	font-family: '나눔손글씨 펜';
	color: hotpink;
}
table {
	margin: 0px auto;
	width: 550px;
	border-top: 2px double gray;
	border-left:2px double gray;
	border-right:2px double gray;
	border-bottom: 2px double gray;
	border-spacing: 0px;
}
table thead tr th {
    text-align:center;
	font-family: '나눔손글씨 펜';
	font-size:20px;
	color: gray;
	font-weight: bold;
}
tr {
    text-align:center;
	font-family: '나눔손글씨 펜';
	font-size:20px;
	color: gray;
	font-weight: bold;
}
input[type=submit]{

	font-family: '나눔손글씨 펜';
	font-size:16px;
	font-weight: bold;
}
input[type=reset]{

	font-family: '나눔손글씨 펜';
	font-size:16px;
	font-weight: bold;
}

</style>
</head>
<body>
<%@include file="../header.jsp"%>
<session>
<article>	
	<h2>글쓰기</h2>
	<form name="bbsWrite" action="bbsWrite_ok.jsp">
	<table>
		<thead>
			<tr>
				<th>작성자:&nbsp;&nbsp;<input type="text" name="writer" size="8"></th>
				
				<th>비밀번호:&nbsp;&nbsp;<input type="password" name="pwd" size="8"></th>
				
			</tr>
			<tr>
				<th colspan="2">제목:&nbsp;&nbsp;<input type="text" name="subject" size="30"></th>
			
				
			</tr>
			<tr height="250px">
				<td colspan="2">
					<textarea rows="10" cols="45" name="content" placeholder="여기에 작성해 주세요~!"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시 작성">
			</tr>
	</table>

	</form>

</article>
</session>
<!-- 강사님 코드 -->
<!-- <section>
<article>
<h2>자유게시판 글쓰기</h2>
<form name="bbsWrite" action="bbsWrite_ok.jsp">
<ul>
<li><label>작성자</label>
<input type="text" name="writer">
</li>
<li><label>비밀번호</label>
<input type="password" name="pwd">
</li>
<li><label>제목</label>
<input type="text" name="subject">
</li>
<li>
<textarea rows="10" cols="45" name="content"></textarea>
</li>
</ul>
<p>
<input type="submit" value="글쓰기">
<input type="reset" value="다시작성">
</p>
</form>
</article>
</section> -->
<%@include file="../footer.jsp"%>
</body>
</html>