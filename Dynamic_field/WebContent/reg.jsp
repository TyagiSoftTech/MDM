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
</head>
<body>
<div class="container">
    <div class="row">
    <%@include file="Header.jsp" %>
		<div class="page-header">
		<h1>Dynamic Field Create</h1>
		</div>
		<form action="" id="registrationForm" method="post" class="form-horizontal" >
			<div class="form-group">
				<label class="col-xs-1 control-label">Username</label>
				<div class="col-xs-3">
				<input type="text" class="form-control" name="username" placeholder="username" />
				</div>
			</div>	
		    <div class="form-group">
				<label class="col-xs-1 control-label">Email</label>
				<div class="col-xs-3">
				<input type="text" class="form-control" name="email" placeholder="email" />
				</div>
			</div>
			<div class="form-group">	
				<label class="col-xs-1 control-label">Password</label>
				<div class="col-xs-3">
				<input type="text" class="form-control" name="psw" placeholder="password" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-5 col-xs-offset-1">
				<input type="submit" class="btn btn-default" />
				</div>
			</div>
		</form>
	</div>
</div>				
<script>
$(document).ready(function() {
    $('#registrationForm').bootstrapValidator({
        fields: {
            username: {
                message: 'The username is not valid',
                validators: {
                    remote: {
                        url: '/path/to/backend/',
                        data: function(validator) {
                            return {
                                email: validator.getFieldElements('email').val()
                            };
                        },
                        message: 'The username is not available'
                    }
                }
            },
            email: {
                validators: {
                    remote: {
                        url: '/path/to/backend/',
                        data: function(validator) {
                            return {
                                username: validator.getFieldElements('username').val()
                            };
                        },
                        message: 'The email is not available'
                    }
                }
            }
        }
    });
});
</script>

</body>
</html>