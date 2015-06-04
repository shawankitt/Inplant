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
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
    </head>
    <body>
        <script>
            function cardaction(button)
            {
                var a = document.forms["card"]["cardid"].value;
                if (a == "")
                {
                    alert("Enter Card Id ");
                    return;
                }

                if (button.id === "add")
                    document.card.action = "insertcard";
                else if (button.id === "next")
                    document.card.action = "insertcardnext";
                document.card.submit();
            }
        </script>
        <%
            ValueStack s = ActionContext.getContext().getValueStack();
            TblPlant plant = (TblPlant) s.findValue("current_session");
        %>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2>Card</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    <form role="form" name="card" action="" method="post">
                        
                        <input  type="hidden" name="Id" value="<% out.print(plant.getIPlantId().toString());%>"/>
                        <div class="form-group">
                            <label>Card Id:</label>
                            <input type="text" class="form-control" name="cardid" id="cardid"/><br>
                        </div>
                        
                        <input type="button" class="btn btn-info col-sm-12" name="add" id="add" value="Add More Card" onClick = "cardaction(this)" />
                        <input type="button" class="btn btn-success col-sm-12" name="next" id="next" value="Submit And Next Page" onClick = "cardaction(this)" />
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
