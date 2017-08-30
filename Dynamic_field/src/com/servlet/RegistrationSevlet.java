package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;



public class RegistrationSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String user_db=null;
		String username=request.getParameter("username");
		String fname= request.getParameter("firstName");
		String lname= request.getParameter("lastName");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		  Statement st;
		  ResultSet rs;
		  Boolean valid=false;
		  Boolean status=false;
		  PrintWriter out = response.getWriter();  
		  Connection con=DBConnection.getConnection(user_db);
	   
		  System.out.println(username+":"+fname+":"+ lname+":"+ email+":"+password);
		  String SQL1="SELECT username FROM userinfo WHERE username='"+username+"'";   
		  String SQL2="insert into userinfo values('"+username+"','"+fname+"','"+lname+"','"+email+"','"+password+"')";
		  String SQL3="CREATE DATABASE "+username;
	      //System.out.println(SQL1);
	      //System.out.println(SQL2);
		 
         try{
        	 
        	  st=con.createStatement();
        		  request.getSession().setAttribute("user_db", username);
     		  request.getSession().setAttribute("username", fname);
  			  
  			  st.execute(SQL2);
  			  System.out.println("user info inserted successfully");
  			  st.execute(SQL3);
  			  System.out.println("database  successfully created!");
               //status=true;
         	  
               
              	 response.sendRedirect("login.jsp");
               
               
               
              }
       
         
          catch(SQLException ex)
             {
        	  ex.printStackTrace();
             }
         
         finally {  
	            out.close();
		  }
	
     
	}

}
