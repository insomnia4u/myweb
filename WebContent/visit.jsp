<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<%
	Cookie [] cks=request.getCookies();


String value="첫방문이네 잘 왔어~";

if(cks!=null)
{	
	
	
	for(int i=0;i<cks.length;i++)
	{
		if(cks[i].getName().equals("visit")){
		
		value=URLDecoder.decode(cks[i].getValue());
		}
	}
}	
	out.print(value);
%>

<%
	Calendar now=Calendar.getInstance();

	int y=now.get(now.YEAR);
	int m=now.get(now.MONTH)+1;
	int d=now.get(now.DATE);
	int h=now.get(now.HOUR);
	int min=now.get(now.MINUTE);
	
	String key="visit";
	value="최종방문일 : "+y+"년"+m+"월"+d+"일"+h+"시"+min+"분";
	
	key=URLEncoder.encode(key);
	value=URLEncoder.encode(value);
	
	Cookie ck=new Cookie(key,value);
	
	
	response.addCookie(ck);
%>