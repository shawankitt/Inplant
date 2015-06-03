<%-- 
    Document   : process
    Created on : Jun 1, 2015, 10:22:25 AM
    Author     : Raj-HP
--%>

<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Process</h1>
        
        <script>
            function processaction(button)
            {
                var a = document.forms["Process"]["processname"].value;
                if(a == "")
                {
                    alert("Enter Process Name.");
                    return;
                }
                
                if(button.id === "add")
                    document.Process.action="insertprocess";
                else if(button.id === "next")
                    document.Process.action="insertprocessnext";  
                document.Process.submit();
            }
        </script>
        <form name="Process" action="" method="post">
            <input  type="hidden" name="Id" value="17"/>
            Process Name : <input type="text" name="processname" />
            <input type="button" name="add" id="add" value="Add More Process" onClick = "processaction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "processaction(this)" />
        </form>
    </body>
</html>
