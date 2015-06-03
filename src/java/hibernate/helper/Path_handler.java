/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblEpos;
import hibernate.pojo.TblPaths;
import hibernate.pojo.TblPlant;
import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import static java.lang.System.out;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Raj-HP
 */
public class Path_handler extends sample_helper{

    public String insert_into_table(int plant_id, String TName, ArrayList arr)
  {
        boolean error_flag=false;
        Session session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
    
        org.hibernate.Transaction tx = null;
        try
        {
           
            tx=session.beginTransaction();
            TblPaths ep=new TblPaths();
            ep.setTName("A");
            /*ByteArrayOutputStream bos = new ByteArrayOutputStream() ;
            ObjectOutputStream out = new ObjectOutputStream(bos) ;
            out.writeObject(arr);
            out.close();
            byte[] buf = bos.toByteArray();
            ep.setIArrPath(buf);*/
            
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(17);
         
            if(plant!=null)
                   ep.setTblPlant(plant);
            else    throw new Exception();
            
            ValueStack stack = ActionContext.getContext().getValueStack();
            Map<String, Object> context = new HashMap<String, Object>();
            context.put("current_session", plant);
            stack.push(context);
                                           
            session.save(ep);
            tx.commit();
        }
        catch(Exception e)
        {
            error_flag=true; 
            if (tx != null) {
                tx.rollback();
            //e.printStackTrace();
        }
        }
        finally
        {
            session.close();
           if(error_flag==false) return "Success";
           else         return "Failure";
        }
        
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
