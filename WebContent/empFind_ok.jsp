<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h2
{
	text-align: center;
}
table
{
	width: 550px;
	border-top:2px solid dimgray;
	border-bottom: 2px solid dimgray;
	margin: 0px auto;
}
thead tr th
{
	background: lightgray;
}
</style>
<meta charset="UTF-8">
<title>사원 검색 결과</title>
</head>
<body>
<section>
<%@ include file="header.jsp" %>
<h2>사원 검색 결과</h2>
<table summary="사원 검색 결과">
	<thead>
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>부서</th>
		</tr>
	</thead>
	<tbody>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="scott";
		String pwd="1234";
		
		Connection con=DriverManager.getConnection(url, user, pwd);
		
		String sql="select * from employee where name=?";
		
		String name=request.getParameter("name");
		
		PreparedStatement ps=con.prepareStatement(sql);
		
		ps.setString(1, name);
		
		ResultSet rs=ps.executeQuery();
		
		if(rs.next())
		{
			do
			{
			%>
			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
			</tr>
			<%
			}
			while(rs.next());
		}
		else
		{
			%>
			<tr>
			<td colspan="4">등록된 사원이 없다!</td>
			</tr>
			<%
		}
		
		rs.close();
		ps.close();
		con.close();
		
	%>
	</tbody>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>