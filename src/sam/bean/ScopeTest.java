package sam.bean;

public class ScopeTest 
{
	private int count;
	
	public ScopeTest()
	{
		System.out.println("scopeTest 생성자 호출됨!");
		count=0;
	}

	public int getCount() 
	{
		System.out.println("현재 저장된 count 값 : "+count);
		return count;
	}

	public void setCount(int count) 
	{
		this.count += count;
		System.out.println(count+"가 입력되어"+this.count+"값이 세팅되었다.");
	}
	
	
}
