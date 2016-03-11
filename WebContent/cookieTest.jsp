<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Test</title>
</head>
<body>
<h1>cookieTest.jsp</h1>
<%
	//쿠키들 다 가져오기
	Cookie cks[]=request.getCookies();
	

	//쿠키는 1바이트 체계가 기본임
	//웹 파라미터는 유니코드를 기본으로 전달함
	if(cks!=null)
	{	
		for(int i=0;i<cks.length;i++)
		{
			String key=cks[i].getName();
			String value=URLDecoder.decode(cks[i].getValue());
			out.println("<h2>KEY : "+key+" VALUE :"+value+" </h2>");
		}
	}
%>


<!-- 저장한 쿠키는 하단에 -->
<%
	String name="홍길동";
	name=URLEncoder.encode(name);

	Cookie ck1=new Cookie("name", name);
	//쿠키는 실제 txt로 저장되므로 string값만 생성자의 인자로 받음

	ck1.setMaxAge(60*3);
	//나이 지정
	
	//클라이언트에 전가
	response.addCookie(ck1);
	
	Cookie ck2=new Cookie("age", "20");
	
	ck2.setMaxAge(60*3);
	
	response.addCookie(ck2);

	
%>

<h1>쿠키 설정 완료!</h1>
</body>
</html>