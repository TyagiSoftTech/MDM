<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Username Availability</title>
        <style type="text/css">
            .flable{
                color:gray;
            }
            .status{
                font-family:verdana;
                font-size:12px;
            }
            .uname{
                color:blue;
            }
        </style>
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".uname").change(function(){
                    var uname = $(this).val();
                    if(uname.length > 3){
                        $(".status").html("<img src='images/loading.gif'><font color=gray> Checking availability...</font>");
                         $.ajax({
                            type: "POST",
                            url: "Check",
                            data: "uname="+ uname,
                            success: function(msg){

                                $(".status").ajaxComplete(function(event, request, settings){
                                     
                                    $(".status").html(msg);

                                });
                            }
                        }); 
                    }
                    else{
                         
                        $(".status").html("<font color=red>username shold be <b>3</b> chars</font>");
                    }
                    
                });
            });
        </script>
</head>
<body>

<div>
            <label class="flable">user name :</label>
            <input type="text" class="uname"/>&nbsp;<span class="status"></span>
        </div>

</body>
</html>