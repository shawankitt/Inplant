/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EditTransporter;

import java.math.BigDecimal;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Ankit
 */
public class deleteTransporter {

    public deleteTransporter() {
    }
    
    
    Session session = null;
    public boolean del(BigDecimal transporterId)
    {
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("delete hibernate.pojo.TblTransporter where ITransporterId="+transporterId);
            q.executeUpdate();
            tx.commit();
        }
        catch (Exception e) 
        {
            e.printStackTrace();
            return false;
        }
        finally
        {
            this.session.close();
        }
        return true;
    }
    public static void main(String args[])
    {
        deleteTransporter e=new deleteTransporter();
        //e.end(BigDecimal.ONE);
    }
    
}
