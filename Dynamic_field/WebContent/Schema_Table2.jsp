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
<% ArrayList table_schema1=(ArrayList)request.getSession().getAttribute("Table_Schema"); %>

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
		<%-- 
         <%if(un!=null)
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
                	   <p></p>  

   <%  
   String name=null,name2=null;
   int size=table_schema1.size();
   int temp=size;
   if(table_schema1!=null && table_schema1.size()!=0)
	{
	  %>
	   <br />
	 <div class="table-responsive">
	  
	   <table class="table table-bordered">
	   <thead>
	   <tr class="danger">
	   
			 <th> Attribute Name</th>
			  <th>Data Type(Size*)</th>
	 </tr>
	   </thead>
	   <tbody>
	    <%
	 
	      
	     for(int i=2; i<table_schema1.size();i++)
	     {   
	    	 
	    	 out.println("<tr>");
	        for(int j=i; j<i+2;j++)
	        {
	        	 out.println("<td>");
				out.println(table_schema1.get(j)); 
				out.println("</td>");
	        }
	         out.println("</tr>");
	        
	        i=i+1;
	        //size=size+temp; 
	         
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