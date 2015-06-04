<%-- 
    Document   : login
    Created on : 29 Mar, 2015, 6:27:53 PM
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="plant" scope="page" class="hibernate.helper.InsertPlant" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        
    </head>
    <div class="container">
        <div class="jumbotron">
            <div class="h1">Login Here</div>
        </div>
        <br><br><br>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">    
                <div class="jumbotron" style="background: background">
                    <form role="form" action="userLogin" method="post">
                        <div class="form-group">
                            <label for="text">Enter Username</label>
                            <input type="text" class="form-control" name="loginName" id="text"/>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Enter Password</label>
                            <input type="password" class="form-control" name="password" /> <!-- members of same name must exist in corresponding action class so that their value is automatically set-->
                        </div>

                            <input class="btn btn-success" type="submit" value="Login"/>
                            <b>OR</b>
                            <!--<a href="jsp/insert/index.jsp" style="color:black">Or register Here</a>-->
                            <input class="btn btn-success" type="button" value="Rgister Here" onclick="window.location='jsp/insert/index.jsp'"/>
                    </form>
                    <br>
                    <!--<a href="jsp/insert/index.jsp">Or register Here</a>-->
                </div>
            </div>    
        </div>
    </div>
</html>
