<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int totalCnt=84; //총 게시물 수
int listSize=5; //보여줄 리스트 수
int pageSize=5; //보여줄 페이지 수

String cp_s=request.getParameter("cp");

if(cp_s==null||cp_s.equals(""))
{
	cp_s="1";	
}

int cp=Integer.parseInt(cp_s); // 사용자 위치



int pageCnt=(totalCnt/listSize)+1;

if(totalCnt%listSize==0)pageCnt--;

int userGroup=cp/pageSize;

if(cp%pageSize==0)userGroup--;

%>
<h1>페이지 테스트</h1>
<h2>총 게시물 수 <%=totalCnt %></h2>
<h2>총 페이지 수 <%=pageCnt %></h2>
<h2>현재 사용자 위치 <%=cp %> </h2>
<hr>
<%
if(userGroup!=0)
{
	%><a href="pageTest.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%	
}
for(int i=(userGroup*pageSize)+1;i<=(userGroup*pageSize)+pageSize;i++)
{
	%>&nbsp;&nbsp;&nbsp;<a href="pageTest.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;<%	
	if(i==pageCnt)
	{
		break;
	}
}
if(userGroup!=(pageCnt/pageSize)-(pageCnt%pageSize==0?1:0))
{
	%><a href="pageTest.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
}
%>
</body>
</html>