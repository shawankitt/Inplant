<%-- 
    Document   : TripManagement
    Created on : 30 Mar, 2015, 12:05:32 AM
    Author     : rahul
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Trip</title>
    </head>
    <body>
        <%
       Map sesion = (Map)ActionContext.getContext().getSession();
       hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
       out.print("***"+user.getSUsername()+"***"+" in "+request.getRequestURI());
       %>
    </body>
</html>
