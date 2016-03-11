<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sam.bbs.*"%>
<jsp:useBean id="bDTO" class="sam.bbs.BbsDTO"/>
<jsp:setProperty property="*" name="bDTO"/>
<jsp:useBean id="bDAO" class="sam.bbs.BbsDAO" scope="session"/>

<% String idx_s=request.getParameter("idx"); 
   if(idx_s==null||idx_s.equals("")){
	   idx_s="0";
   }
	   
   int idx=Integer.parseInt(idx_s);
   
   BbsDTO dt=bDAO.bbsContent(idx);
   if(dt==null){
	   %>
	   <script>
	   window.alert('작성된 게시글이 삭제되거나 잘못된 접근방법입니다.');
	   location.href='bbsList.jsp';
	   </script>
	   <%
	   return;
   }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">


<style>
h2{
 text-align: center;
 font-family: '나눔손글씨 펜';
 font-size: 35px;
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
table tr {
    text-align:center;
	font-family: '나눔손글씨 펜';
	font-size:20px;
	font-weight: bold;
}

input[type=text]{
    text-align: center;
    font-family: '나눔손글씨 펜';
    font-size: 15px;
    font-weight: bold;
}
textarea {
	font-family: '나눔손글씨 펜';
	font-weight: bold;
}
a:link{
    font-weight: bold;
    color:gray;
    text-decoration: none;
}
a:VISITED{
    font-weight: bold;
    color:gray;
    text-decoration: none;
    
}
a:hover{
    font-weight: bold;
    color:deeppink;
    text-decoration: none;
}
</style>
</head>

<body>
<%@include file="../header.jsp" %>
<section>
<article>
<h2>자유게시판 본문보기</h2>
<table width="550" border="1" cellspacing="0">
<thead>
<tr>
<th>작성자</th>
<td><%=dt.getWriter() %></td>
<th>조회수:</th>
<td><%=dt.getReadnum() %></td>
</tr>
<tr>
<th>날짜</th>
<td><%=dt.getWritedate() %></td>
<th>번호:</th>
<td><%=dt.getIdx() %></td>
</tr>
<tr>
<th>제목</th>
<td colspan="3"><%=dt.getSubject() %></td>

</tr>
</thead>
<tbody>
<tr height="250">
<td colspan="4" align="left" valign="top">
<%=dt.getContent().replaceAll("\n", "<br>") %>
</td>
</tr>
</tbody>
<tfoot>
<th colspan="4"><a href="/myweb/bbs/bbsList.jsp">목록으로</a>
<a href="/myweb/bbs/bbsReWrite.jsp?subject=<%=dt.getSubject()%>&ref=<%=dt.getRef()%>&lev=<%=dt.getLev()%>&sunbun=<%=dt.getSunbun()%>">답변 쓰기</a></th>

</tfoot>
</table>
</article>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>