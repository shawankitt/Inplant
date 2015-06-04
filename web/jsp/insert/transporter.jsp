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
                        <input type="text" class="form-control" name="TTransporterName"/>
                        <label>Mobile: </label>
                        <input type="text" class="form-control" name="TTransporterMobileNo"/>
                        <label>Address:</label>
                        <input type="text" class="form-control" name="TTransporterAddr"/>
                        <label>City:  </label> 
                        <input type="text" class="form-control" name="TTransporterCity"/>
                        <label>State:  </label>
                        <input type="text" class="form-control" name="TTransporterState"/>
                        <label>Pin:    </label>
                        <input type="text" class="form-control" name="ITransporterPin"/>
                        <label>Email:  </label>
                        <input type="text" class="form-control" name="TTransporterEmailId"/>
                        <label>Username: </label>
                        <input type="text" class="form-control" name="SUsername">
                        <label>Password: </label>
                        <input type="password" class="form-control" name="SPassword">
                        <input type="button" name="add" class="btn btn-info col-sm-12" id="add" value="Add More Transporter" onClick = "transporteraction(this)" />
                        <input type="button" name="next" id="next" class="btn btn-success col-sm-12" value="Submit And Next Page" onClick = "transporteraction(this)" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
