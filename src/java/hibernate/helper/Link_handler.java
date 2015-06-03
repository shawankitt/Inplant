/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.pojo.TblEpos;
import hibernate.pojo.TblLinks;
import hibernate.pojo.TblPlant;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class Link_handler {
    private Session session;
    
    
    public String insert_into_table(int plant_id,int to,int from,int time){
        
        boolean error_flag=false;
        
        session=hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Transaction tx = null;

        try
        {
            tx=session.beginTransaction();
        
            TblLinks lp =new TblLinks();
            lp.setILid(new BigDecimal(1));
            
            Epos_handler e = new Epos_handler();
            TblEpos fromepos = e.get_tuple(from);
            TblEpos toepos = e.get_tuple(to);
        
            Plant_handler ph=new Plant_handler();
            TblPlant plant= ph.get_tuple(plant_id);
         
            if(plant!=null)
                   lp.setTblPlant(plant);
            else    throw new Exception();
            
            if(fromepos!=null)
                   lp.setTblEposByIFrom(fromepos);
            else    throw new Exception();
            
            if(toepos!=null)
                   lp.setTblEposByITo(toepos);
            else    throw new Exception();
            
            lp.setNTimediffInMin(new BigDecimal(time));
            
            ValueStack stack = ActionContext.getContext().getValueStack();
            Map<String, Object> context = new HashMap<String, Object>();
            context.put("current_session", plant);
            stack.push(context);
            
            session.save(lp);
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
}
