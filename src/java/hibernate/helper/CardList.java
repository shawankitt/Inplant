/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.helper;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Raj-HP
 */
public class CardList {
    Session session = null;

    public CardList() {
    }
    
    private List<hibernate.pojo.TblCard> cardList = null;
    
    public List<hibernate.pojo.TblCard> getCardList(String Id){
        this.session = hibernate.folder.HibernateUtil.getSessionFactory().openSession();
        try 
        {
            Query q = session.createQuery ("FROM hibernate.pojo.TblCard where i_plant_id=" + Id);
            cardList = (List<hibernate.pojo.TblCard>) q.list();
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            this.session.close();
        }
       return cardList;
    }
    public static void main(String args[])
    {
        
    }
}
