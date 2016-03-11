<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mainLayout.css" type="text/css">
<script>
function popupOpen()
{
	window.open('popup2.jsp','popup2','width=350px, height=300px');	
	
}
function popupOpen2(){	
	window.open('popup.jsp','popup2','width=350px, height=300px');	
}
</script>
</head>
<% String lastDate="<h3 style='color:deeppink;'>첫 방문이구나! 반갑다!</h3>";
			Cookie cks3[]=request.getCookies();
			String popupck=null;
			String popupck2=null;
			if(cks3!=null)
			{
				for(int i=0;i<cks3.length;i++)
				{
					if(cks3[i].getName().equals("lastDate"))
					{
						lastDate=URLDecoder.decode(cks3[i].getValue());
					}
					if(cks3[i].getName().equals("popupck"))
					{
						popupck=cks3[i].getValue();
								
					}
					if(cks3[i].getName().equals("on"))
					{
						popupck2=cks3[i].getValue();
					}
				}
			}
		 %>

<body <%=popupck==null?"onload=popupOpen();":""%>>

<%@ include file="header.jsp" %>

<section>
	<article id="mainImg">
		<img alt="coffee" src="img/cfmain.jpg">
	</article>
	<article id="mainMenu">
		<h2>안녕하세요. 반갑습니다.</h2>
		
		 <%=lastDate %>
		
		<!--  -->
		<%
			Calendar now=Calendar.getInstance();
		
			int year=now.get(Calendar.YEAR);
			int month=now.get(Calendar.MONTH)+1;
			int day=now.get(Calendar.DATE);
			
			String saveDate="<h3 style='color:dimgray;'>마지막 접속일 : "+year+"년 "+month+"월 "+day+"일</h3>";
			
			saveDate=URLEncoder.encode(saveDate);
			
			Cookie ck3=new Cookie("lastDate", saveDate);
			
			//자료형이 int라 쿠키 나이는 21억초가 한계
			ck3.setMaxAge(60*60*24*31);
			
			response.addCookie(ck3);
		%>
		<!--  -->
		<ul>
			
			<li>앞으로 간단한 수업은 아래로...</li>
			<li><a href="formTest.jsp">Form 테스트</a></li>
			<li><a href="cal.jsp">사칙 계산기</a></li>
			<li><a href="emp.jsp">사원 관리 프로그램(Model1)</a></li>
			<li><a href="emp2.jsp">사원 관리 프로그램(Beans)</a></li>
			<li><a href="/myweb/memberfind.jsp">회원 검색</a></li>
		</ul>
	</article>
</section>

<%@ include file="footer.jsp" %>
	
</body>
</html>