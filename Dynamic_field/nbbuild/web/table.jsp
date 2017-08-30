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
    <% String un=(String)request.getSession().getAttribute("username"); 
 String tb_name1=(String)request.getSession().getAttribute("Table_name");%>
 <% ArrayList table_field1=(ArrayList)request.getSession().getAttribute("Table_field_name"); %>
</head>

<body>
<div class="container">
<div class="row">
		<div class="page-header">
		<h1>Insert Data</h1>
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
            <label class="col-xs-1 control-label"><%=tb_name1%></label>      	 
		</div>
				 <% 
   String name=null,name2=null;
   int size=table_field1.size();
   int temp=size;
   if(table_field1!=null && table_field1.size()!=0)
	{
	 
	  %>
	
    <div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table table-bordered table-hover" id="tab_logic">
			 <thead>
	   <tr class="danger">
	 	<th class="text-center">
							#
						</th>
	   <%   for(int i=0; i<size;i++)
		{
			 name=(String)table_field1.get(i);
			 out.println("<th>");
			 out.println(name);
			 out.println("</th>");
		      
		}
	}
	     %>
	    
	 </tr>
	   </thead>
				<tbody>
					<tr id='addr0'>
						<td>
						1
						</td>
						 <%
				 for(int i=0; i<size;i++)
				 {
				 %>
						<td>
						<input type="text" name='name[]'  placeholder='field' class="form-control"/>
						</td>
						<% 
				 }
				%> 
					</tr>
                    <tr id='addr1'></tr>
				</tbody>
			</table>
		</div>
	</div>
	<a id="add_row" class="btn btn-default pull-left">Add Row</a><a id='delete_row' class="pull-right btn btn-default">Delete Row</a>
</div>
<script>
    $(document).ready(function(){
      var i=1;
 
     $("#add_row").click(function()
    {
    
    		 
      $('#addr'+i).html("<td>"+ (i+1) +"</td><td><input name='name"+i+"' type='text' placeholder='field' class='form-control input-md'  /> </td>");
    		
      $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
      i++; 
    		 
  });
     $("#delete_row").click(function(){
    	 if(i>1){
		 $("#addr"+(i-1)).html('');
		 i--;
		 }
	 });

});
    </script>
</body>
</html>