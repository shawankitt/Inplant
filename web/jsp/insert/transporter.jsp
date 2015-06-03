<%-- 
    Document   : transporter
    Created on : 5 Apr, 2015, 12:09:25 PM
    Author     : Ankit
--%>

<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transporter</title>
        <script>
            function transporteraction(button)
            {
                if(button.id === "add")
                    document.transporter.action="inserttransporter";
                else if(button.id === "next")
                    document.transporter.action="inserttransporternext";  
                document.transporter.submit();
            }
	</script>
        <%
            ValueStack s = ActionContext.getContext().getValueStack();
            TblPlant plant = (TblPlant)s.findValue("current_session");
        %>
    </head>
    <body>
        <h1>Transporter</h1>
        <pre>
        <form name="transporter" action="">
            <input type="hidden" name="Id" value="<% out.print( plant.getIPlantId().toString() ); %>" ><br>
            Name:   <input type="text" name="TTransporterName"/><br>
            Mobile: <input type="text" name="TTransporterMobileNo"/><br>
            Address:<input type="text" name="TTransporterAddr"/><br>
            City:   <input type="text" name="TTransporterCity"/><br>
            State:  <input type="text" name="TTransporterState"/><br>
            Pin:    <input type="text" name="ITransporterPin"/><br>
            Email:  <input type="text" name="TTransporterEmailId"/><br>
            Username: <input type="text" name="SUsername">
            Password: <input type="text" name="SPassword">
            <input type="button" name="add" id="add" value="Add More Transporter" onClick = "transporteraction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "transporteraction(this)" />
        </form>
        </pre>
    </body>
</html>
