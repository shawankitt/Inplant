<%-- 
    Document   : card
    Created on : May 29, 2015, 11:43:06 AM
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
        <title>Card</title>
        
    </head>
    <body>
        <script>
            function cardaction(button)
            {
                var a = document.forms["card"]["cardid"].value;
                if(a == "")
                {
                    alert("Enter Card Id ");
                    return;
                }
                
                if(button.id === "add")
                    document.card.action="insertcard";
                else if(button.id === "next")
                    document.card.action="insertcardnext";  
                document.card.submit();
            }
        </script>
        <%
            ValueStack s = ActionContext.getContext().getValueStack();
            TblPlant plant = (TblPlant)s.findValue("current_session");
        %>
        <h1>Card</h1>
        <form name="card" action="">
            <input  type="hidden" name="Id" value="<% out.print( plant.getIPlantId().toString() ); %>"/>
            Card Id : <input type="text" name="cardid" id="cardid"/><br>
            <input type="button" name="add" id="add" value="Add More Card" onClick = "cardaction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "cardaction(this)" />
        </form>
    </body>
</html>
