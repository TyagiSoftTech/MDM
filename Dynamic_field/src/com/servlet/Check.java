package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;


public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		  String user_db=null;
		  PrintWriter out = response.getWriter(); 
		  String uname=request.getParameter("uname");
		  System.out.println(uname);
		  String SQL="SELECT username FROM userinfo WHERE username='"+uname+"'";   
		  Connection con=DBConnection.getConnection(user_db);
		  Statement st;
		  ResultSet rs;
		
		  
		 try 
		 {
       	  st=con.createStatement();
       	   rs=st.executeQuery(SQL);
       	  // System.out.println(SQL);
       
       	  if(!rs.next())
       	  {  
       	
       		  out.print("<b>"+uname+"</b> is avaliable");
       		  System.out.println("true");
       	
       		 
       	  }
       	  else
       	  {
       		 
       		 out.print("<font color=red><b>"+uname+"</b> is already in use</font>");
       		  System.out.println("false");
       		 
       		  
       	  }	
         
       	 
		 }
	     catch(SQLException ex)
         {
    	  ex.printStackTrace();
         }
      finally 
      {  
            out.close();
	  }
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
			doPost(request, response);
			}
}
