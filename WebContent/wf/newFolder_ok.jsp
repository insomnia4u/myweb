
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>    
<jsp:useBean id="wf" class="sam.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
	String name=request.getParameter("fName");
	String path=wf.USERS_HOME+"/"+wf.getCp();
	
	File f=new File(path+"/"+name);
	f.mkdir();
	
	
%>
<script>
window.alert('폴더 생성됐다!');
opener.location.href='webFolder.jsp?cp=<%=wf.getCp()%>';
window.self.close();
</script>
    