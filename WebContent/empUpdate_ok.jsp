<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<% 
	int empno=Integer.parseInt(request.getParameter("no"));
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String dept=request.getParameter("dept");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pwd="1234";
	
	Connection con=DriverManager.getConnection(url, user, pwd);
	
	String sql="update employee set name=?, email=?, dept=? where idx=?";
	
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, dept);
	ps.setInt(4, empno);
	
	int count=ps.executeUpdate();
	
	if(count>0)
	{
		%>
		<script>
			window.alert('수정 성공');
			location.href="emp.jsp";
		</script>
		<%
	}
	else
	{
		%>
		<script>
			window.alert('수정 실패');
			location.href="empUpdate.jsp";
		</script>
		<%	
	}
	
	ps.close();
	con.close();
%>