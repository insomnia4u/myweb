<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이것은 HTML에서 작성한 문장이다!</h1>
	<!-- 이것은 HTML 주석이다 -->
	<%
		//이곳은 자바코드를 쓸 수 있대~
		/*여러줄 주석*/
		/**문서화 주석*/
		System.out.println("스크립트릿에서 작성한 문장!");
	
		//out : jsp에서 제공되는 기본 출력 스트림 객체
		out.println("<h2>이것은 스크립트릿에서 작성한 문장!</h2>");
		//1. 자바 2. 자바스크립트 3.css+html이 번역됨
		
		String str="java"; //지역 변수
		
		out.println("<h3>str : "+str+"</h3>");
	%>
	<!-- 400단 에러 : 클라이언트 측 에러
	500단 에러 : 서버 단위에서 발생하는 에러 -->
	<h3>str의 값 : <%=str %></h3>
	<!-- =out.println()의 내부 내용과 동일; -->
	<!--  선언부 : 메서드를 만듦, 어느 위치에 만들어도 상관없음-->
	<%! 
		String str="jsp"; //멤버 변수
		
		public int numSum(int a, int b)
		{
			return a+b;
		}
	%>
	
	<%
		out.println("<h3>str의 값 :"+this.str+"</h3>");
	
		out.println("<h3>3+5="+numSum(3, 5)+"</h3>");
	%>
	<h3>5+7=<%=numSum(5,7) %></h3>
	<%
		Calendar now=Calendar.getInstance();
	
		int year=now.get(Calendar.YEAR);
		int month=now.get(Calendar.MONTH)+1;
		int day=now.get(Calendar.DATE);
		
		out.println("<h2>"+year+"년 "+month+"월 "+day+"일</h2>");
	%>
	
	<table border="1" cellspacing="0">
	<%
		
		for(int i=1;i<=9;i++)
		{
			out.println("<tr>");
			for(int j=2;j<=9;j++)
			{
				out.println("<td>"+j+"*"+i+"="+(j*i)+"</td>");
			}
			
			out.println("</tr>");
		}
	%>
	
	</table>
	
	<hr>
	<%
		out.println("<table width='550' border='1' cellspacing='0'>");
		
		for(int i=1;i<=9;i++)
		{
			out.println("<tr>");
			for(int j=2;j<=9;j++)
			{
				out.println("<td>");
				out.println(j+"*"+i+"="+(j*i));
				out.println("</td>");
			}
			out.println("</tr>");
		}
	
		out.println("</table>");
	%>
	<hr>
	<table border="1" cellspacing="0" width="550">
		<%for(int i=1;i<=9;i++)
		{ 
		%>
		<tr>
			<%for(int j=2;j<=9;j++){ %>
			<td><%=j %>X<%=i %>=<%=j*i %></td>
			<%} %>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>