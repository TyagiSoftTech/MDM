package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.db.DBConnection;


public class DeleteData extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("i in delete ....");
	
		String user_name =(String)request.getSession().getAttribute("user_db");
		String tableName =(String)request.getSession().getAttribute("Table_name");
		
		String index1=(String)request.getSession().getAttribute("INDEX");
		HttpSession session=request.getSession(false);
		int index=Integer.parseInt(index1);
		
		  System.out.println(tableName);
	
		  Statement st;
		  String err=null;
		  boolean status=false;
          String SQL="DELETE FROM "+user_name+"."+tableName+" WHERE INDEX1="+index+";";
          System.out.println(SQL);
          try {
				 Connection con=DBConnection.getConnection(user_name);
	 			  st=con.createStatement();
	 			  st.execute(SQL);
	 			  status=true;
          }
          catch(Exception ex)
          {
        	  ex.printStackTrace();
          }
          
          if(status==true)
          { 
		   response.sendRedirect("DeleteServlet");
		   session.removeAttribute("INDEX");
          }
	}

}
