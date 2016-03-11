<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDTO" class="sam.bbs.BbsDTO" scope="page"/>
<jsp:setProperty property="*" name="bDTO"/>
<jsp:useBean id="bDAO" class="sam.bbs.BbsDAO" scope="session"/>

	<%
	 int result=bDAO.bbsReWrite(bDTO);
	 String msg=result>0?"글이 등록 되었습니다.":"글의 등록이 실패되었습니다.";
	%>
	
<script>
window.alert("<%=msg%>");
location.href="bbsList.jsp";
</script>
