package sam.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class ServletLifeCycle extends HttpServlet
{
	public ServletLifeCycle() {
		System.out.println("1. 생성자 호출됨!");
		//생성자의 목적은 멤버변수 초기화가 목적
	}
	
	//기능의 초기화를 목적으로 둔 메서드 init();
	//생성자 이후 자동 호출되는 메서드
	@Override
	public void init() throws ServletException {
		System.out.println("2. init() 메서드 호출됨!");
	}
	
	//전송 방식에 따라 dopost인지 doget일지 정하는 메서드
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		System.out.println("3. service() 메서드 호출됨!");
	}
	
	@Override
	public void destroy() {
		System.out.println("4. destroy() 메서드 호출됨!");
	}
}
