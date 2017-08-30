package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;


public class InsertDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		        System.out.println("onServlet");
				
				String user_name =(String)request.getSession().getAttribute("user_db");
				String tableName =(String)request.getSession().getAttribute("Table_name");
				ArrayList<String> table_fieldName =(ArrayList)request.getSession().getAttribute("Table_field_name");
				
				System.out.println(tableName);
				  int size=table_fieldName.size();
				
				  System.out.println(size);
				  Statement st;
				  String err=null;
		          StringBuffer sb = new StringBuffer(); 
		          sb.append("INSERT INTO "+user_name+"."+tableName+" VALUES");
		      
		          int f=0; 
		          String str=null;
				//Enumeration paramNames = request.getParameterNames();
				String[] name= request.getParameterValues("book");
				//System.out.println(name);
				for (int i = 0; i < name.length; i++) 
				{
				 //System.out.println(name[i]);	
				 if(name[i]!="")
				 {
			   /* while(paramNames.hasMoreElements()) 
			    {
			    		
			      String paramName = (String)paramNames.nextElement();
			      String paramValue = (request.getParameter(paramName));
			      */
			        if(f==size)
			        {
			        	sb.append("),");
			        	f=0;
			        }
			        if(f==0)
			        {
			        	
			        sb.append("(NULL,");
			        
			        }
			    	if(name[i].matches("[0-9]+"))   
			    	{
			    		if(f==size-1)
			    		{
			    		  sb.append(name[i]);	
			    		}
			    		else
			    		{	
			    		sb.append(name[i]+",");
			    		}
			    		f++;
			    		
			    	}
			    	else
			    	{
			    		if(f==size-1)
			    		{
			    		  sb.append("'"+name[i]+"'");	
			    		}
			    		else
			    		{	
			    		sb.append("'"+name[i]+"',");
			    		}
			    		f++;
			    	  
			         } 
		
                    }
				}
			    sb.append(");");
			    System.out.println(sb);
			    
			    String SQL=sb.toString();
			    Connection con=DBConnection.getConnection(user_name);

		          try {
		  			  st=con.createStatement();
		  			  st.execute(SQL);
		  			  
		  			  System.out.println("Insert successfully!");
		  			response.sendRedirect("Insertdata.jsp");
		              }
		          catch(SQLException ex)
		             {
		        	  ex.printStackTrace();
		        	  System.out.println(ex.getMessage());
		        	  err=ex.getMessage();
		        	  request.getSession().setAttribute("Error1",err);
		        	  response.sendRedirect("Insertdata.jsp");
		        	  
		             }
	     }
	
}