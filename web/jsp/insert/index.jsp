<%-- 
    Document   : index
    Created on : Apr 4, 2015, 2:57:51 PM
    Author     : Raj-HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/placeholder.js" type="text/javascript"></script>
        <title>Plant Registration</title>
        <script>
        function insertaction()
        {
            var pwd = document.getElementById("pwd").value;
            var pwd2 = document.getElementById("pwd2").value;
            /*if(pwd != pwd2)
            {
                alert("passwords dont match");
                return;
            }*/
            if(pwd != pwd2)
            {
                document.getElementById("error").style.display="inline";
                return;
            }
            else
                document.getElementById("error").style.display="none";
            document.registration.submit();
        }
        
        </script> 
    </head>
    
    <body>
            <h2 style="text-align:center">Plant Registration</h2>
                <form name="registration" action="insertplant" method="post">
                    Plant Name:<input type="text" name="TPlantName" value=""  placeholder="Enter plant name" onfocus="hide(this)" onblur="show(this, 'Enter plant name')"/><br>
                    Plant Owner:<input type="text" name="TPlantOwner" value=""  placeholder="Enter plant owner" onfocus="hide(this)" onblur="show(this, 'Enter plant owner')"/><br>
                    Username  :<input type="text" name="username" value=""  placeholder="Enter username" onfocus="hide(this)" onblur="show(this, 'Enter username')"/><br>
                    Password  : <input type="password" id="pwd" name="password" value=""  placeholder="Enter password" onfocus="hide(this)" onblur="show(this, 'Enter password')"/> <br>
                    Confirm Password  : <input type="password" id="pwd2" name="cpassword" value=""  placeholder="Confirm password" onfocus="hide(this)" onblur="show(this, 'Confirm Password')"/> <br>
                    <p id="error" style="display:none">not matching</p>
                    <input type="button" value="Submit" onClick = "insertaction()" />
                </form>
    </body>
</html>
