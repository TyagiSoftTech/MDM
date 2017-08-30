<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>

    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
<% ArrayList table_field1=(ArrayList)request.getSession().getAttribute("Table_field_name"); %>
<% ArrayList table_data1=(ArrayList)request.getSession().getAttribute("Table_fields");%>
<% String un=(String)request.getSession().getAttribute("username"); %>
<%String tb_name=(String)request.getSession().getAttribute("Table_name"); %>
</head>
<body>
 	<%if(un!=null)
      {
     %>
    <%@ include file="Nav.jsp" %>
    <% }%>
     

<div class=main> 
<%@include file="Header.jsp" %>
<div class="container">

     <div class="row">
		<div class="page-header">
		
         <%-- <%if(un!=null)
                	 {
                	 %>
                	 <h4>Welcome <%=un %></h4>
                	 <%}
         else
         {%>
        	<h4>Welcome Guest</h4>
         <% }
         %>
          <h2>Table Data</h2>    --%>   	 
	</div>
    </div>
        <div id="main">
    <div id="content">
        <section>
            <div class="container">
                <h3>Table Name :- <%=tb_name%></h3>
                


   <%
   String name=null,name2=null;
   int size=table_field1.size();
   int temp=size;
   if(table_data1!=null && table_data1.size()!=0)
	{
	
	  %>
	   <p></p>
	  <h4> Total no. of rows are:- <%= table_data1.size()/size%></h4>
	  <p></p>
	 <div class="table-responsive">
	  
	   <table class="table table-bordered">
	   <thead>
	   <tr class="danger">
	   <%   for(int i=0; i<size;i++)
		{
			 name=(String)table_field1.get(i);
			 out.println("<th>");
			 out.println(name);
			 out.println("</th>");
		      
		}
	     %>
	    
	 </tr>
	   </thead>
	   <tbody>
	    <%
	  
	     for(int j=0; j<table_data1.size();j++)
	     {   
	    	 
	    	 out.println("<tr>");
	         for(int i=j; i<size;i++)
			    { 
	        	 out.println("<td>");
				out.println(table_data1.get(i)); 
				out.println("</td>");
			    }
	         out.println("</tr>");
	         
	        j=size-1;
	        size=size+temp;
	         
	     }   
	}
	else
		out.println("Data not avialable");
    %> 
      </tbody>
    </table>
    </div>

            </div>
        </section>
   </div>
   </div> 
</div>
</div>
</body>
</html>