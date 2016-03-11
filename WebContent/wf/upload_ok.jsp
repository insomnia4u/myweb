<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="wf" class="sam.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
	String savePath=wf.USERS_HOME+"/"+wf.getCp();
	System.out.println(savePath);
	try
	{
		MultipartRequest mr=new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8");

	}
	catch(Exception e)
	{
		%>
		<script>
		window.alert('용량이 부족합니다!');
		window.self.close();
		</script>
		<%
	}
	
	
%>
<script>
	window.alert('파일 업로드 성공!');
	opener.location.href='webFolder.jsp?cp=<%=wf.getCp()%>';
	window.self.close();
</script>

