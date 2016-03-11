<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
	h1
	{
		text-align: center;
		font-size: 35px;
		color: dimgray;
		
	}
	
	fieldset
	{
		width: 550px;
		margin: 0px auto;
	}
	
	article li
	{
		list-style-type: none;
	}
	
	label
	{
		float: left;
		width: 100px;
	}
	
	meter
	{
		width: 450px;
	}
	
	table
	{
		margin: 0px auto;
		width: 550px;
		border-top: 5px solid dimgray;
		border-bottom: 5px solid dimgray;
		border-spacing: 0px;
	}
	
	table thead th
	{
		background: gray;
		color: white;
	}
</style>
</head>
<%
	String sid=(String)session.getAttribute("id");
	if(sid==null||sid.equals(""))
	{
		%>
		<script>
		window.alert('로그인해라!');
		location.href='/myweb/index.jsp';
		</script>
		<%
		return;
	}
	
%>
<jsp:useBean id="wf" class="sam.wf.WebFolderDAO" scope="session"></jsp:useBean>
<body>
<%@ include file="/header.jsp" %>
<%
	wf.setUser(sid);
	if(!wf.userFloderExists())
	{
		File f=new File(wf.USERS_HOME+"/"+wf.getUser());
		f.mkdir();
		wf.userFloderExists();
	}
	else
	{
			
	}

	String cp=request.getParameter("cp");
	if(cp==null||cp.equals(""))
	{
		cp=wf.getUser();
	}
	
	wf.setCp(cp);
	
	String dname=request.getParameter("dname");
	
%>
<section>
	<article>
		<h1><%=sid %>님 웹폴더</h1>
		<fieldset>
			<legend>기본 정보</legend>
			<ul>
				<li><label>총 용량</label><meter value="<%=wf.getTotalSize()%>" min="0" max="<%=wf.getTotalSize()%>"></meter></li>
				<li><label>사용 용량</label><meter value="<%=wf.getUsedSize()%>" min="0" max="<%=wf.getTotalSize()%>"></meter></li>
				<li><label>남은 용량</label><meter value="<%=wf.getFreeSize()%>" min="0" max="<%=wf.getTotalSize()%>"></meter></li>
			</ul>
			<p>
				<input type="button" value="Upload" onclick="uploadOpen()">
				<input type="button" value="New Foloder" onclick="folderOpen()">
			</p>
		</fieldset>
	</article>
	<article>
		<table>
			<thead>
				<tr>
					<th>분류</th>
					<th>이름</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				
			<%
			if(!wf.getUser().equals(wf.getCp()))
			{
				int pos=wf.getCp().lastIndexOf("/");
				String cp_up=wf.getCp().substring(0,pos);				
				
				%>
				<tr>
					<td colspan="3" align="left">
					<a href="webFolder.jsp?cp=<%=cp_up%>">상위로</a>
				</tr>
				<%
			}
			
			File f=new File(wf.USERS_HOME+"/"+wf.getCp());
			File files[]=f.listFiles();
			if(files==null||files.length==0)
			{
				%>
				<tr>
				<td colspan="3" align="center">
				등록된 파일 및 폴더가 없습니다.
				</tr>
				<%
			}
			else
			{
				for(int i=0;i<files.length;i++)
				{
					if(files[i].getName().equals(dname))
					{
						wf.delFolder(files[i]);
											
					}else{
					%>
					<tr>
					<td><%=files[i].isFile()?"[File]":"[Dir]"%></td>
					<td><%
					if(files[i].isFile())
					{
						%><a href="/myweb/wf/uploads/<%=wf.getCp()%>/<%=files[i].getName()%>"><%=files[i].getName()%></a><%
					}
					else
					{
						%><a href="webFolder.jsp?cp=<%=wf.getCp()%>/<%=files[i].getName()%>"><%=files[i].getName()%></a><%
					}
					 %></td>
					<td><a href="webFolder.jsp?dname=<%=files[i].getName()%>&cp=<%=wf.getCp()%>">삭제</a></td>
					</tr>
					<%
					}
				}
			}
			%>		
			</tbody>
		</table>
	</article>
</section>
<%@ include file="/footer.jsp" %>
<script>
function uploadOpen()
{
	window.open('upload.jsp','upload','width=400, height=280');	
}
function folderOpen()
{
	window.open('newFolder.jsp','newfolder','width=400, height=200');
}
</script>
</body>
</html>