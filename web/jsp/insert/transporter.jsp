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
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/placeholder.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <title>Transporter</title>
        <script>
            function transporteraction(button)
            {
                if (button.id === "add")
                    document.transporter.action = "inserttransporter";
                else if (button.id === "next")
                    document.transporter.action = "inserttransporternext";
                document.transporter.submit();
            }
        </script>
        <%
            ValueStack s = ActionContext.getContext().getValueStack();
            TblPlant plant = (TblPlant) s.findValue("current_session");
        %>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h1>Transporter</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 jumbotron"> 
                    <h4> Add a new transporter and register him </h4>
                    <form name="transporter" action="" method="post">
                        <div class="form-group">
                        <input type="hidden" name="Id" value="<% out.print(plant.getIPlantId().toString());%>" ><br>
                        <label>Name:  </label> 
                        <input type="text" class="form-control" name="TTransporterName" placeholder='Enter Transporter Name' onfocus="hide(this)" onblur="show(this, 'Enter Transporter Name')"/><br>
                        <label>Mobile: </label>
                        <input type="text" class="form-control" name="TTransporterMobileNo" placeholder="Enter Mobile No" onfocus="hide(this)" onblur="show(this, 'Enter Mobile No')"/><br>
                        <label>Address:</label>
                        <input type="text" class="form-control" name="TTransporterAddr" placeholder="Enter Address" onfocus="hide(this)" onblur="show(this, 'Enter Address')"/><br>
                        <label>City:  </label> 
                        <input type="text" class="form-control" name="TTransporterCity" placeholder="Enter City" onfocus="hide(this)" onblur="show(this, 'Enter City')"/><br>
                        <label>State:  </label>
                        <input type="text" class="form-control" name="TTransporterState" placeholder="Enter State" onfocus="hide(this)" onblur="show(this, 'Enter State')"/><br>
                        <label>Pin:    </label>
                        <input type="text" class="form-control" name="ITransporterPin" placeholder="Enter Transporter Pin" onfocus="hide(this)" onblur="show(this, 'Enter Transporter Pin')"/><br>
                        <label>Email:  </label>
                        <input type="text" class="form-control" name="TTransporterEmailId" placeholder="Enter Email Id" onfocus="hide(this)" onblur="show(this, 'Enter Email Id')"/><br>
                        <label>Username: </label>
                        <input type="text" class="form-control" name="SUsername" placeholder="Enter Username" onfocus="hide(this)" onblur="show(this, 'Enter Username')">
                        <label>Password: </label>
                        <input type="password" class="form-control" name="SPassword" placeholder="Enter Password" onfocus="hide(this)" onblur="show(this, 'Enter password')">
                        <input type="button" name="add" class="btn btn-info col-sm-12" id="add" value="Add More Transporter" onClick = "transporteraction(this)" />
                        <input type="button" name="next" id="next" class="btn btn-success col-sm-12" value="Submit And Next Page" onClick = "transporteraction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
