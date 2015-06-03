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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Epos</title>
    </head>
    
        <script>
            var i;
            function timestamp()
            {
		document.getElementById("time").style.display="block";
		document.getElementById("timestamp").style.display="block";
                document.getElementById("Bothway").value="1";
            }
            function eposaction(button)
            {
                var number = /^\d+$/;
                var a = document.forms["epos"]["ITerminalId"].value;
                if(! number.test(a))
                {
                    alert("Terminal Id : Expected Integer");
                    return;
                }
                var b = document.forms["epos"]["IMachineId"].value;
                if(! number.test(b))
                {
                    alert("Machine Id : Expected Integer");
                    return;
                }
                var c = document.forms["epos"]["IGateNo"].value;
                if(! number.test(c))
                {
                    alert("Gate No : Expected Integer");
                    return;
                }
                if(button.id === "add")
                    document.epos.action="insertepos";
                else if(button.id === "next")
                    document.epos.action="inserteposnext";  
                document.epos.submit();
            }
	</script>
        <%
            ValueStack s = ActionContext.getContext().getValueStack();
            TblPlant plant = (TblPlant)s.findValue("current_session");
        %>
        <h1>Epos</h1>
        <pre>
            <form name="epos" action="" method="post">
                <input  type="hidden" name="IPlantId" value="<% out.print( plant.getIPlantId().toString() ); %>"/>
		Terminal Id:  <input type="text" name="ITerminalId"/><br>
		Machine Id:  <input type="text" name="IMachineId"/><br>
		Gate Number:  <input type="text" name="IGateNo"/><br>
		Gateway Name: <input type="text" name="TGatewayName"/><br>
		Location:    <input type="text" name="TLocation"/><br>
		Function:	  <input type="radio" name="BBothways" value="single" checked />Single Way<br>
			          <input type="radio" name="BBothways" value="bothway" onClick="timestamp()" />Bothway<br>
                                  <input type="hidden" name="Bothway" id="Bothway" value="0">
		<label id="timestamp" style="display:none;">Timestamp:</label>
		<input type="text" id="time" name="ITimeInBetween" value="0" style="display:none;" />
		<input type="button" name="add" id="add" value="Add More Epos" onClick = "eposaction(this)" />
		<input type="button" name="next" id="next" value="Submit And Next Page" onClick = "eposaction(this)" />
            </form>
	</pre>
    
</html>
