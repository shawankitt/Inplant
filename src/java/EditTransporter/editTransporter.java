/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EditTransporter;
import hibernate.pojo.TblTransporter;
import hibernate.pojo.TblUsers;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
/**
 *
 * @author Ankit
 */
public class editTransporter {
    private String getTransporterString;
    TransporterList transporterListVar;

    public editTransporter() 
    {
        transporterListVar = new TransporterList();
    }
    
    
    
    public String getTransporter(TblUsers user){
        getTransporterString = new String();
        getTransporterString+="<table border=1 width=\"100%\" id=\"TransporterList\">";
        getTransporterString+="<thead>";
        getTransporterString+="<tr>";
        List<hibernate.pojo.TblTransporter> transporterList = transporterListVar.getTransporterList();
        getTransporterString+="<th>Name</th>";
        getTransporterString+="<th>Address</th>";
        getTransporterString+="<th>City</th>";
        getTransporterString+="<th>State</th>";
        getTransporterString+="<th>Pin Code</th>";
        getTransporterString+="<th>Mobile</th>";
        getTransporterString+="<th>Email ID</th>";
        if(user.getBPlantModify()){
            getTransporterString+="<th>Modify Transporter</th>";
            getTransporterString+="<th>Delete Transporter</th>";
        }
        getTransporterString+="</tr>";
        getTransporterString+="</thead>";
        getTransporterString+="<tbody>";
        int rowId=0;
        for(hibernate.pojo.TblTransporter i: transporterList){
            getTransporterString+="<tr>";
            getTransporterString+=("<td>" + i.getTTransporterName() + "</td>");
            getTransporterString+=("<td>" + i.getTTransporterAddr() + "</td>");
            getTransporterString+=("<td>" + i.getTTransporterCity() + "</td>");
            getTransporterString+=("<td>" + i.getTTransporterState() + "</td>");
            getTransporterString+=("<td>" + i.getITransporterPin() + "</td>");
            getTransporterString+=("<td>" + i.getTTransporterMobileNo() + "</td>");
            getTransporterString+=("<td>" + i.getTTransporterEmailId() + "</td>");
            if(user.getBPlantModify()){
                getTransporterString+=("<td><button id=\"" + i.getITransporterId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"modifyTransporter(this)\"> Modify </button> </td>");
                getTransporterString+=("<td><button id=\"" + i.getITransporterId() + "\" value=\"" + rowId + "\" type=\"button\" onclick=\"deltransporter(this)\"> Delete </button> </td>");
            }
            getTransporterString+="</tr>";
            rowId++;
        }
        return getTransporterString;
    }
    
    public static void main(String[] args) 
    {
        editTransporter l = new editTransporter();
        hibernate.pojo.TblUsers user;    
        Session s=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        user=(hibernate.pojo.TblUsers)s.get(hibernate.pojo.TblUsers.class, "Admin");
        System.out.println(l.getTransporter(user));
    }
}
