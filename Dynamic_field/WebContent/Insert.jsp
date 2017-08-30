<%@page import="java.util.*" %>
<%@page import="com.bean.TableList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" href="css/bootstrap.css"/>
 <link rel="stylesheet" href="css/bootstrapValidator.css"/>
<% ArrayList table_list1 =(ArrayList)request.getSession().getAttribute("Table_list");%>

<% String un=(String)request.getSession().getAttribute("username"); %>
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
		
       <%--   <%if(un!=null)
                	 {
                	 %>
                	 <h4>Welcome <%=un %></h4>
                	 <%}
         else
         {%>
        	<h4>Welcome Guest</h4>
         <% }
         %>
          <h2>Table List</h2>   --%>    	 
   </div>
    </div>
     <div id="main">
    <div id="content">
        <section>
            <div class="container">
                <h3>Table list</h3>
              <p></p>
		
<% if(table_list1!=null && table_list1.size()!=0)
{
	for(int i=0; i<table_list1.size();i++)
	{
		TableList tl=(TableList)table_list1.get(i);
		String name=tl.getName();
		%>
<a href="InsertServlet?name=<%=name%>"><% out.println("» "+name);%></a><br />
<%		
	} 
}
else{
	
	out.println("Repository not avialable");
}
%>		
   
            </div>
        </section>
   </div>
   </div>  

		    
</div>
</div>
</body>
</html>