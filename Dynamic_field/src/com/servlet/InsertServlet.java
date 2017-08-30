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

import com.db.DBConnection;


public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("I m in insert");
PrintWriter out=response.getWriter();
		
		
		String user_name =(String)request.getSession().getAttribute("user_db");
		ArrayList table_list1 =(ArrayList)request.getSession().getAttribute("Table_list");
		System.out.println(user_name);
		if(user_name!=null)
		{
		Statement st1;
		ResultSet rs1;
		String tb_name=request.getParameter("name");
		request.getSession().setAttribute("Table_name", tb_name);
		
		System.out.println(tb_name);
		String SQL1="SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='"+tb_name+"' AND COLUMN_NAME NOT IN ('INDEX1')";
	    String field_name=null;
	  
	   ArrayList<String> table_field_name= new ArrayList<String>();
	
		 
		 try {
			 Connection con=DBConnection.getConnection(user_name);
 			  st1=con.createStatement();
 			  rs1=st1.executeQuery(SQL1);
 			  System.out.println("Fetch");
 	         while(rs1.next())
 			 {
              field_name=(rs1.getString(1));
 				table_field_name.add(field_name);
 			 }
 	      System.out.println(table_field_name.size());
 		
 			 request.getSession().setAttribute("Table_field_name", table_field_name);
 			
	 	
 	
		 }
         catch(SQLException ex)
            {
       	  ex.printStackTrace();
            }
		 response.sendRedirect("Insertdata.jsp");
	    if(table_field_name!=null && table_field_name.size()!=0)
		 {
			 System.out.println("field name  available");
		 }
		
	  }
	}
}
