<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="eDTO" class="sam.emp.EmpDTO"/>
<jsp:setProperty property="name" name="eDTO" />
<jsp:useBean id="eDAO" class="sam.emp.EmpDAO"/>

<% 
	int result=eDAO.empDel(eDTO);
		
		%>
		<script>
			window.alert('<%=result>0?"삭제 성공(Beans)":"삭제 실패(Beans)"%>');
			location.href="emp2.jsp";
		</script>
		<%


%>