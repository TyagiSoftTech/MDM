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

public class TableSchemaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		
		//out.println("Table Schema");
		String user_name =(String)request.getSession().getAttribute("user_db");
		ArrayList table_list1 =(ArrayList)request.getSession().getAttribute("Table_list");
		System.out.println(user_name);
	/*	if(table_list1==null)
		{
			RepositoryFetch rf=new RepositoryFetch();
			
		}
		*/
		if(user_name!=null)
		{
		Statement st;
		ResultSet rs1,rs2,rs3;
		String tb_name=request.getParameter("name");
		 request.getSession().setAttribute("Table_name",tb_name);
		String Schema;
		System.out.println(tb_name);
	     String SQL="DESCRIBE "+user_name+"."+tb_name;
		//String SQL1="SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='"+tb_name+"' AND COLUMN_NAME NOT IN ('INDEX1')";
	   //String SQL1 ="SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='"+user_name+"'AND TABLE_NAME='"+tb_name+"'";
	   //String SQL2 ="SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='"+user_name+"'AND TABLE_NAME='"+tb_name+"'";
	  // String SQL3 ="SELECT character_maximum_length FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='"+user_name+"'AND TABLE_NAME='"+tb_name+"'";
	   ArrayList<String> table_Schema= new ArrayList<String>();
		
		 
		 try {
			 Connection con=DBConnection.getConnection(user_name);
 			  st=con.createStatement();
 			 
 			  rs1=st.executeQuery(SQL);
 			  
 			  //rs2=st.executeQuery(SQL2);
 			  
 			  //rs3=st.executeQuery(SQL3);
 			  
 			  
 			  System.out.println("Fetch");
 			 while(rs1.next())
 			 {
 				 //TableList tl1= new TableList();
 				//System.out.println(rs1);
              Schema=(rs1.getString(1));
              table_Schema.add(Schema);
              Schema=(rs1.getString(2));
              table_Schema.add(Schema);  
 				
 				 
 			 }
 			 request.getSession().setAttribute("Table_Schema",table_Schema );
             }
		 
         catch(SQLException ex)
            {
       	  ex.printStackTrace();
            }
		
		 if(table_Schema!=null)
		 {
			 System.out.println("Schema available");
		 }
		 response.sendRedirect("Schema_Table2.jsp");
	}

	}

}
