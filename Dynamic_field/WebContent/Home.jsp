<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/bootstrap.css"/>
 <link rel="stylesheet" href="css/bootstrapValidator.css"/>

<% String un=(String)request.getSession().getAttribute("username"); %>
</head>
<body>
       <%if(un!=null)
                	 {
                	%>
                	<%@ include file="Nav.jsp" %>
                	<% 
                	 }
         %>
<div class=main> 
<%@include file="Header.jsp" %>     
<div class="container">
  
   <div class="row">
		<div class="page-header">
        <%--  <%if(un!=null)
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
     <div id="main">
    <div id="content">
        <section>
            <div class="container">
                <h1>Header Resize On Scroll with Animations</h1>
                <p>Cupcake ipsum dolor sit amet lollipop. Macaroon candy cotton candy bear claw macaroon carrot cake pastry icing dessert. Cupcake pastry tart sesame snaps lollipop donut pie. Cookie apple pie toffee lemon drops jelly beans cheesecake sweet roll. Jelly-o soufflé donut candy canes wafer dragée sweet cheesecake. Macaroon caramels pie cookie gummi bears. Ice cream jelly-o toffee cookie gingerbread cookie. Soufflé fruitcake jelly-o jelly chupa chups jelly beans. Dragée marzipan pastry macaroon oat cake muffin soufflé topping liquorice. Jelly-o chocolate cake lollipop.</p>
                <p>Sugar plum muffin cookie pastry oat cake icing candy canes chocolate. Gummi bears chupa chups fruitcake dessert jelly. Muffin cookie ice cream soufflé pastry lollipop gingerbread sweet. Unerdwear.com bonbon candy marzipan bonbon gummies chocolate cake gummi bears powder. Unerdwear.com tart halvah chocolate cake dragée liquorice. Sugar plum chocolate bar pastry liquorice dragée jelly powder. Jelly tootsie roll applicake caramels. Marzipan candy tootsie roll donut. Gummies ice cream macaroon applicake.</p>
                <p>
                    <a href="https://www.facebook.com/pratik.chauhan.cp">« Connect With Me | Chauhan PRatik</a><br>
                    <a href="http://bootsnipp.com/cppratikcp">« Go back to all tutorials?</a>
                </p>
            </div>
        </section>
        <section class="color">
            <div class="container">
                <h1>Cupcakes for the people!</h1>
                <p>Cupcake ipsum dolor sit amet lollipop. Macaroon candy cotton candy bear claw macaroon carrot cake pastry icing dessert. Cupcake pastry tart sesame snaps lollipop donut pie. Cookie apple pie toffee lemon drops jelly beans cheesecake sweet roll. Jelly-o soufflé donut candy canes wafer dragée sweet cheesecake. Macaroon caramels pie cookie gummi bears. Ice cream jelly-o toffee cookie gingerbread cookie. Soufflé fruitcake jelly-o jelly chupa chups jelly beans. Dragée marzipan pastry macaroon oat cake muffin soufflé topping liquorice. Jelly-o chocolate cake lollipop.</p>
                <p>Sugar plum muffin cookie pastry oat cake icing candy canes chocolate. Gummi bears chupa chups fruitcake dessert jelly. Muffin cookie ice cream soufflé pastry lollipop gingerbread sweet. Unerdwear.com bonbon candy marzipan bonbon gummies chocolate cake gummi bears powder. Unerdwear.com tart halvah chocolate cake dragée liquorice. Sugar plum chocolate bar pastry liquorice dragée jelly powder. Jelly tootsie roll applicake caramels. Marzipan candy tootsie roll donut. Gummies ice cream macaroon applicake.</p>
            </div>
        </section>
        <section>
            <div class="container">
                <h1>Chocolate, vanilla, and red velvet</h1>
                <p>Cupcake ipsum dolor sit amet lollipop. Macaroon candy cotton candy bear claw macaroon carrot cake pastry icing dessert. Cupcake pastry tart sesame snaps lollipop donut pie. Cookie apple pie toffee lemon drops jelly beans cheesecake sweet roll. Jelly-o soufflé donut candy canes wafer dragée sweet cheesecake. Macaroon caramels pie cookie gummi bears. Ice cream jelly-o toffee cookie gingerbread cookie. Soufflé fruitcake jelly-o jelly chupa chups jelly beans. Dragée marzipan pastry macaroon oat cake muffin soufflé topping liquorice. Jelly-o chocolate cake lollipop.</p>
                <p>Sugar plum muffin cookie pastry oat cake icing candy canes chocolate. Gummi bears chupa chups fruitcake dessert jelly. Muffin cookie ice cream soufflé pastry lollipop gingerbread sweet. Unerdwear.com bonbon candy marzipan bonbon gummies chocolate cake gummi bears powder. Unerdwear.com tart halvah chocolate cake dragée liquorice. Sugar plum chocolate bar pastry liquorice dragée jelly powder. Jelly tootsie roll applicake caramels. Marzipan candy tootsie roll donut. Gummies ice cream macaroon applicake.</p>
            </div>
        </section>
        <section class="color">
            <div class="container">
                <h1>Come to me!</h1>
                <p>Cupcake ipsum dolor sit amet lollipop. Macaroon candy cotton candy bear claw macaroon carrot cake pastry icing dessert. Cupcake pastry tart sesame snaps lollipop donut pie. Cookie apple pie toffee lemon drops jelly beans cheesecake sweet roll. Jelly-o soufflé donut candy canes wafer dragée sweet cheesecake. Macaroon caramels pie cookie gummi bears. Ice cream jelly-o toffee cookie gingerbread cookie. Soufflé fruitcake jelly-o jelly chupa chups jelly beans. Dragée marzipan pastry macaroon oat cake muffin soufflé topping liquorice. Jelly-o chocolate cake lollipop.</p>
                <p>Sugar plum muffin cookie pastry oat cake icing candy canes chocolate. Gummi bears chupa chups fruitcake dessert jelly. Muffin cookie ice cream soufflé pastry lollipop gingerbread sweet. Unerdwear.com bonbon candy marzipan bonbon gummies chocolate cake gummi bears powder. Unerdwear.com tart halvah chocolate cake dragée liquorice. Sugar plum chocolate bar pastry liquorice dragée jelly powder. Jelly tootsie roll applicake caramels. Marzipan candy tootsie roll donut. Gummies ice cream macaroon applicake.</p>
            </div>
        </section>
        <section>
            <div class="container">
                <h1>Sugar rush, oh my...</h1>
                <p>Cupcake ipsum dolor sit amet lollipop. Macaroon candy cotton candy bear claw macaroon carrot cake pastry icing dessert. Cupcake pastry tart sesame snaps lollipop donut pie. Cookie apple pie toffee lemon drops jelly beans cheesecake sweet roll. Jelly-o soufflé donut candy canes wafer dragée sweet cheesecake. Macaroon caramels pie cookie gummi bears. Ice cream jelly-o toffee cookie gingerbread cookie. Soufflé fruitcake jelly-o jelly chupa chups jelly beans. Dragée marzipan pastry macaroon oat cake muffin soufflé topping liquorice. Jelly-o chocolate cake lollipop.</p>
                <p>Sugar plum muffin cookie pastry oat cake icing candy canes chocolate. Gummi bears chupa chups fruitcake dessert jelly. Muffin cookie ice cream soufflé pastry lollipop gingerbread sweet. Unerdwear.com bonbon candy marzipan bonbon gummies chocolate cake gummi bears powder. Unerdwear.com tart halvah chocolate cake dragée liquorice. Sugar plum chocolate bar pastry liquorice dragée jelly powder. Jelly tootsie roll applicake caramels. Marzipan candy tootsie roll donut. Gummies ice cream macaroon applicake.</p>
            </div>
        </section>
    </div>
</div>
    
   
 </div>
</div> 
</body>

</html>