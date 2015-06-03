/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblProcess;
import hibernate.pojo.TblPlant;
import hibernate.pojo.TblProcess;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Raj-HP
 */
public class Process_handler {

    private Session session;
    
    
    public String insert_into_table(int plant_id, String processname){
        
        boolean error_flag=false;
        
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Transaction tx = null;

        try
        {
            tx=session.beginTransaction();
        
            TblProcess c =new TblProcess();
            
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(plant_id);
         
            if(plant!=null)
                   c.setTblPlant(plant);
            else    throw new Exception();
            
            c.setIProcessId(BigDecimal.ZERO);
            c.setTProcessType(processname);
            
            
            ValueStack stack = ActionContext.getContext().getValueStack();
            Map<String, Object> context = new HashMap<String, Object>();
            context.put("current_session", plant);
            stack.push(context);
            
            session.save(c);
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
    }
    
    
    public TblProcess get_tuple(int processid) {
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        TblProcess c = new TblProcess();
        try
        {
           
            tx=session.beginTransaction();
            c=(TblProcess) session.get(TblProcess.class,new BigDecimal(processid));
        }
        catch(Exception e)
        {
             if (tx != null) {
                tx.rollback();
            e.printStackTrace();
        }
        }
        finally
        {
            session.close();
             return c;
        }     
    }
    
}
