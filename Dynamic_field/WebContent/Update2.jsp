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
          <h2>Table Data</h2>   --%>    	 
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
   int size1=size;
   if(table_data1!=null && table_data1.size()!=0)
	{
	 
	  %>
	       <p></p>
	  <h4> Total no. of rows are:- <%= table_data1.size()/size%></h4>
	  <p></p>
	 <div class="table-responsive" id="demo">
	  
	   <table class="table table-bordered table-hover" id="resultTable">
	   <thead>
	   <tr class="danger">

	   <%   for(int i=1; i<size;i++)
		{
			 name=(String)table_field1.get(i);
			 
			 out.println("<th>");
			 out.println(name);
			 out.println("</th>");
		      
		}
	     %>
	    <th>
	       <button type="button" class="btn btn-default addButton"><i class="">EDIT</i></button>
	    </th>
	 </tr>
	   </thead>
	   <tbody>
	   
	    <%
	 
	    int id=0;
	     for(int j=1; j<table_data1.size();j++)
	     {   
	    	
	    	
	    	 %>
	    	 <tr id="<%=table_data1.get(id) %>">
	    	 
	    	 <% 
	    	 id=id+temp;
	    
	         for(int i=j; i<size;i++)
			    { 
	        	 
	        	 out.println("<td>");
				out.println(table_data1.get(i)); 
				out.println("</td>");
			   
			    }
	          %>
	          
	         
	         	
				   <td>
			       <p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p>
			    </td>
			    </tr>
	         <% 
	        j=size;
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
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
      <form action="UpdateData" method="post">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
        
      </div>
          <div class="modal-body">
         
             <%   for(int i=1; i<size1;i++)
		{
            	 
			%>
              <div class="form-group">
            	 <input class="form-control " type="text" name="update" placeholder="feild">
              </div>
      
       <%     	 
		}
	     %>
         
       
      </div>
          <div class="modal-footer ">
        <button type="submit" class="btn btn-warning btn-lg" style="width: 100%"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      </div>
        </div>
        </form>
        
    </div>
     
   </div>
    
   
      <script type="text/javascript">
 	 var xhttp=new XMLHttpRequest();
	 
   $(document).ready(function onload (){
	   $('#resultTable tr').click(function(event){
		  var rid=this.id;
		  // window.location.replace("Update2.jsp?idd"+rid);
		//alert($(this).attr('id'));
	

  try{
	  xhttp.onreadyStatechange=rid;
	 xhttp.open("POST","RowServlet?rid="+rid,true);
	 xhttp.send();
  }
	 catch (e) 
	 {
	  alert("uanable to connect");	
	}
	   });
   });		  
 
   </script>
    
</body>
</html>