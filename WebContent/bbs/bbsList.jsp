<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sam.bbs.*" %>
<%@ page import="java.util.*" %>	
<jsp:useBean id="bDAO" class="sam.bbs.BbsDAO" scope="session" />
<%
	String sid = (String)session.getAttribute("id");
	if (sid == null) {
		%>
		<script>
		window.alert("로그인 후 이용 가능합니다.")
		location.href="/myweb";
		</script>
		<%
		return;
	} else {
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2 {
	text-align: center;
	font-size: 35px;
	font-family: '나눔손글씨 펜';
	color: hotpink;
}

table {
	margin: 0px auto;
	width: 550px;
	border-top: 2px double gray;
	border-bottom: 2px double gray;
	border-spacing: 0px;
}

td
{
	text-align: left;
}
table thead th {
	background: pink;
	font-family: '나눔손글씨 펜';
	color: gray;
	font-weight: bold;
}

table tfoot td{
	font-family: '나눔손글씨 펜';
	color: gray;
	font-weight: bold;
}
table tfoot td a{
	font-family: '나눔손글씨 펜';
	color: gray;
	font-weight: bold;
}
table tbody td{
    font-size:20px;
    text-align:center;
	font-family: '나눔손글씨 펜';
	color: gray;
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
<%

//페이징만들기
int totalCnt=bDAO.getTotalCnt();//총게시물수
int listSize=5;//보여줄리스트수
int pageSize=5;//보여줄페이지수

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";//첫 페이지화면
}

int cp=Integer.parseInt(cp_s);//사용자 위치

int pageCnt=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)pageCnt--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>

	<%@include file="/header.jsp"%>
	<section>
		<article>
				<h2>게시판 목록</h2>
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>제 목</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
					</thead>
<tfoot>
						<tr>
							<td colspan="3" align="center">
							<!-- ----------------------------------------------- -->
							<%
if(userGroup!=0){
	%><a href="bbsList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
}
for(int i=(userGroup*pageSize)+1;i<=(userGroup*pageSize)+pageSize;i++){
	%>&nbsp;&nbsp;<a href="bbsList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
	if(i==pageCnt){
		break;
	}
}
if(userGroup!=(pageCnt/pageSize)-(pageCnt%pageSize==0?1:0)){
	%><a href="bbsList.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
}
%>
							
							
							
							<!-- ----------------------------------------------- -->
							</td>
							<td align="center"><a href="bbsWrite.jsp">글쓰기</a></td>
						</tr>

					</tfoot>
				
					<tbody>
                    <%
                    ArrayList<BbsDTO> arr=bDAO.bbsList(cp,listSize);
                    if(arr==null||arr.size()==0){
                    	%>
                    	<tr>
                    	<td colspan="4" align="center">등록된 글이 없습니다.</td>
                    	</tr>
                    	<% 
                    }else{
                    	for(int i=0;i<arr.size();i++){
                    	%>
                    	<tr>
                    	<td width="20"><%=arr.get(i).getIdx() %></td>
                    	<td width="300">
                    	<%for(int z=0;z<arr.get(i).getLev();z++){
                    		out.println("&nbsp;&nbsp;");                    		
                    	} %>
                    	<a href="bbsContent.jsp?idx=<%=arr.get(i).getIdx() %>"><%=arr.get(i).getSubject() %></a></td>
                    	<td width="40"><%=arr.get(i).getWriter() %></td>
                    	<td width="20"><%=arr.get(i).getReadnum() %></td>
                    	</tr>
                    	<%
                    }
                    }
                    %>
	
					</tbody>
					<%
	}
	%>
				</table>
		</article>
	</section>
<!--강사님 코드  -->
<%-- <section>
<article>
    <h2>자유 게시판(강사님)</h2>
    <table summary="자유게시판목록">
    <thead>
    <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>조회수</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
    <td colspan="3" align="center">
        페이징이 들어갈 영역
    </td>
    <td>
       <a href="bbsWrite.jsp">글쓰기</a>
    </td>
    </tr>
    </tfoot>
    <tbody>
    <%
    ArrayList<BbsDTO> arr=bDAO.bbsList();
    if(arr==null||arr.size()==0){
    	%>
    	<tr>
    	<td colspan="4" align="center">
    	등록된 게시글이 없습니다.
    	</td>
    	</tr>
    	<%
    }else{
    	for(int i=0;i<arr.size();i++){
    		%>
    		<tr>
    		<td><%=arr.get(i).getIdx() %></td>
    		<td><a href="bbsContent.jsp?idx=<%=arr.get(i).getIdx() %>"><%=arr.get(i).getSubject() %></td>
    		<td><%=arr.get(i).getWriter() %></td>
    		<td><%=arr.get(i).getReadnum() %></td>
    		</tr>
    		
    		<%
    	}
    }
    
    %>
    </tbody>
    </table>
</article>
</section> --%>

	<%@include file="/footer.jsp"%>
</body>
</html>