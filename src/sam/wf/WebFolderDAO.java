package sam.wf;

import java.io.*;
import java.util.ArrayList;

public class WebFolderDAO 
{
	public static final String USERS_HOME="D:/onedrive/SARTE(Java)/jspstudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/wf/uploads";
	
	private String user;
	private String cp;
	private int totalSize, usedSize, freeSize;
	
	public WebFolderDAO() {
		System.out.println("WebFolderDAO 생성자 호출됨");
		totalSize=1024*1024*1000;	
		
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		
		this.user = user;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		
		this.cp = cp;
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public int getUsedSize() {
		return usedSize;
	}

	public void setUsedSize(int usedSize) {
		this.usedSize = usedSize;
	}

	public int getFreeSize() {
		return freeSize;
	}

	public void setFreeSize(int freeSize) {
		this.freeSize = freeSize;
	}
	
	/**사용자 폴더가 있는지 없는지 확인*/
	public boolean userFloderExists()
	{
		File f=new File(USERS_HOME+"/"+user);
		
		if(f.exists())
		{
			usedSize=0;
			settingSize(f);
			freeSize=totalSize-usedSize;
			return true;
		}
		else
		{
			return false;
		}
	}
	
	/**실제 용량을 구하는 메서드*/
	public void settingSize(File f)
	{
		File files[]=f.listFiles();
		
		for(int i=0;i<files.length;i++)
		{
			if(files[i].isFile())
			{
				usedSize+=files[i].length();
			}
			else
			{
				settingSize(files[i]);
			}
		}
	}

	public void delFolder(File f)
	{
		if(f.isFile())
		{
			f.delete();
		}		
		else
		{
			File files[]=f.listFiles();
			
			for(int i=0;i<files.length;i++)
			{
				if(files[i].isFile())
				{
					files[i].delete();
				}
				else
				{
					delFolder(files[i]);
				}
				if(files[i].exists())
				{
					files[i].delete();
				}
			}
			
			f.delete();
		}
	}
}
