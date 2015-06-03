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
        <title>Plant Registration</title>
        <script>
        function insertaction()
        {
            var pwd = document.getElementById("pwd").value;
            var pwd2 = document.getElementById("pwd2").value;
            if(pwd != pwd2)
            {
                alert("passwaords dont match");
                return;
            }
            document.registration.submit();
        }
        
        </script>    
    </head>
    
    <body>
        <h1>Plant Registration</h1>
        <form name="registration" action="insertplant" method="post">
            Plant Name:<input type="text" name="TPlantName" value="" /><br>
            Plant Owner:<input type="text" name="TPlantOwner" value="" /><br>
            Username  :<input type="text" name="username" value=""/><br>
            Password  : <input type="password" id="pwd" name="password" value="" /> <br>
            Confirm Password  : <input type="password" id="pwd2" name="cpassword" value="" /> <br>
            <input type="button" value="Submit" onClick = "insertaction()" />
        </form>
    </body>
</html>
