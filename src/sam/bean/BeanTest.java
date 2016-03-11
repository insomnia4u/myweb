package sam.bean;
//1. db 스키마 설계
//2. 디자인 설계(html 뼈대) ->jsp
//3. DTO & DAO 설계 ->java
//4. _ok.jsp <- 컨트롤러(2,3을 연결) 작성

public class BeanTest 
{
	private String name;
	private int age;
	private String addr;
	
	
	public BeanTest()
	{
		System.out.println("BeanTest() 생성자 실행됨");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
