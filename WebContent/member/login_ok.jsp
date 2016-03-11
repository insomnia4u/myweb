<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDTO" class="sam.member.MemberDTO" scope="session"/>
<jsp:setProperty property="*" name="mDTO"/>
<jsp:useBean id="mDAO" class="sam.member.MemberDAO"/>
<%@ page import="java.net.*" %>
<% int res=mDAO.loginCheck(mDTO.getId(), mDTO.getPw());




	switch(res)
	{
	case 1:
		%>
		<script>
			window.alert('일치하는 ID가 없다!');
			location.href="login.jsp";
		</script>
		<%
		break;
	case 2:
		%>
		<script>
			window.alert('PW가 다르다!');
			location.href="/myweb/member/login.jsp";
		</script>
		<%
		break;
	case 3:
		session.setAttribute("id", mDAO.getUserInfo(mDTO.getId()));
		String chk=request.getParameter("chk");
		if(chk!=null&&chk.equals("on")){
			Cookie ck=new Cookie("id",mDTO.getId());
			
			ck.setMaxAge(60*60*24*60);
			response.addCookie(ck);
		}
		%>
		<script>
		window.alert('<%=mDAO.getUserInfo(mDTO.getId()) %>님 안뇽');
		window.self.close();
		opener.location.reload();
		</script>
		<%
		break;
	}
	
	
%>
	