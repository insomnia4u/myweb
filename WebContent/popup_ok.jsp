<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>


<% 
	String check=request.getParameter("check");
	
	
		if(check!=null&&check.equals("on"))
		{
			Cookie ck2=new Cookie("ing","on");
			
			ck2.setMaxAge(60);
			
			response.addCookie(ck2);
		}
	%>
	
<script>window.self.close();</script>