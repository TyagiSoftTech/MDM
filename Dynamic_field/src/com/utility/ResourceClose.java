package com.utility;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class ResourceClose
{
	public static void  closeAllResourses(Connection con, Statement stmt) 
	{
		try
		{
			if(stmt!=null)
			{
				stmt.close();
				stmt=null;
			}
		}
		catch (SQLException ex)
		{
			ex.printStackTrace();
			
		}
		try
		{
			if (con!=null)
			{
				con.close();
				con=null;
			}
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}

   }


}
