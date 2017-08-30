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


public class UpdateData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		System.out.println("i in update ....");
		String user_name =(String)request.getSession().getAttribute("user_db");
		String tableName =(String)request.getSession().getAttribute("Table_name");
		//ArrayList<String> table_fieldName =(ArrayList)request.getSession().getAttribute("Table_field_name");
		String index1=(String)request.getSession().getAttribute("INDEX");
		//HttpSession session=request.getSession(false);
		int index=Integer.parseInt(index1);
		
		
		  System.out.println(tableName);
		
		  String SQL1="SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='"+tableName+"' AND COLUMN_NAME NOT IN ('INDEX1')";
		  Statement st1,st2;
		  ResultSet rs;
		  String err=null;
		  String field_name=null;
		  ArrayList<String> table_field_name1= new ArrayList<String>();
		  Connection con=DBConnection.getConnection(user_name);
	      try {
  			  st1=con.createStatement();
  			rs= st1.executeQuery(SQL1);
  		  while(rs.next())
			 {
				 
           //out.println(rs1.getString(1));
           //out.println(" ");
           field_name=(rs.getString(1));
           
				table_field_name1.add(field_name);
				 
			 }
	      }
	      
	      catch(SQLException ex)
	      {
	    	  ex.printStackTrace();
	      }
	      
	      int size=table_field_name1.size();
	      System.out.println(size);
          StringBuffer sb = new StringBuffer(); 
		 sb.append("UPDATE "+user_name+"."+tableName+" SET ");
		 
		
          //String status=null;
		
		String[] name= request.getParameterValues("update");
		
		for (int i = 0; i < name.length; i++) 
		{
		 System.out.println(name[i]);
		    
		    if(i==size-1)
		    {
		     	if(name[i].matches("[0-9]+"))   
		    	{
		    	     sb.append(table_field_name1.get(i)+"="+name[i]+"");	
		    	}
		       else
		    	{	
		    	   
		    	sb.append(table_field_name1.get(i)+"='"+name[i]+"'");
		    	}
		    }
		 
		    else
		    {	
	    	if(name[i].matches("[0-9]+"))   
	    	{
	    	     sb.append(table_field_name1.get(i)+"="+name[i]+",");	
	    	}
	       else
	    	{	
	    	   
	    	sb.append(table_field_name1.get(i)+"='"+name[i]+"',");
	    	}
		    }
		}
		
	    sb.append(" WHERE INDEX1="+index+";");
	    System.out.println(sb);
	    
	    String SQL2=sb.toString();
	   

          try {
  			  st2=con.createStatement();
  			  st2.execute(SQL2);
  			  
  			  System.out.println("Update successfully!");
  			//response.sendRedirect("UpdateServlet");
              }
          catch(SQLException ex)
             {
        	  ex.printStackTrace();
        	  System.out.println(ex.getMessage());
        	  err=ex.getMessage();
        	  request.getSession().setAttribute("Error1",err);
        	  
             }
		
		
		
		/*UPDATE himanshu.student
		SET sname = 'Rahul'
		WHERE id = '123';*/
		
		
		response.sendRedirect("UpdateServlet");
		
	}

}
