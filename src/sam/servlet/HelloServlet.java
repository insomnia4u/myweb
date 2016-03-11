package sam.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class HelloServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw=resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head><title>");
		pw.println("내가 만든 서블릿");
		pw.println("</title></head>");
		pw.println("<body>");
		pw.println("<h1>안녕 서블릿! 개불편해!!!</h1>");
		
		Calendar now=Calendar.getInstance();
		
		int year=now.get(Calendar.YEAR);
		int month=now.get(Calendar.MONTH)+1;
		int day=now.get(Calendar.DATE);
		
		pw.println("<h2>"+year+"년 "+month+"월 "+day+"일</h2>");
		pw.println("</body></html>");
		
		pw.close();
	}
}
