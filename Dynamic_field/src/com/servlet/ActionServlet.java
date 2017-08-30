package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.db.DBConnection;


public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		//String name=null;
		//String tableName=request.getParameter("tableName");
		System.out.println("onServlet");
		String user_name =(String)request.getSession().getAttribute("user_db");
		System.out.println(user_name);
		Boolean status=false;
		String err=null;
		/*name=request.getParameter("field");
		
		if (name.equals(""))
		{
			System.out.println("Hello user");;
		}
		else
		{
			System.out.println("Hello " + name);
		}*/
	
		  Statement st;
          StringBuffer sb = new StringBuffer(); 
          sb.append("CREATE TABLE ");
          //System.out.println(sb);
          
		//int i=0;
        //StringBuffer sb1 = new StringBuffer(); 
        
          int f=0; 
          String str=null;
		Enumeration paramNames = request.getParameterNames();
	    while(paramNames.hasMoreElements()) 
	    {
	    		
	      String paramName = (String)paramNames.nextElement();
	      String paramValue = (request.getParameter(paramName));
	      
	      if(paramValue=="")
	      {
	    	  sb.append(", PRIMARY KEY (INDEX1))");
	    	  break;
	      }
	      if(f==4)
	      {
	    	  f=1;
	    	  sb.append(",");
	      }  
	    	f++;
	    	
	      //System.out.println(paramValue);
	    	   if(f==1)
		        {
	             sb.append(paramValue+"(INDEX1 int NOT NULL AUTO_INCREMENT, ");
		        }
	        if(f==2)
	        {
             sb.append(paramValue);
	        }  
            else if(f==3)
	        {
            	
             sb.append(" "+paramValue);
             str=paramValue;
            // System.out.println(str);
             
	        }
	        else if(f==4)
	        {    
	        	 //System.out.println(str);
	             if(str.equals("integer") || str.equals("double"))
	        	 {
	        		 sb.append("");
	        	 }
	        	 else
	        	 sb.append("("+paramValue+")");
	         }
	     
	    }
	    //System.out.println("total: "+i);
		
    System.out.println(sb);
    String SQL=sb.toString();

    Connection con=DBConnection.getConnection(user_name);

          try {
  			  st=con.createStatement();
  			  st.execute(SQL);
  			  
  			  System.out.println("Table successfully created!");
  			    status=true; 
  			
  			
              }
          catch(SQLException ex)
             {
        	  ex.printStackTrace();
        	  err=ex.getMessage();
        	  request.getSession().setAttribute("Error1",err);
        	  response.sendRedirect("field.jsp");
             }
	    if(status==true)
	    {
	    	RequestDispatcher rd=  request.getRequestDispatcher("RepositoryFetch");
   			rd.forward(request, response);
	    	//response.sendRedirect("Home.jsp");
	    }
		/*String name=null;
		name="Hello "+request.getParameter("user");
		System.out.println("name :" + name);
		if (request.getParameter("user").toString().equals(""))
		{
			name="Hello user";
		}
		response.setContentType("text/plain");  
		  response.setCharacterEncoding("UTF-8"); 
		  response.getWriter().write(name);*/
	}

}
