<%-- 
    Document   : epos
    Created on : Apr 5, 2015, 12:23:29 PM
    Author     : Raj-HP
    17251
--%>

<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        
        <title>Epos</title>
    </head>

    <script>
        var i;
        function timestamp()
        {
            document.getElementById("time").style.display = "block";
            document.getElementById("timestamp").style.display = "block";
            document.getElementById("Bothway").value = "1";
        }
        function eposaction(button)
        {
            var number = /^\d+$/;
            var a = document.forms["epos"]["ITerminalId"].value;
            if (!number.test(a))
            {
                alert("Terminal Id : Expected Integer");
                return;
            }
            var b = document.forms["epos"]["IMachineId"].value;
            if (!number.test(b))
            {
                alert("Machine Id : Expected Integer");
                return;
            }
            var c = document.forms["epos"]["IGateNo"].value;
            if (!number.test(c))
            {
                alert("Gate No : Expected Integer");
                return;
            }
            if (button.id === "add")
                document.epos.action = "insertepos";
            else if (button.id === "next")
                document.epos.action = "inserteposnext";
            document.epos.submit();
        }
    </script>
    <%
        ValueStack s = ActionContext.getContext().getValueStack();
        TblPlant plant = (TblPlant) s.findValue("current_session");
    %>
    <div class="container">
        <div class="row">
            <div class="jumbotron">
                <h1>Epos</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4 jumbotron"> 
                <form name="epos" action="" method="post">
                    <input  type="hidden" name="IPlantId" value="<% out.print(plant.getIPlantId().toString());%>"/>
                    <div class="form-group">
                        <label>Terminal Id:</label>  
                        <input type="text" class="form-control" name="ITerminalId"/><br>
                        <label>Machine Id: </label> 
                        <input type="text" class="form-control" name="IMachineId"/><br>
                        <label>Gate Number:  </label>
                        <input type="text" class="form-control" name="IGateNo"/><br>
                        <label>Gateway Name: </label>
                        <input type="text" class="form-control" name="TGatewayName"/><br>
                        <label>Location:    </label>
                        <input type="text" class="form-control" name="TLocation"/><br>
                        <label>Function:	</label>  
                        <input type="radio" class="radio" name="BBothways" value="single" checked />Single Way<br>
                        <input type="radio" class="radio" name="BBothways" value="bothway" onClick="timestamp()" />Bothway<br>
                        <input type="hidden" name="Bothway" id="Bothway" value="0">
                        <label id="timestamp" style="display:none;">Timestamp:</label>
                        
                        <input type="text" class="form-control" id="time" name="ITimeInBetween" value="0" style="display:none;" />
                        
                        <input type="button" class="btn btn-info btn-lg col-sm-12" name="add" id="add" value="Add More Epos" onClick = "eposaction(this)" />
                        <input type="button" class="btn btn-success btn-lg col-sm-12" name="next" id="next" value="Submit And Next Page" onClick = "eposaction(this)" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</html>
