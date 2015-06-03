<%-- 
    Document   : vehicle
    Created on : Apr 18, 2015, 10:13:20 AM
    Author     : Raj-HP
--%>

<%@page import="java.util.List"%>
<%@page import="EditTransporter.TransporterList"%>
<%@page import="hibernate.helper.Transporter_handler"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle</title>
    </head>
    <body>
        <h1>Vehicle</h1>
        <script>
            function vehicleaction(button)
            {
                var number = /^\d+$/;
                var a = document.forms["vehicle"]["ILoadCapacity"].value;
                if(! number.test(a))
                {
                    alert("Expected Time : Expected Integer");
                    return;
                }
                if(button.id === "add")
                {
                    document.vehicle.action="insertvehicle";
                    var dropdown=document.getElementById("Transporter");
                    document.getElementById("TOwner").value=dropdown.value;
                }
                else if(button.id === "next")
                {
                    document.vehicle.action="insertvehiclenext";
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
        <form name="vehicle" action="">
            <input type="hidden" name="Id" value="<%out.print(plant.getIPlantId().toString());%>" ><br>
            Vehicle Id:  <input type="text" name="vid" /><br>
            Chasis No:   <input type="text" name="TChasisNo"/><br>
            Vehicle Type: <input type="text" name="TVehicleType"/><br>
            Loading Capacity: <input type="text" name="ILoadCapacity"/><br>
            National Permit:   <input type="text" name="TNationalPermit"/><br>
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
            <input type="button" name="add" id="add" value="Add More Vehicle" onClick = "vehicleaction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "vehicleaction(this)" />
        </form>
        </pre>
    </body>
</html>
