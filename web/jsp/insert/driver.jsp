<%-- 
    Document   : vehicle
    Created on : Apr 18, 2015, 10:13:20 AM
    Author     : Raj-HP
--%>

<%@page import="EditTransporter.TransporterList"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.helper.Transporter_handler"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Driver</title>
    </head>
    <body>
        <h1>Driver</h1>
        <script>
            function driveraction(button)
            {
                if(button.id === "add")
                {
                    document.vehicle.action="insertdriver";
                    var dropdown=document.getElementById("Transporter");
                    document.getElementById("TOwner").value=dropdown.value;
                }
                else if(button.id === "next")
                {
                    document.vehicle.action="insertdrivernext";
                    var dropdown=document.getElementById("Transporter");
                    document.getElementById("TOwner").value=dropdown.value;
                }
                document.vehicle.submit();
            }
	</script>
        <%
            ValueStack s = ActionContext.getContext().getValueStack();
            TblPlant plant = (TblPlant)s.findValue("current_session");
        %>
        <pre>
        <form name="vehicle" action="" method="post">
            <input type="hidden" name="Id" value="<% out.print( plant.getIPlantId().toString() ); %>" ><br>
            Driver Name:   <input type="text" name="TDriverName"/><br>
            Driver Address 1: <input type="text" name="TDriverAddr1"/><br>
            Driver Address 2: <input type="text" name="TDriverAddr2"/><br>
            Driver City:   <input type="text" name="TDriverCity"/><br>
            State Id:   <input type="text" name="TStateId"/><br>
            Driver Pin:   <input type="text" name="IDriverPin"/><br>
            Country Id:   <input type="text" name="TCountryId"/><br>
            Driver Email Id:   <input type="text" name="TDriverEmailId"/><br>
            Licence No:   <input type="text" name="TLicenceNo"/><br>
            License Expiry Date: <input type="date" name="dtLicenseExpiryDate"/><br>
            <input type="hidden" name="TOwner" id="TOwner" value="" >
        </form>
        <select id="Transporter" >
            <%
                out.println("<option>Choose Transporter</option>");
                TransporterList t=new TransporterList();
                List<hibernate.pojo.TblTransporter> transporterList=t.getTransporterList(plant.getIPlantId().toString());
                for(int i = 0; i < transporterList.size(); i++)
                    out.println("<option value=\""+transporterList.get(i).getITransporterId()+"\">"+ transporterList.get(i).getTTransporterName() +"</option>");
            %>
        </select>
        <form>
            <input type="button" name="add" id="add" value="Add More Driver" onClick = "driveraction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "driveraction(this)" />
        </form>
        </pre>
    </body>
</html>
