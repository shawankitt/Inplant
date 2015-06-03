<%-- 
    Document   : Logout
    Created on : 8 Apr, 2015, 11:52:57 PM
    Author     : rahul
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
       Map sesion = (Map)ActionContext.getContext().getSession();
       sesion.clear();
       %>
       success!!
    </body>
</html>
