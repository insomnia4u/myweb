<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDTO" class="sam.member.MemberDTO"/>
<jsp:setProperty property="*" name="mDTO"/>
<jsp:useBean id="mDAO" class="sam.member.MemberDAO"/>
<% 
	int result=mDAO.memberJoin(mDTO);
	System.out.print(result);
	String msg=result>0?"회원 가입 성공!":"회원 가입 실패";
	String loc=result>0?"../index.jsp":"join.jsp";
	
%>
<script>
	window.alert('<%=msg%>');
	location.href='<%=loc%>';
</script>
<%
	
%>