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
    </head>
    <h1>Login:</h1>
    <form action="userLogin" method="post">
        <label for="name">Please enter your login and password</label><br/>
        <input type="text" name="loginName"/>
        <input type="password" name="password"/> <!-- members of same name must exist in corresponding action class so that their value is automatically set-->
        <input type="submit" value="Login"/>
    </form>
    <br>
    <a href="jsp/insert/index.jsp">Or register Here</a>
</html>
