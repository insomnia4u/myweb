package sam.member;

import java.sql.*;

public class MemberDTO 
{
	private int idx;
	private String id;
	private String name;
	private String pw;
	private String email;
	private String addr;
	private Date joindate;
	
	
	
	public MemberDTO() 
	{
		
	}


	public int getIdx() {
		return idx;
	}


	
	
	public Date getJoindate() {
		return joindate;
	}




	public MemberDTO(int idx, String id, String name, String email, String addr, Date joindate) {
		super();
		this.idx = idx;
		this.id = id;
		this.name = name;
		this.email = email;
		this.addr = addr;
		this.joindate = joindate;
	}


	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	
	
	
}
