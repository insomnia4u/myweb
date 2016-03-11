<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<head>
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
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
 	String empno=request.getParameter("empno");
	
	if(empno==null||empno.equals(""))
	{
		empno="0";
	}
	
	int empno_i=Integer.parseInt(empno);

	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pwd="1234";
	
	Connection con=DriverManager.getConnection(url, user, pwd);
	
	String sql="select * from employee where idx=?";
	
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setInt(1, empno_i);
	
	ResultSet rs=ps.executeQuery();
	String name="";
	String email="";
	String dept="";
	
	if(rs.next())
	{
			name=rs.getString(2);
			email=rs.getString(3);
			dept=rs.getString(4);
		
	}
	else
	{
		%>
		<script>
		window.alert('일치하는 사원번호가 없다!');
		location.href="emp.jsp";
		</script>
		<%
		return;
	}
	rs.close();
	ps.close();
	con.close();
%>

<section>
	<article>
		<form name="f" action="empUpdate_ok.jsp">
		<fieldset>
			<legend>수정하기</legend>
			<ul>
			<li>
			<label for="empNo">사번</label>
			<input type="text" name="no" readonly value="<%=empno%>">
			</li>
			<li>
			<label for="empName">이름</label>
			<input type="text" name="name" id="empName" value="<%=name%>">
			</li>
			<li>
			<label for="empEmail">이메일</label>
			<input type="text" name="email" id="empEmail" value="<%=email%>">
			</li>
			<li>
			<label for="empDept">부서</label>
			<input type="text" name="dept" id="empDept" value="<%=dept%>">
			</li>
			</ul>
			<p><input type="submit" value="수정">
				<input type="button" value="취소">
			</p>
		</fieldset>
		</form>
	</article>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>