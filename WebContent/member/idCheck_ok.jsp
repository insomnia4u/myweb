<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mDAO" class="sam.member.MemberDAO"/>
<%
	boolean result=mDAO.idCheck(request.getParameter("id"));
	
	if(result)
	{
		%>
		<script>
		window.alert('사용 불가능한 ID입니다.');
		
		location.href="idCheck.jsp";
		</script>
		<%
		
	}
	else
	{
		
		%>
		<script>
		window.alert('사용 가능한 ID입니다.');
		
		var tmp='<%=request.getParameter("id")%>';
		
		opener.document.f.id.value=tmp;
		
		window.self.close();
		</script>
		<%
	}
	

%>
