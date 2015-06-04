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
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/placeholder.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <title>Vehicle</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2>Vehicle</h2>
                </div>
            </div>

            <script>
                function vehicleaction(button)
                {
                    var number = /^\d+$/;
                    var a = document.forms["vehicle"]["ILoadCapacity"].value;
                    if (!number.test(a))
                    {
                        alert("Load capacity : Expected Integer");
                        return;
                    }
                    if (button.id === "add")
                    {
                        document.vehicle.action = "insertvehicle";
                        var dropdown = document.getElementById("Transporter");
                        document.getElementById("TOwner").value = dropdown.value;
                    }
                    else if (button.id === "next")
                    {
                        document.vehicle.action = "insertvehiclenext";
                        var dropdown = document.getElementById("Transporter");
                        document.getElementById("TOwner").value = dropdown.value;
                    }
                    document.vehicle.submit();
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
        <form name="vehicle" action="" method="post">
            <input type="hidden" name="Id" value="<%out.print(plant.getIPlantId().toString());%>" ><br>
            Vehicle Id:  <input type="text" name="vid" placeholder="Enter Vehicle Id" onfocus="hide(this)" onblur="show(this, 'Enter Vehicle Id')" /><br>
            Chasis No:   <input type="text" name="TChasisNo" placeholder="Enter Chasis No" onfocus="hide(this)" onblur="show(this, 'Enter Chasis No')"/><br>
            Vehicle Type: <input type="text" name="TVehicleType" placeholder="Enter Vehicle Type" onfocus="hide(this)" onblur="show(this, 'Enter Vehicle Type')"/><br>
            Loading Capacity: <input type="text" name="ILoadCapacity" placeholder="Enter Load Capacity" onfocus="hide(this)" onblur="show(this, 'Enter Load Capacity')"/><br>
            National Permit:   <input type="text" name="TNationalPermit" placeholder="Enter National Permit No" onfocus="hide(this)" onblur="show(this, 'Enter National Permit No')"/><br>
            License Expiry Date: <input type="date" name="dtLicenseExpiryDate" /><br>
            <input type="hidden" name="TOwner" id="TOwner" value="" >
        </form>
        <select id="Transporter" >
            </script>
            <%
                ValueStack s = ActionContext.getContext().getValueStack();
                TblPlant plant = (TblPlant) s.findValue("current_session");
            %>
        </select>
        <form>
            <input type="button" name="add" id="add" value="Add More Vehicle" onClick = "vehicleaction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "vehicleaction(this)" />
        </form>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    <form name="vehicle" action="" method="post">
                        <div class="form-group">
                            <input type="hidden" name="Id" value="<%out.print(plant.getIPlantId().toString());%>" ><br>
                            <label>Vehicle Id:  </label>
                            <input type="text" class="form-control" name="vid" />
                            <label>Chasis No:  </label>
                            <input type="text" class="form-control" name="TChasisNo"/>
                            <label>Vehicle Type: </label>
                            <input type="text" class="form-control" name="TVehicleType"/>
                            <label>Loading Capacity: </label>
                            <input type="text" class="form-control" name="ILoadCapacity"/>
                            <label>National Permit:   </label>
                            <input type="text" class="form-control" name="TNationalPermit"/>
                            <label>License Expiry Date: </label>
                            <input type="date" class="form-control" name="dtLicenseExpiryDate"/>
                            <input type="hidden" name="TOwner" id="TOwner" value="" >
                        </div>
                    </form>
                    <div class="form-group">
                        <select class="form-control" id="Transporter" >
                            <%
                                out.println("<option>Choose Transporter</option>");
                                TransporterList t = new TransporterList();
                                List<hibernate.pojo.TblTransporter> transporterList = t.getTransporterList(plant.getIPlantId().toString());
                                for (int i = 0; i < transporterList.size(); i++) {
                                    out.println("<option value=\"" + transporterList.get(i).getITransporterId() + "\">" + transporterList.get(i).getTTransporterName() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <form>
                        <div class="form-group">
                            <input type="button" class="btn btn-info col-sm-12" name="add" id="add" value="Add More Vehicle" onClick = "vehicleaction(this)" />
                            <input type="button" class="btn btn-success col-sm-12" name="next" id="next" value="Submit And Next Page" onClick = "vehicleaction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
