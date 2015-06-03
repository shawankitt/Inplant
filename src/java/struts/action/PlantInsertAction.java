/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package struts.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import hibernate.helper.InsertPlant;
import hibernate.helper.Plant_handler;
import hibernate.helper.Users_handler;
import hibernate.pojo.TblPlant;
import hibernate.pojo.TblUsers;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import permission.PermissionHandler;

/**
 *
 * @author Raj-HP
 */
public class PlantInsertAction
{

    private String TPlantName;
    private String TPlantOwner;
    private String username;
    private String password;

    public PlantInsertAction()
    {
    }

    public PlantInsertAction(String testing, String tester)
    {
        TPlantName = "testing";
        TPlantOwner = "tester";
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTPlantName()
    {
        return TPlantName;
    }

    public void setTPlantName(String TPlantName)
    {
        this.TPlantName = TPlantName;
    }

    public String getTPlantOwner()
    {
        return TPlantOwner;
    }

    public void setTPlantOwner(String TPlantOwner)
    {
        this.TPlantOwner = TPlantOwner;
    }

    public String execute() throws Exception
    {
        Plant_handler i = new Plant_handler();
        String result = i.insert_into_table(TPlantName, TPlantOwner);
        ValueStack s = ActionContext.getContext().getValueStack();
        TblPlant plant = (TblPlant)s.findValue("current_session");
        Users_handler u = new Users_handler();
        
        String result2 = u.insert_into_table(username,Integer.parseInt(plant.getIPlantId().toString()),password,
                                                                security.MD5.crypt(password),
                                                                new PermissionHandler("admin"));
        
        return result;
    }

    public static void main(String args[])
    {
        PlantInsertAction p = new PlantInsertAction("a", "b");
        try
        {
            p.execute();
        }
        catch (Exception e)
        {

        }
    }
}
