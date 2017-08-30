<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="css/header.css"/>
    <script type="text/javascript" src="js/header.js"></script>
    <script type="text/javascript" src="js/header2.js"></script>
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
 <% String user=(String)request.getSession().getAttribute("username"); %>
</head>
<body>

<div id="wrapper">

<header>
    <div class="container clearfix">
        <h1 id="logo">
            ON-DB
        </h1>
        <nav>
            <a href="Home.jsp">Home</a>
            <a href="#">Services</a>
            
                     <%if(user!=null)
                	 {
                	 %>
                	<%--  <h4>Welcome <%=user %></h4> --%>
                	 <a href="Logout.jsp">Logout</a>
                	 
                	 <%}
         else
         {%>
        	<!-- <h4>Welcome Guest</h4> -->
        	<a href="login.jsp">Login/Registration</a>
         <% }
         %>
        </nav>
    </div>
</header><!-- /header -->
</div>
 

</body>
</html>