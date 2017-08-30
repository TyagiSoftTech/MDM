package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.servlet.ActionServlet;

public class DBConnection 
{
	public static Connection getConnection(String db_name)
	{
		String url;
	String Driver="com.mysql.jdbc.Driver";
	if(db_name!=null)
	{
	 url="jdbc:mysql://localhost:3306/"+db_name;
	}
	else 
	{
	url="jdbc:mysql://localhost:3306/mdm";
	}
	System.out.println(url);
	String user="root";
	String pass="root";

	
      
	Connection con=null;
	 
		 try
			{
				Class.forName(Driver);
				con=DriverManager.getConnection(url,user,pass);
			}
			catch(ClassNotFoundException ex)
			{
				ex.printStackTrace();
			}
			catch (SQLException ex) 
			{
				ex.printStackTrace();
			}
			
		  	return con;
	 }


}
