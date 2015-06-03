<%-- 
    Document   : getVehicle
    Created on : May 29, 2015, 7:57:43 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String s = request.getParameter("transporterId").toString();
    //String p = request.getParameter("Id").toString();
    
    hibernate.helper.VehicleList v = new hibernate.helper.VehicleList();
    List<hibernate.pojo.TblVehicle> vehicleList=v.getVehicleList(s);
    for(int i = 0; i < vehicleList.size(); i++)
                    out.println("<option value=\""+vehicleList.get(i).getTVehicleId()+"\">"+ vehicleList.get(i).getTVehicleId()+"</option>");
    
%>