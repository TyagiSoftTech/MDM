package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.TableList;
import com.db.DBConnection;


public class RepositoryFetch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("onServlet");
		String user_db =(String)request.getSession().getAttribute("user_db");
		System.out.println(user_db);
		if(user_db!=null)
		{
		Statement st;
		ResultSet rs;
		//PrintWriter out=response.getWriter();
		//String tb_name=request.getParameter("table_name");
		
		//String SQL="DESCRIBE userinfo" ;//+tb_name; 
		// String SQL="SHOW FIELDS db_name.table_name";
		String SQL="show tables";
		 ArrayList<TableList> table_list= new ArrayList<TableList>();
		 Connection con=DBConnection.getConnection(user_db);
	
			
			try {
 			  st=con.createStatement();
 			 
 			  rs=st.executeQuery(SQL);
 			  
 			  System.out.println("Fetch");
 			 while(rs.next())
 			 {
 				 TableList tl1= new TableList();
 				
              //out.println(rs.getString(1));
 				 tl1.setName(rs.getString(1));
 			   
 				table_list.add(tl1);
 				 
 			 }
 			 request.getSession().setAttribute("Table_list", table_list);
             }
		 
         catch(SQLException ex)
            {
       	  ex.printStackTrace();
            }
		 response.sendRedirect("Home.jsp");
	
		 if(table_list!=null)
		 {
			 System.out.println("list available");
		 }
	    
	}
		/*ArrayList<TableList> table_list1 =(ArrayList)request.getSession().getAttribute("Table_list");

	 if(table_list1!=null)
		{
		 System.out.println("Tables Name");
			for(int i=0; i<table_list1.size();i++)
			{
				TableList tl=(TableList)table_list1.get(i);
				
				System.out.println(tl.getName());
			}	
		}
		else
			System.out.println("Repository not avialable");*/


		
		

	
		
	}
}
