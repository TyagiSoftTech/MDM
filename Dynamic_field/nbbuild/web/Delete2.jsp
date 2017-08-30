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
       <%if(un==null || table_data1==null || table_field1==null )
        	  
                	 {
                response.sendRedirect("Error.jsp");
                	
                	 }
       else{ 
                	 %>
          	 
<div class=main> 
<%@include file="Header.jsp" %>     
<div class="container">
    <div class="row">
		<div class="page-header">
		
       
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
	 <div class="table-responsive" id="resultTable">
	  
	   <table class="table table-bordered table-hover" >
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
	       <button type="button" class="btn btn-default addButton"><i class="">Delete</i></button>
	    </th>
	 </tr>
	   </thead>
	   <tbody>
	    <%
	    out.println("<h4>Table Name :-"+tb_name+"</h4>");
	    out.println( "<h4> total rows are:"+table_data1.size()/size+"</h4>");
	    int id=0;
	     for(int j=1; j<table_data1.size();j++)
	     {   
	    	 
	    	 %>
	    	 <tr id="<%=table_data1.get(id)%>">
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
			      <p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p>
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
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
      <form action="DeleteData" method="post">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="submit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
        </form>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
 </div>   
      <script type="text/javascript">
 	 var xhttp=new XMLHttpRequest();
	 
   $(document).ready(function (){
	   $('#resultTable tr').click(function(event){
		  var rid=this.id;
		  // window.location.replace("Update2.jsp?idd"+rid);
		//alert($(this).attr('id'));
		//alert(rid);

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
<%} %>
</body>
</html>