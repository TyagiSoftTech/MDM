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


public class TableDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TableDataServlet() 
    {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	   
		PrintWriter out=response.getWriter();
		
		
		String user_name =(String)request.getSession().getAttribute("user_db");
		ArrayList table_list1 =(ArrayList)request.getSession().getAttribute("Table_list");
		System.out.println(user_name);
		if(user_name!=null)
		{
		   String tb_name=request.getParameter("name");
	       request.getSession().setAttribute("Table_name",tb_name);
		Statement st1,st2,st3,st4,st5;
		ResultSet rs1,rs2;
		System.out.println(tb_name);
		String SQL1="SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='"+tb_name+"' AND COLUMN_NAME NOT IN ('INDEX1')";
		String SQL2="CREATE TEMPORARY TABLE temp_"+tb_name+" SELECT * FROM "+user_name+"."+tb_name+"";
		String SQL3=" ALTER TABLE temp_"+tb_name+" DROP COLUMN INDEX1 ;";
		String SQL4="SELECT * FROM temp_"+tb_name+";";
		String SQL5="DROP TABLE temp_"+tb_name+"";
	    String field_name=null;
	    String fields=null;
	    System.out.println(SQL2);
	   ArrayList<String> table_field_name= new ArrayList<String>();
	   ArrayList<String> table_data= new ArrayList<String>();
	   
	   Connection con=DBConnection.getConnection(user_name);
		 try {
			 
 			  st1=con.createStatement();
 			  rs1=st1.executeQuery(SQL1);
 			  
 			  st2=con.createStatement();
 			  st2.execute(SQL2);
 			  
 			  st3=con.createStatement();
			  st3.execute(SQL3);
 			 
 			  st4=con.createStatement();
 			  rs2=st4.executeQuery(SQL4);
 			  
 			  st5=con.createStatement();
 			  st5.execute(SQL5);
 			  
 			   			  
 			  System.out.println("Fetch");
 	         while(rs1.next())
 			 {
 				 
              //out.println(rs1.getString(1));
              //out.println(" ");
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
		 response.sendRedirect("ViewData2.jsp");
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


