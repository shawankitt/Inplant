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
        <script src="../../js/placeholder.js" type="text/javascript"></script>
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
        <form name="transporter" action="" method="post">
            <input type="hidden" name="Id" value="<% out.print( plant.getIPlantId().toString() ); %>" ><br>
            Name:   <input type="text" name="TTransporterName" placeholder='Enter Transporter Name' onfocus="hide(this)" onblur="show(this, 'Enter Transporter Name')"/><br>
            Mobile: <input type="text" name="TTransporterMobileNo" placeholder="Enter Mobile No" onfocus="hide(this)" onblur="show(this, 'Enter Mobile No')"/><br>
            Address:<input type="text" name="TTransporterAddr" placeholder="Enter Address" onfocus="hide(this)" onblur="show(this, 'Enter Address')"/><br>
            City:   <input type="text" name="TTransporterCity" placeholder="Enter City" onfocus="hide(this)" onblur="show(this, 'Enter City')"/><br>
            State:  <input type="text" name="TTransporterState" placeholder="Enter State" onfocus="hide(this)" onblur="show(this, 'Enter State')"/><br>
            Pin:    <input type="text" name="ITransporterPin" placeholder="Enter Transporter Pin" onfocus="hide(this)" onblur="show(this, 'Enter Transporter Pin')"/><br>
            Email:  <input type="text" name="TTransporterEmailId" placeholder="Enter Email Id" onfocus="hide(this)" onblur="show(this, 'Enter Email Id')"/><br>
            Username: <input type="text" name="SUsername" placeholder="Enter Username" onfocus="hide(this)" onblur="show(this, 'Enter Username')">
            Password: <input type="password" name="SPassword" placeholder="Enter Password" onfocus="hide(this)" onblur="show(this, 'Enter password')">
            <input type="button" name="add" id="add" value="Add More Transporter" onClick = "transporteraction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "transporteraction(this)" />
        </form>
    </body>
</html>
