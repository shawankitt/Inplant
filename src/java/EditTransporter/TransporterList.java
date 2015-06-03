/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EditTransporter;

import hibernate.pojo.TblUsers;
import java.util.Collections;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Ankit
 */
public class TransporterList {
    Session session = null;

    public TransporterList() 
    {
        
    }
    
    private List<hibernate.pojo.TblTransporter> transporterList = null;
    
    public List<hibernate.pojo.TblTransporter> getTransporterList(String Id){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            Query q = session.createQuery ("FROM hibernate.pojo.TblTransporter where i_plant_id=" + Id);
            transporterList = (List<hibernate.pojo.TblTransporter>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return transporterList;
    }
    public List<hibernate.pojo.TblTransporter> getTransporterList(){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            Query q = session.createQuery ("FROM hibernate.pojo.TblTransporter");
            transporterList = (List<hibernate.pojo.TblTransporter>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return transporterList;
    }
    public static void main(String args[])
    {
        TransporterList t = new TransporterList();
        System.out.println(t.getTransporterList("17"));
    }
}
