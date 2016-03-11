<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<header>


<%
if(session.getAttribute("id")==null){
%>

<p><a onclick="loginOpen()">LOGIN</a> <a href="/myweb/member/join.jsp">JOIN</a></p>
<%}
else
{
	%><p><%=(String)session.getAttribute("id")%>님 로그인중 <a onclick="userlogout()">로그아웃</a></p><%	
}
%>
	
	<h1>PROJECT SARTE</h1>
	<h2>JSP Study</h2>
	<nav>
	<ul>
		<li><a href="/myweb/index.jsp">Home</a></li>
		<li><a href="/myweb/profile.jsp">Profile</a></li>
		<li><a href="/myweb/bbs/bbsList.jsp">BBS</a></li>
		<li><a href="/myweb/wf/webFolder.jsp">WebFolder</a></li>
		<li><a href="#">GuestBook</a></li>
	</ul>
	</nav>
	<hr>
	<script>
		function loginOpen()
		{
			window.open("/myweb/member/login.jsp", "login", "width=400px, height=300px");
		}
	</script>
	<script>
function userlogout()
{
	window.open("/myweb/member/logout_ok.jsp","logout","width=0px, height=0px");
	

}
</script>
</header>
