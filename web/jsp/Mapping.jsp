<%-- 
    Document   : Mapping
    Created on : May 29, 2015, 10:49:54 AM
    Author     : Raj-HP
--%>

<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="hibernate.helper.CardList"%>
<%@page import="java.util.List"%>
<%@page import="EditTransporter.TransporterList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mapping</title>
    </head>
    <body>
        <div id="top"><jsp:include page="Menu.jsp"/></div>
        <script>
            function xyz()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    // code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("Driver").length = 0;
                        document.getElementById("Driver").innerHTML=xmlhttp.responseText;
                    }
                };
                var a = document.getElementById("Transporter").value;
                xmlhttp.open("GET", "jsp/getDriver.jsp?transporterId=" + a, true);
                xmlhttp.send();
                
                abc();
            }
            function abc()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    // code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("Vehicle").length = 0;
                        document.getElementById("Vehicle").innerHTML=xmlhttp.responseText;
                    }
                };
                var a = document.getElementById("Transporter").value;
                xmlhttp.open("GET", "jsp/getVehicle.jsp?transporterId=" + a, true);
                xmlhttp.send();
            }
            function trip()
            {
                
                document.getElementById("cardid").value=document.getElementById("Card").value;
                document.getElementById("transporterid").value=document.getElementById("Transporter").value;
                document.getElementById("vehicleid").value=document.getElementById("Vehicle").value;
                document.getElementById("driverid").value=document.getElementById("Driver").value;
                document.getElementById("processid").value=document.getElementById("Process").value;
                
                document.mapping.action="starttrip";
                document.mapping.submit();
            }
            function show()
            {
                if(document.getElementById("Driver").value == 0)
                {
                    document.getElementById("dname").style.display="block";
                    document.getElementById("drivername").style.display="block";
                    document.getElementById("bname").value="1";
                }
                return;
            }
        </script>
        
        <h1>Mapping</h1>
        <h2>Card No. </h2>
        <select id="Card">
            <%
                ValueStack stack = ActionContext.getContext().getValueStack();
                Map sesion = (Map)ActionContext.getContext().getSession();
                hibernate.pojo.TblUsers user = (hibernate.pojo.TblUsers)sesion.get("user");
                out.println("<option>Choose Card No. </option>");
                CardList c=new CardList();
                List<hibernate.pojo.TblCard> CardList=c.getCardList(user.getTblPlant().getIPlantId().toString());
                for(int i = 0; i < CardList.size(); i++)
                    out.println("<option value=\""+ CardList.get(i).getCCardId()+"\">"+ CardList.get(i).getCCardId() +"</option>");
            %>
        </select><br>
        <p>Process Type </p>
        <select id="Process">
            <%
                out.println("<option>Choose Process Type </option>");
                hibernate.helper.ProcessList p=new hibernate.helper.ProcessList();
                List<hibernate.pojo.TblProcess> processList=p.getProcessList(user.getTblPlant().getIPlantId().toString());
                for(int i = 0; i < processList.size(); i++)
                    out.println("<option value=\""+ processList.get(i).getIProcessId()+"\">"+ processList.get(i).getTProcessType() +"</option>");
            %>
        </select><br>
        <h2>Transporter </h2>
        <select id="Transporter" onchange="xyz()">
            <%
                out.println("<option>Choose Transporter</option>");
                TransporterList t=new TransporterList();
                List<hibernate.pojo.TblTransporter> transporterList=t.getTransporterList(user.getTblPlant().getIPlantId().toString());
                for(int i = 0; i < transporterList.size(); i++)
                    out.println("<option value=\""+transporterList.get(i).getITransporterId()+"\">"+ transporterList.get(i).getTTransporterName() +"</option>");
            %>
        </select><br>
        
        <h2>Vehicle </h2>
        <select id="Vehicle">
            <option>Choose Vehicle </option>
        </select><br>
        <h2>Driver </h2>
        <select id="Driver" onchange="show()">
            <option>Choose Driver </option>
        </select><br>
        
        <form name="mapping" action="">
            <label id="dname" style="display:none;">Driver Name:</label>
            <input type="text" id="drivername" name="drivername" value="" style="display:none;" />
            <input type="hidden" id="bname" name="bname" value="0">
            <input type="hidden" name="Id" value="<%out.print(user.getTblPlant().getIPlantId().toString());%>"/>           
            <input type="hidden" name="cardid" id="cardid" value=""/>
            <input type="hidden" name="transporterid" id="transporterid" value=""/>
            <input type="hidden" name="vehicleid" id="vehicleid" value=""/>
            <input type="hidden" name="driverid" id="driverid" value=""/>
            <input type="hidden" name="processid" id="processid" value=""/>            
            Date : <input type="date" name="tdate">
            <input type="button" value="Start Trip" onClick="trip()">
        </form>
    </body>
</html>
