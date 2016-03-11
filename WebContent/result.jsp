<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="sam.member.*" %>
<jsp:useBean id="mDAO" class="sam.member.MemberDAO"/>
<% 
String value=request.getParameter("value");
String key=request.getParameter("key");
 
%>
<table>
<thead>
	<tr>
		<th>회원번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>주소</th>
		<th>가입일</th>
	</tr>
	<% 
		

	ArrayList<MemberDTO> dtos=mDAO.memberFind(key, value);
	
	if(!dtos.isEmpty()){	
		for(MemberDTO tmp:dtos)
		{
			System.out.println(tmp.getId());
			%>
			<tr>
				<td><%=tmp.getIdx() %></td>
				<td><%=tmp.getId() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getEmail() %></td>
				<td><%=tmp.getAddr() %></td>
				<td><%=tmp.getJoindate() %></td>
			</tr>
			<%
		}
	}else
	{
		%><tr><td colspan="5">일치하는 놈이 없다!</td></tr><%
	}
	%>
</thead>
</table>

