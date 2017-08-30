package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String user_db=null;
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		  Statement st;
		  ResultSet rs;
		  Boolean valid=false;
		  PrintWriter out = response.getWriter();  
		  Connection con=DBConnection.getConnection(user_db);
	   
		  System.out.println(username+":"+password);
		  String SQL1="SELECT * FROM userinfo WHERE username='"+username+"' and password='"+password+"'";  
	      System.out.println(SQL1);
	
          try {
        	  st=con.createStatement();
        	   rs=st.executeQuery(SQL1);
        	  if(rs.next())
        	  {  	
        		 valid=true;
        	  }
        	  else
        	  {
        		  valid=false;        		  
        	  }	
        	 
        	  if(valid==true)
        	  {  
        		  request.getSession().setAttribute("user_db", username);
     		  request.getSession().setAttribute("username", username);
  			  
   			  System.out.println("login successfully");
   			RequestDispatcher rd=  request.getRequestDispatcher("RepositoryFetch");
   			rd.forward(request, response);
  		
        	  }
        	  else 
        	   {
        		  response.setContentType("text/html");  
        		  out.println("<script type=\"text/javascript\">");  
        		  out.println("alert('Username or password is  incorrect');");  
        		  out.println("</script>");
        		  response.sendRedirect("login.jsp");
        		 
        	   }
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

