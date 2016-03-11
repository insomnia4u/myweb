package sam.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Gugudan extends HttpServlet
{
   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
	   doIt(req, resp);
   }
   
   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
	   doIt(req, resp);
   }
   
   protected void doIt(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
   {
	  resp.setContentType("text/html; charset=utf-8");
	  
	  PrintWriter pw=resp.getWriter();
	  
	  pw.println("<html>");
	  pw.println("<head><title>구구구국구국단</title></head>");
	  pw.println("<body>");
	  pw.println("<h1>구구구구구구구국국구국구단 구구구구구 비둘기 마이쪙</h1>");
	  pw.println("<table border='1' cellspacing='0' cellpadding='10' bgcolor='darkviolet'>");
	  
	  for(int i=1;i<=9;i++)
	  {
		  pw.println("<tr>");
		  for(int j=2;j<=9;j++)
		  {
			  pw.println("<td>"+j+"*"+i+"="+(i*j)+"</td>");
		  }
		  pw.println("</tr>");
	  }
	  
	  pw.println("</table>");
	  pw.println("</body>");
	  pw.println("</html>");
	  
	  pw.close();
   }
}
