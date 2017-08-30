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

<div class="main">
<%@include file="Header.jsp" %>
<div class="container">

    <div class="row">
      <section>
        <div class="col-lg-8 col-lg-offset-2">
        
            <div class="page-header">
                <h2>Registration</h2>
            </div>

            <form action="RegistrationSevlet" id="defaultForm" method="post" class="form-horizontal" >
                <div class="form-group" id="CheckUsername">
                    <label class="col-lg-3 control-label">Username</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" name="username" /><span class="status"></span>
                    </div>
                     <div class="progress" id="progressBar" style="margin: 5px 0 0 0; display: none;">
                         <div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 100%"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">First Name </label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" name="firstName" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Last Name </label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" name="lastName" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Email </label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" name="email" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Password</label>
                    <div class="col-lg-5">
                        <input type="password" class="form-control" name="password" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-9 col-lg-offset-3">
                        <input type="submit" class="btn btn-default" value="SignUp"/>
                    </div>
                </div>
            </form>
        </div>
        </section>
    </div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $('#defaultForm')
        .bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                   threshold: 6,
                   message: 'The username is not valid',
                    validators: {
                    	
                        notEmpty: {
                            message: 'The username is required and can\'t be empty',
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: 'The username must be more than 6 and less than 20 characters long',
                        },

                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: 'The username can only consist of alphabetical, number, dot and underscore',
                        },
                         /*  remote: {
                        	type: "POST",
                            url: 'Check',
                            delay:1000,
                            message: 'The username is not available',
                            
                        },   */
                    }
                },
                firstName: {
                    validators: {
                        notEmpty: {
                            message: 'The first name is required and cannot be empty'
                        }
                    }
                },
                lastName: {
                    validators: {
                        notEmpty: {
                            message: 'The last name is required and cannot be empty'
                        }
                    }
                },
           
                email: {
                    validators: {
                        notEmpty: {
                            message: 'The email is required and can\'t be empty'
                        },
                        emailAddress:{
                            message: 'The input is not a valid '
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and can\'t be empty'
                        }
                    }
                }
            }
        })
    /*     .on('status.field.fv', function(e, data) {
        if (data.field === 'username') {        // Change “username” to your field name
            (data.status === 'VALIDATING')
                ? $('#progressBar').show()      // Show the progress bar while we are validating
                : $('#progressBar').hide();     // Otherwise, hide it
        }
    }) */
       /* .on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

             //Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
               console.log(result);
            }, 'json'); 
        }); */
});
</script>
<!-- <script type="text/javascript">
$(document).ready(function()
{
$(".username").change(function()
{
var username = $(this).val();
if(username.length > 3)
{
$(".status").html("Checking availability...");
$.ajax
({
type: "POST",
url: "RegitrationServlet",
data: "username="+ username,
success: function(msg)
{
	$(".status").ajaxComplete(function(event, request, settings)
{
$(".status").html(msg);
});
}
}); 
}

else
{
$(".status").html("username shold be 3 chars");
}

});
});
</script> -->
</body>
</html>