<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="eDTO" class="sam.emp.EmpDTO"/>
<jsp:setProperty property="*" name="eDTO" />
<jsp:useBean id="eDAO" class="sam.emp.EmpDAO" />
<%
	int result=eDAO.empAdd(eDTO);
	if(result>0)
	{
		%>
		<script>
			window.alert('사원 등록 성공!(beans)');
			location.href="emp2.jsp";
		</script>
		<%
	}	
	else
	{
		%>
		<script>
			window.alert('사원 등록 실패!(beans)');
			location.href="emp2.jsp";
		</script>
		<%
	}

	
%>