<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sam.emp.*" %>
<jsp:useBean id="eDAO" class="sam.emp.EmpDAO"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 모두 보기</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h2
{
	text-align: center;
}

table
{
	width: 550px;
	border-top: 2px solid dimgray;
	border-bottom: 2px solid dimgray;
	margin: 0px auto;
	broder-spacing: 0px;
}
thead tr th
{
	background: lightgray;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
<article>
<h2>모든 사원 내역</h2>
<table summary="모든 사원 내역">
	<thead>
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>이메일</th>
		<th>부서</th>
	</tr>
	</thead>
	<tbody>
	<%
		EmpDTO dtos[]=eDAO.empAllList();
		if(dtos==null||dtos.length==0)
		{
			%>
			<tr>
				<td colspan="4" align="center"> 등록된 사원이 없습니다.
			</tr>
			<%
		}
		else
		{
			for(int i=0;i<dtos.length;i++)
			{
				%>
				<tr>
					<td><%=dtos[i].getIdx() %></td>
					<td><%=dtos[i].getName() %></td>
					<td><%=dtos[i].getEmail() %></td>
					<td><%=dtos[i].getDept() %></td>
				</tr>
				
				<%
			}
		}
	%>
	</tbody>	
</table>
</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>