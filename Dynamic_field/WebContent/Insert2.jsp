<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
<title>Dynamic Field </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    
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
<div class="main">
<%@include file="Header.jsp" %>
<div class="container">
    <div class="row">
		<div class="page-header">
		<h1>Insert Data</h1>
 <%--         <%if(un!=null)
                	 {
        	
                	 %>
                	 <h4>Welcome <%=un %></h4>
                	 <%}
         else
         {%>
        	<h4>Welcome Guest</h4>
         <% }
         %> --%>
                	 
		</div>
	</div>	
<form action=""  method="post" class="form-horizontal" >
 
			
		 <% 
   String name=null,name2=null;
   int size=table_field1.size();
   int temp=size;
   if(table_field1!=null && table_field1.size()!=0)
	{
	 
	  %>
	  
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
	}
	     %>
	    
	 </tr>
	   </thead>
	
	 
	  </table>
	  <div class="form-group" id="bookForm">
	  
	  <table class="table table-bordered"> 
	   
	   <tbody>
	
				 
				
				 <tr >
				 <%
				 for(int i=0; i<size;i++)
				 {
				 %>
				<td>				
				 <input type="text" class="form-control" name="book[0].field" placeholder="Field" />
				</td>
				<% 
				 }
				%> 
				 </tr>
				</tbody>
				</table>
			</div>
				
				<div class="form-group hide" id="bookTemplate">
				 
				<table class="table table-bordered">
			
				 <tr >
				 <%
				 for(int i=0; i<size;i++)
				 {
				 %>
				 <input type="text" class="form-control" name="field" placeholder="Field" /> 
				
				<% 
				 }
				%> 
				 </tr>
				
			</tbody>
			</table>
			 </div>
			</div>

			<div class="form-group">
			
				
				<div class="col-xs-1">
			    <button type="button" class="btn btn-default addButton"><i class="fa fa-plus">+</i></button>
			    </div>
			    <div class="col-xs-1">
				<button type="button" class="btn btn-default removeButton"><i class="fa fa-minus">-</i></button>
				</div>
				<div class="col-xs-5 col-xs-offset-1">
				<input type="submit" class="btn btn-default" value="Submit"/>
				</div>
			
			</div>
			</form>
			</div>
	
    </div>
</div>    	
<script>
$(document).ready(function() {
         var fieldValidators = {
            row: '.col-xs-3',   
            validators: {
                notEmpty: {
                    message: 'The field is required'
                }
            }
        },
        dataValidators = {
            row: '.col-xs-3',
            validators: {
                notEmpty: {
                    message: 'The datatype is required'
                },
              
            }
        },
        lengthValidators = {
            row: '.col-xs-2',
            validators: {
                notEmpty: {
                    message: 'The length is required'
                },
                numeric: {
                    message: 'The length must be a numeric number'
                }
            }
        },
        bookIndex = 0;

    $('#bookForm')
        .bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                  valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	tableName: {
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The table Name is required and cannot be empty'
                        },
                        stringLength: {
                            min: 3,
                            max: 20,
                            message: 'The username must be more than 3 and less than 20 characters long'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: 'The table name can only consist of alphabetical, number, dot and underscore'
                        }
                    }
            	},
                'book[0].field': fieldValidators,
                'book[0].data': dataValidators,
                'book[0].length': lengthValidators,
                
            }
        })

        
        .on('click', '.addButton', function() {
            bookIndex++;
            var $template = $('#bookTemplate'),
                $clone    = $template
                                .clone()
                                .removeClass('hide')
                                .removeAttr('id')
                                .attr('data-book-index', bookIndex)
                                .insertBefore($template);

           
            $clone
                .find('[name="field"]').attr('name', 'book[' + bookIndex + '].field').end()
                .find('[name="data"]').attr('name', 'book[' + bookIndex + '].data').end()
                .find('[name="length"]').attr('name', 'book[' + bookIndex + '].length').end();

            
            $('#bookForm')
                .bootstrapValidator('addField', 'book[' + bookIndex + '].field', fieldValidators)
                .bootstrapValidator('addField', 'book[' + bookIndex + '].data', dataValidators)
                .bootstrapValidator('addField', 'book[' + bookIndex + '].length', lengthValidators);
        })

        
        .on('click', '.removeButton', function() {
            var $row  = $(this).parents('.form-group'),
                index = $row.attr('data-book-index');

            $('#bookForm')
                .bootstrapValidator('removeField', $row.find('[name="book[' + index + '].field"]'))
                .bootstrapValidator('removeField', $row.find('[name="book[' + index + '].data"]'))
                .bootstrapValidator('removeField', $row.find('[name="book[' + index + '].length"]'));

            
            $row.remove();
            
          
            
        });

    
});

</script>
</body>
</html>