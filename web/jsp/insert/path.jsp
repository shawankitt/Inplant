<%-- 
    Document   : path
    Created on : Apr 24, 2015, 9:34:19 PM
    Author     : Raj-HP
--%>

<%@page import="java.util.List"%>
<%@page import="hibernate.helper.EposList"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="hibernate.pojo.TblPlant"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Path</title>
    </head>
    <body>
        
        <script>
            function pathaction(button)
            {
                if(button.id === "add")
                {
                    document.path.action="insertpath";
                }
                else if(button.id === "next")
                {
                    document.path.action="insertpathnext";
                }
                document.path.submit();
            }
            function addPath()
            {
                var dropdown=document.getElementById("epos");
                var temp=document.getElementById("addepos").value + dropdown.value;
                temp = temp + "#";
                document.getElementById("addepos").value =temp;
                alert(temp);
            }
	</script>
        <h1>Path</h1>
        <select id="epos" >
            <%
                out.println("<option>Choose Epos From</option>");
                EposList t=new EposList();
                List<hibernate.pojo.TblEpos> eposList=t.getEposList("17");
                for(int i = 0; i < eposList.size(); i++)
                    out.println("<option value=\""+eposList.get(i).getIMachineId()+"\">"+ eposList.get(i).getTGatewayName()+"</option>");
            %>
        </select><br>
        <form name="path" action="" method="post">
            Path Name<input type="text" name="TName"/><br>
            <input type="hidden" name="Id" id="Id" value="17" >
            <input type="hidden" name="addepos" id="addepos" value=""/>
            <input type="button" name="add" id="addpath" value="Add to path" onClick = "addPath()" />            
            <input type="button" name="add" id="add" value="Add More Paths" onClick = "pathaction(this)" />
            <input type="button" name="next" id="next" value="Submit And Next Page" onClick = "pathaction(this)" />
        </form>
    </body>
</html>
