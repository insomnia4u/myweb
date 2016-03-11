package sam.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hap extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doIt(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doIt(req, resp);
	}
	
	protected void doIt(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw=resp.getWriter();
		
		
		pw.println("<html>");
		pw.println("<head><title>합격 판정</title></head>");
		pw.println("<body>");
		
		pw.println("<h1>합격했는지 알려주마~</h1>");
		
		pw.println("국어 <input type='text' size='10' id='kor'><br>");
		pw.println("영어 <input type='text' size='10' id='eng'><br>");
		pw.println("수학 <input type='text' size='10' id='mat'><br>");
		
		pw.println("<input type='button' value='알려줘~' onclick='showH()'>");
		pw.println("<input type='reset' value='다시쓸래 ㅠ' onclick='clearH()'>");
		
		pw.println("<script>");
		
		
		pw.println("function clearH(){");
		pw.println("kor.value=''; eng.value=''; mat.value='';");
		pw.println("}");
		
		pw.println("function showH(){");
		
		

		pw.println("k=parseInt(kor.value);");
		pw.println("e=parseInt(eng.value);");
		pw.println("m=parseInt(mat.value);");
		
		
		pw.println("var sum=k+e+m;");
		pw.println("var avg=sum/3;");
		
		
		pw.println("if(avg<60||k<40||e<40||m<40)");
		pw.println("{"
				+ "window.alert('평균 :'+avg.toFixed(2)+'\\n 불합격! 꺼졍!');"
				+ "}");
		pw.println("else{window.alert('평균 :'+avg.toFixed(2)+'\\n 올? 합격이다!');}");
		
		pw.println("}");
		pw.println("</script>");
		
		pw.println("</body>");
		pw.println("</html>");
	}
}
