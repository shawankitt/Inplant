<%-- 
    Document   : getDriver
    Created on : May 30, 2015, 3:02:07 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.List"%>
<%
    String a = request.getParameter("transporterId");
    hibernate.helper.DriverList d = new hibernate.helper.DriverList();
    List<hibernate.pojo.TblDriver> driverList=d.getDriverList(a);
    for(int i = 0; i < driverList.size(); i++)
                    out.println("<option value=\""+driverList.get(i).getIDriverId()+"\">"+ driverList.get(i).getTDriverName()+"</option>");
    out.println("<option value=\"0\">Others</option>");
%>
