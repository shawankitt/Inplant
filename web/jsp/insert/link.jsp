<%-- 
    Document   : link
    Created on : Apr 20, 2015, 10:14:40 AM
    Author     : Raj-HP
--%>

<%@page import="hibernate.helper.EposList"%>
<%@page import="java.util.List"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/placeholder.js" type="text/javascript"></script>
        <title>Link</title>
    </head>
    <body>
        <h1>LInks</h1>
        <script>
            function linkaction(button)
            {
                var number = /^\d+$/;
                var a = document.forms["link"]["timeinbetween"].value;
                if(! number.test(a))
                {
                    alert("Expected Time : Expected Integer");
                    return;
                }
                var dropdown1=document.getElementById("epos1");
                document.getElementById("from").value=dropdown1.value;
                var dropdown2=document.getElementById("epos2");
                document.getElementById("to").value=dropdown2.value;
                if(button.id === "add")
                {
                    document.link.action="insertlink";
                }
                else if(button.id === "next")
                {
                    document.link.action="insertlinknext";
                }
                document.link.submit();
            }
	</script>
        <%
            ValueStack s = ActionContext.getContext().getValueStack();
            TblPlant plant = (TblPlant)s.findValue("current_session");
        %>
        <select id="epos1" >
            <%
                out.println("<option>Choose Epos From</option>");
                EposList t=new EposList();
                List<hibernate.pojo.TblEpos> eposList=t.getEposList(plant.getIPlantId().toString());
                for(int i = 0; i < eposList.size(); i++)
                    out.println("<option value=\""+eposList.get(i).getIMachineId()+"\">"+ eposList.get(i).getTGatewayName()+"</option>");
            %>
        </select><br>
        <select id="epos2" >
            <%
                out.println("<option>Choose Epos To</option>");
                for(int i = 0; i < eposList.size(); i++)
                    out.println("<option value=\""+eposList.get(i).getIMachineId()+"\">"+ eposList.get(i).getTGatewayName()+"</option>");
            %>
        </select><br>
        <form name="link" action="" method="post">
            <input type="hidden" name="Id" id="Id" value="<% out.print( plant.getIPlantId().toString() ); %>" >
            <input type="hidden" name="from" id="from" value=""/>
            <input type="hidden" name="to" id="to" value=""/>
            Expected Time<input type="text" name="timeinbetween" placeholder="Enter Time in Minutes" onfocus="hide(this)" onblur="show(this, 'Enter Time in MInutes')"/><br>
            <input type="button" name="add" id="add" value="Add More Links" onClick = "linkaction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "linkaction(this)" />
        </form>
    </body>
</html>
