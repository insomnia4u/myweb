package sam.emp;

import java.sql.*;
import java.util.*;
import sam.db.*;

//Data Access Object
public class EmpDAO 
{
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	
	public EmpDAO()
	{
		
		
		try
		{
			
		}
		catch(Exception e)
		{
			
		}
	}

	
	
	
	/**사원 등록 관련 메서드*/
	public int empAdd(EmpDTO dto)
	{
	//결과만 돌려주면 되므로 int를 반환
				
		try //자원을 쓰는 건 무조건 예외처리하고 반환
		{
			
			conn=SamDB.getConn();
			String sql="insert into employee values(employee_idx.nextval,?,?,?)";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			
			int count=ps.executeUpdate();
			
			return count;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}
		finally //try catch finally try catch
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
	
	/**사원 삭제 관련 메서드*/
	public int empDel(EmpDTO dto)
	{
		
		try
		{
			conn=SamDB.getConn();
			String sql="delete from employee where name=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, dto.getName());
			
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
				if(ps!=null)
				{
					ps.close();
				}
				if(conn!=null)
				{
					conn.close();
				}
			}
			catch(Exception e2)
			{
				
			}
		}

	}
	
	public EmpDTO[] empAllList()
	{
		try
		{
			conn=SamDB.getConn();
			String sql="select * from employee";
			
			ps=conn.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			Vector<EmpDTO> v=new Vector<EmpDTO>();
			
			while(rs.next())
			{
				int idx=rs.getInt(1);
				String name=rs.getString(2);
				String email=rs.getString(3);
				String dept=rs.getString(4);
				
				EmpDTO dto=new EmpDTO(idx, name, email, dept);
				v.add(dto);
			}
			
			EmpDTO dtos[]=new EmpDTO[v.size()];
			v.copyInto(dtos);
			//vector는 복사
			
			return dtos;
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
		
	}
	
	
	
	public ArrayList<EmpDTO> empFind(EmpDTO emp)
	{
		try
		{
			conn=SamDB.getConn();
			String sql="select * from employee where name=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, emp.getName());
			
			rs=ps.executeQuery();
			
			ArrayList<EmpDTO> al=new ArrayList<EmpDTO>();
			
			while(rs.next())
			{
				int idx=rs.getInt(1);
				String name=rs.getString(2);
				String email=rs.getString(3);
				String dept=rs.getString(4);
				
				EmpDTO dto=new EmpDTO(idx, name, email, dept);
				al.add(dto);
			}
			
			
			return al;
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
	}
}
