package sam.bbs;
import java.sql.Date;
import java.sql.*;
import java.util.*;

public class BbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BbsDAO() {
		System.out.println("BbsDAO생성자 호출됨!!");
	}
	
	/**ref 최고값 구하기	 */
	public int getMaxRef()
	{
		try
		{
			String sql="select max(ref) from jsp_bbs";
			
			ps=conn.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			int max=0;
			
			if(rs.next())
			{
				max=rs.getInt(1);
			}
			return max;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return 0;
		}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}
			catch(Exception e)
			{
				
			}
		}
	}
	
	/**게시판 글쓰기*/
	public int bbsWirte(BbsDTO dto){
		
		try {
			conn=sam.db.SamDB.getConn();
			
			int ref=getMaxRef();
			
			String sql="insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
		    ps.setString(2, dto.getPwd());
		    ps.setString(3, dto.getSubject());
		    ps.setString(4, dto.getContent());
		    ps.setInt(5, ref+1);
		    
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
	}
	
	/**순번수정 관련 메서드*/
	public void sunUpdate(int ref, int sunbun)
	{
		try
		{
			String sql="update jsp_bbs set sunbun=sunbun+1 where ref=? and sunbun>=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, ref);
			ps.setInt(2, sunbun);
			
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(ps!=null)ps.close();
			}
			catch(Exception e2)
			{
				
			}
		}
	}
	
	/** 답글쓰기*/
	public int bbsReWrite(BbsDTO dto)
	{
		try
		{
			conn=sam.db.SamDB.getConn();
			sunUpdate(dto.getRef(), dto.getSunbun()+1);
			
			String sql="insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,?,?)";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getLev()+1);
			ps.setInt(7, dto.getSunbun()+1);
			
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
	
	/**게시판 리스트*/
	public ArrayList<BbsDTO>bbsList(int cp,int ls){
		try{
			conn=sam.db.SamDB.getConn();
//			String sql="select * from jsp_bbs order by idx desc";//내림차순 정렬
			String sql="select * from "+
             "(select rownum as rnum,a.* from"+
             "(select * from jsp_bbs order by ref desc, sunbun asc)a)b "+
             "where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
			
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
	   
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while(rs.next()){
				
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				
				BbsDTO dto = new BbsDTO(idx, writer, pwd, subject,	content, writedate, readnum, ref, lev, sunbun);
				arr.add(dto);
			}
			return arr;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	 }
	/**총게시물 관련메서드*/
	public int getTotalCnt(){
		try {
			conn=sam.db.SamDB.getConn();
			String sql="select count(*) from jsp_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
	}

	/**본문관련메서드*/
	public BbsDTO bbsContent(int idx){
		try {
			conn=sam.db.SamDB.getConn();
			String sql="select * from jsp_bbs where idx=?";

			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			BbsDTO dto=null;
			
			if(rs.next()){
			String writer = rs.getString("writer");
			String pwd = rs.getString("pwd");
			String subject = rs.getString("subject");
			String content = rs.getString("content");
			java.sql.Date writedate=rs.getDate("writedate");
			int readnum = rs.getInt("readnum");
			int ref = rs.getInt("ref");
			int lev = rs.getInt("lev");
			int sunbun = rs.getInt("sunbun");
			
			dto = new BbsDTO(idx, writer, pwd, subject,content, writedate, readnum, ref, lev, sunbun);
			
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
	}

}
