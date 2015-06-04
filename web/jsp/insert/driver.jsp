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
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Driver</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h2>Driver</h2>
                </div>
            </div>
            <script>
                function driveraction(button)
                {
                    if (button.id === "add")
                    {
                        document.vehicle.action = "insertdriver";
                        var dropdown = document.getElementById("Transporter");
                        document.getElementById("TOwner").value = dropdown.value;
                    }
                    else if (button.id === "next")
                    {
                        document.vehicle.action = "insertdrivernext";
                        var dropdown = document.getElementById("Transporter");
                        document.getElementById("TOwner").value = dropdown.value;
                    }
                    document.vehicle.submit();
                }
            </script>
            <%
                ValueStack s = ActionContext.getContext().getValueStack();
                TblPlant plant = (TblPlant) s.findValue("current_session");
            %>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    <form role="form" name="vehicle" action="" method="post">
                        <input type="hidden" name="Id" value="<% out.print(plant.getIPlantId().toString()); %>" >
                        <div class="form-group">
                            <label>Driver Name:</label>
                            <input class="form-control" type="text" name="TDriverName"/>
                            <label>Driver Address 1: </label>
                            <input class="form-control" type="text" name="TDriverAddr1"/>
                            <label>Driver Address 2: </label>
                            <input class="form-control" type="text" name="TDriverAddr2"/>
                            <label>Driver City:   </label>
                            <input class="form-control" type="text" name="TDriverCity"/>
                            <label>State Id:   </label>
                            <input type="text" name="TStateId"class="form-control"/>
                            <label>Driver Pin: </label>  
                            <input type="text" name="IDriverPin"class="form-control"/>
                            <label>Country Id:   </label>
                            <input type="text" name="TCountryId" class="form-control"/>
                            <label>Driver Email Id:   </label>
                            <input type="text" name="TDriverEmailId" class="form-control"/>
                            <label>License No:   </label>
                            <input type="text" name="TLicenceNo" class="form-control"/>
                            <label>License Expiry Date: </label>
                            <input type="date" name="dtLicenseExpiryDate" class="form-control"/>
                        </div>
                        <input type="hidden" name="TOwner" id="TOwner" value="" >
                    </form>
                    <select id="Transporter" class="form-control">
                        <%
                            out.println("<option>Choose Transporter</option>");
                            TransporterList t = new TransporterList();
                            List<hibernate.pojo.TblTransporter> transporterList = t.getTransporterList(plant.getIPlantId().toString());
                            for (int i = 0; i < transporterList.size(); i++) {
                                out.println("<option value=\"" + transporterList.get(i).getITransporterId() + "\">" + transporterList.get(i).getTTransporterName() + "</option>");
                            }
                        %>
                    </select>

                    <form role="form">
                        <div class="form-group"
                        <input type="button" class="btn btn-info col-sm-12" name="add" id="add" value="Add More Driver" onClick = "driveraction(this)" />
                        <input type="button"  class="btn btn-success col-sm-12" name="next" id="next" value="Submit And Next Page" onClick = "driveraction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
