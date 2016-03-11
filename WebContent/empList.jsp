<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 사원 보기</title>
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
	<h2>모든 사원 목록</h2>
	<table summary="모든 사원 목록">
		<thead>
		
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
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
			
			Connection conn=DriverManager.getConnection(url, user, pwd);
			
			String sql="select * from employee order by idx desc";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				do
				{
					%>
					<tr>
						<td><%=rs.getInt("idx") %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getString("email") %></td>
						<td><%=rs.getString("dept") %></td>
					</tr>	
					<%
				}
				while(rs.next());

			}
			else
			{
				%><tr>
					<td colspan="4" align="center">
					등록된 사원이 없습니다.
					</td>
				</tr><%
			}
			
			rs.close();
			ps.close();
			conn.close();
		%>
		</tbody>
	</table>	
	</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>