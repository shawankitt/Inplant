<%-- 
    Document   : login
    Created on : 29 Mar, 2015, 6:27:53 PM
    Author     : rahul
--%>

<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        
        <div id="top"><jsp:include page="Menu.jsp"/></div>
       <%
            Map sesion = (Map)ActionContext.getContext().getSession();
            hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
       %>
       <script>
           function permission(name, bool)
           {
               document.getElementById(name).value=bool;document.getElementById(name).value=bool;
           }
           function useraction()
           {
               var pwd = document.getElementById("pwd").value;
            var pwd2 = document.getElementById("pwd2").value;
            if(pwd != pwd2)
            {
                alert("passwaords dont match");
                return;
            }
            document.user.submit();
           }
       </script>
       <form name="user" action="insertuser">
           <input type="hidden" name="Id" value="<% out.print(user.getTblPlant().getIPlantId().toString()); %>">
           Username  :<input type="text" name="SUsername" value=""/><br>
           Password  : <input type="password" id="pwd" name="SPassword" value="" /> <br>
           Conform Password  : <input type="password" id="pwd2" name="cSPassword" value="" /> <br>
           Permissions : <br>
            Remove Trip :   <input type="radio" name="1" value="Yes" onClick="permission('BRemoveTrip' ,1)" />Yes
                            <input type="radio" name="1" value="No" checked  onClick="permission('BRemoveTrip' ,0)"/>No
                            <input type="hidden" name="BRemoveTrip" id="BRemoveTrip" value="0">
                            <br>
            View Trip :     <input type="radio" name="2" value="Yes" onClick="permission('BViewTrip' ,1)" />Yes
                            <input type="radio" name="2" value="No" checked  onClick="permission('BViewTrip' ,0)"/>No
                            <input type="hidden" name="BViewTrip" id="BViewTrip" value="0">
                            <br>
            Add Trip :     <input type="radio" name="3" value="Yes" onClick="permission('BAddTrip' ,1)" />Yes
                            <input type="radio" name="3" value="No" checked  onClick="permission('BAddTrip' ,0)"/>No
                            <input type="hidden" name="BAddTrip" id="BAddTrip" value="0">
                            <br>
            Add User :      <input type="radio" name="4" value="Yes" onClick="permission('BAddUser' ,1)" />Yes
                            <input type="radio" name="4" value="No" checked  onClick="permission('BAddUser' ,0)"/>No
                            <input type="hidden" name="BAddUser" id="BAddUser" value="0">
                            <br>
            Modify User :     <input type="radio" name="5" value="Yes" onClick="permission('BModifyUser' ,1)" />Yes
                            <input type="radio" name="5" value="No" checked  onClick="permission('BModifyUser' ,0)"/>No
                            <input type="hidden" name="BModifyUser" id="BModifyUser" value="0">
                            <br>
            Add Vehicle :     <input type="radio" name="6" value="Yes" onClick="permission('BAddVehicle' ,1)" />Yes
                            <input type="radio" name="6" value="No" checked  onClick="permission('BAddVehicle' ,0)"/>No
                            <input type="hidden" name="BAddVehicle" id="BAddVehicle" value="0">
                            <br>
            Modify Vehicle :     <input type="radio" name="7" value="Yes" onClick="permission('BModifyVehicle' ,1)" />Yes
                            <input type="radio" name="7" value="No" checked  onClick="permission('BModifyVehicle' ,0)"/>No
                            <input type="hidden" name="BModifyVehicle" id="BModifyVehicle" value="0">
                            <br>
            Add Driver :     <input type="radio" name="8" value="Yes" onClick="permission('BAddDriver' ,1)" />Yes
                            <input type="radio" name="8" value="No" checked  onClick="permission('BAddDriver' ,0)"/>No
                            <input type="hidden" name="BAddDriver" id="BAddDriver" value="0">
                            <br>
            Modify Driver :     <input type="radio" name="9" value="Yes" onClick="permission('BModifyDriver' ,1)" />Yes
                            <input type="radio" name="9" value="No" checked  onClick="permission('BModifyDriver' ,0)"/>No
                            <input type="hidden" name="BModifyDriver" id="BModifyDriver" value="0">
                            <br>
            Setup New Plant :     <input type="radio" name="10" value="Yes" onClick="permission('BSetupNewPlant' ,1)" />Yes
                            <input type="radio" name="10" value="No" checked  onClick="permission('BSetupNewPlant' ,0)"/>No
                            <input type="hidden" name="BSetupNewPlant" id="BSetupNewPlant" value="0">
                            <br>
            Change current Plant :     <input type="radio" name="10" value="Yes" onClick="permission('BChangeCurrentPlant' ,1)" />Yes
                            <input type="radio" name="10" value="No" checked  onClick="permission('BChangeCurrentPlant' ,0)"/>No
                            <input type="hidden" name="BChangeCurrentPlant" id="BChangeCurrentPlant" value="0">
                            <br>
            Plant Modify :     <input type="radio" name="11" value="Yes" onClick="permission('BPlantModify' ,1)" />Yes
                            <input type="radio" name="11" value="No" checked  onClick="permission('BPlantModify' ,0)"/>No
                            <input type="hidden" name="BPlantModify" id="BPlantModify" value="0">
                            <br>
            View Exception :     <input type="radio" name="12" value="Yes" onClick="permission('BViewException' ,1)" />Yes
                            <input type="radio" name="12" value="No" checked  onClick="permission('BViewException' ,0)"/>No
                            <input type="hidden" name="BViewException" id="BViewException" value="0">
                            <br>
            End Exception :     <input type="radio" name="13" value="Yes" onClick="permission('BEndException' ,1)" />Yes
                            <input type="radio" name="13" value="No" checked  onClick="permission('BEndException' ,0)"/>No
                            <input type="hidden" name="BEndException" id="BEndException" value="0">
                            <br>
            View Plant History :     <input type="radio" name="14" value="Yes" onClick="permission('BViewHistory' ,1)" />Yes
                            <input type="radio" name="14" value="No" checked  onClick="permission('BViewHistory' ,0)"/>No
                            <input type="hidden" name="BViewHistory" id="BViewHistory" value="0">
                            <br>
            Node View :     <input type="radio" name="15" value="Yes" onClick="permission('BNodeView' ,1)" />Yes
                            <input type="radio" name="15" value="No" checked  onClick="permission('BNodeView' ,0)"/>No
                            <input type="hidden" name="BNodeView" id="BNodeView" value="0">
                            <br>
            View DO :     <input type="radio" name="16" value="Yes" onClick="permission('BViewDo' ,1)" />Yes
                            <input type="radio" name="16" value="No" checked  onClick="permission('BViewDo' ,0)"/>No
                            <input type="hidden" name="BViewDo" id="BViewDo" value="0">
                            <br>
            Logged In :     <input type="radio" name="17" value="Yes" onClick="permission('BLoggedIn' ,1)" />Yes
                            <input type="radio" name="17" value="No" checked  onClick="permission('BLoggedIn' ,0)"/>No
                            <input type="hidden" name="BLoggedIn" id="BLoggedIn" value="0">
                            <br>
            <input type="button" value="Add User" onClick = "useraction()" />

       </form>
    </body>
    
</html>
