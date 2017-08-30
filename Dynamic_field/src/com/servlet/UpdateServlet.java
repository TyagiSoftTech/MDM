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


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("I m in update");
	PrintWriter out=response.getWriter();
		
	     String tbName=(String)request.getSession().getAttribute("Table_name");
		String user_name =(String)request.getSession().getAttribute("user_db");
		ArrayList table_list1 =(ArrayList)request.getSession().getAttribute("Table_list");
		System.out.println(user_name);
		if(user_name!=null)
		{
		   String tb_name=request.getParameter("name");
	       
	       if(tb_name==null)
	       {
	    	   tb_name=tbName;
	       }
	       request.getSession().setAttribute("Table_name",tb_name);
		Statement st1,st2;
		ResultSet rs1,rs2;
		System.out.println(tb_name);
		String SQL1="SHOW COLUMNS FROM "+user_name+"."+tb_name+"";	
		String SQL2="SELECT * FROM "+user_name+"."+tb_name+"";
	    String field_name=null;
	    String fields=null;
	   ArrayList<String> table_field_name= new ArrayList<String>();
	   ArrayList<String> table_data= new ArrayList<String>();
		 
		 try {
			 Connection con=DBConnection.getConnection(user_name);
			 st1=con.createStatement();
			  rs1=st1.executeQuery(SQL1);
			  
		
			 
			  st2=con.createStatement();
			  rs2=st2.executeQuery(SQL2);
			  
			
			  
 			  System.out.println("Fetch");
 	         while(rs1.next())
 			 {
 				 
              out.println(rs1.getString(1));
              out.println(" ");
              field_name=(rs1.getString(1));
              
 				table_field_name.add(field_name);
 				 
 			 }
 	      System.out.println(table_field_name.size());
 	    int size= table_field_name.size()+1;
 			 while(rs2.next())
 			 {
 				 
			for (int i = 1; i <size; i++) {
				
	
 				 fields=rs2.getString(i);
 				
 				 table_data.add(fields);				 
 				
			} 
 				
 			 }
 			 System.out.println("size:"+table_data.size());
 			 request.getSession().setAttribute("Table_field_name", table_field_name);
 			 request.getSession().setAttribute("Table_fields",table_data);
             }
		 
		 
         catch(SQLException ex)
            {
       	        ex.printStackTrace();
            }
		 response.sendRedirect("Update2.jsp");
	    if(table_field_name!=null && table_field_name.size()!=0)
		 {
			 System.out.println("field name  available");
		 }
	    if(table_data!=null && table_data.size()!=0)
		 {
			 System.out.println("field data  available");
		 }
	  //System.out.println(table_data);
	    //ArrayList table_field1 =(ArrayList)request.getSession().getAttribute("Table_fields");
	    //System.out.println(table_field1);*/
	    
	 }
	}

}
