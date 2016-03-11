package sam.member;

import java.sql.*;
import java.util.*;

import sam.db.*;

public class MemberDAO 
{
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	
	public MemberDAO() 
	{
		
	}
	
	
	
	public int memberJoin(MemberDTO dto)
	{
		try{
			
			conn=SamDB.getConn();
			String sql="insert into jsp_member values(jsp_member_idx.nextval, ?,?,?,?,?,sysdate)";
		
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getPw());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getAddr());

			
			int count=ps.executeUpdate();
					
			return count;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}
		finally
		{
			try
			{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
		
	}
	
	public boolean idCheck(String id)
	{
		try{
			
		conn=SamDB.getConn();	
		String sql="select * from jsp_member where id=?";
		
		ps=conn.prepareStatement(sql);
		
		ps.setString(1, id);
		
		rs=ps.executeQuery();
		
		return rs.next();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
			
			
		}
		
		
	}
	
	public ArrayList<MemberDTO> memberFind(String key, String value)
	{
		try
		{
			
			conn=SamDB.getConn();		
			//etc.
			
			String sql="select * from jsp_member where "+key+" = ?";
			
			ps=conn.prepareStatement(sql);
					
			
			ps.setString(1, value);
			
			rs=ps.executeQuery();
			
			
			ArrayList<MemberDTO> dtos=new ArrayList<>();
			
			
			
			while(rs.next())
			{
				int idx=rs.getInt(1);
				String id=rs.getString(2);
				String name=rs.getString(3);
				String email=rs.getString(5);
				String addr=rs.getString(6);
				java.sql.Date joindate=rs.getDate(7);
				
				MemberDTO dto=new MemberDTO(idx, id, name, email, addr, joindate);
				
				dtos.add(dto);
			}	
			
			return dtos;
		}
		catch(Exception e)
		{
			return null;
		}
		finally 
		{
			try
			{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
	}
	
	public int loginCheck(String id, String pwd)
	{
		try
		{
			conn=SamDB.getConn();
			String sql="select id, pwd from jsp_member where id=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, id);
			
			
			rs=ps.executeQuery();
			
			if(!rs.next())
			{
				return 1;
			}
			else
			{
				if(rs.getString(2).equals(pwd))
				{
					return 3;
				}
				else
				{
					return 2;
				}
					
			}
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
	}
	
	public String getUserInfo(String id)
	{
		try
		{
			
			conn=SamDB.getConn();
			String sql="select name from jsp_member where id=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				return rs.getString(1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			}
			catch(Exception e2)
			{
				
			}
		}
		
		return id;
	}
}
