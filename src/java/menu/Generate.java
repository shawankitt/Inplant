/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package menu;

import org.hibernate.Session;

/**
 *
 * @author Jonty
 */
public class Generate 
{
    static hibernate.pojo.TblUsers user;
    
    public Generate(String username) 
    {
        Session s=hibernate.helper.NewHibernateUtil.getSessionFactory().openSession();
        user=(hibernate.pojo.TblUsers)s.get(hibernate.pojo.TblUsers.class, username);
    }
    
    public Permissions getMenu()
    {
        boolean temporary_canView=false;
        //Root Menu
        Permissions root=new Permissions(true, "root", "#");
        
        //Plant Operation
        Permissions plantOp=new Permissions(false, "Plant Operation", "#");
        root.insertChild(plantOp);
        
        //TripManagement
        Permissions tripManagament=new Permissions(false, "Trip Management", "#");
        plantOp.insertChild(tripManagament);
        
        temporary_canView=user.getBAddTrip();
        Permissions addTrip=new Permissions(temporary_canView, "Add New Trip", "loggedIn-AddTrip");
        tripManagament.insertChild(addTrip);
        
        temporary_canView=user.getBViewTrip();
        Permissions viewTrip=new Permissions(temporary_canView, "View Ongoing Trips", "loggedIn-ViewTrips");
        tripManagament.insertChild(viewTrip);
        
        //Exceptions
        temporary_canView=user.getBViewException();
        Permissions viewException=new Permissions(temporary_canView, "View Ongoing Exceptions", "loggedIn-ViewExceptions");
        
        plantOp.insertChild(viewException);
        
        //Plant History
        temporary_canView=user.getBViewHistory();
        Permissions viewHistory=new Permissions(temporary_canView, "View Plant History", "loggedIn-ViewHistory");
        
        root.insertChild(viewHistory);
        
        //Settings
        Permissions settings=new Permissions(false, "Settings", "#");
        root.insertChild(settings);
        
        
        //PlantSetup
        Permissions plantSetup=new Permissions(false, "Plant Setup", "#");
        settings.insertChild(plantSetup);
        
        temporary_canView=user.getBPlantModify();
        Permissions plantModify=new Permissions(temporary_canView, "Modify Plant", "loggedIn-ModifyPlant");
        plantSetup.insertChild(plantModify);
        
        temporary_canView=user.getBSetupNewPlant();
        Permissions plantCreate=new Permissions(temporary_canView, "Create new Plant", "loggedIn-SetupPlant");
        plantSetup.insertChild(plantCreate);
        
        //UserManagerment
        Permissions userManagement=new Permissions(false, "User Management", "#");
        settings.insertChild(userManagement);
        
        temporary_canView=user.getBAddUser();
        Permissions addUser=new Permissions(temporary_canView, "Create New User", "loggedIn-AddUser");
        userManagement.insertChild(addUser);
        
        temporary_canView=user.getBModifyUser();
        Permissions modifyUser=new Permissions(temporary_canView, "Modify User", "loggedIn-ModifyUser");
        userManagement.insertChild(modifyUser);
        
        //Vehicle Management
        Permissions vehicleManagement=new Permissions(false, "Vehicle Management", "#");
        settings.insertChild(vehicleManagement);
        
        temporary_canView=user.getBAddVehicle();
        Permissions addVehicle=new Permissions(temporary_canView, "Add Vehicle", "loggedIn-AddVehicle");
        vehicleManagement.insertChild(addVehicle);
        
        temporary_canView=user.getBModifyVehicle();
        Permissions modifyVehicle=new Permissions(temporary_canView, "Modify Vehicle", "loggedIn-ModifyVehicle");
        vehicleManagement.insertChild(modifyVehicle);
        
        //Driver Management
        Permissions driverManagement=new Permissions(false, "Driver Management", "#");
        settings.insertChild(driverManagement);
        
        temporary_canView=user.getBAddVehicle();
        Permissions addDriver=new Permissions(temporary_canView, "Add Driver", "loggedIn-AddDriver");
        driverManagement.insertChild(addDriver);
        
        temporary_canView=user.getBModifyVehicle();
        Permissions modifyDriver=new Permissions(temporary_canView, "Modify Driver", "loggedIn-ModfiyDriver");
        driverManagement.insertChild(modifyDriver);
        
        //Change Plant
        temporary_canView=user.getBChangeCurrentPlant();
        Permissions changePlant=new Permissions(temporary_canView, "Change Current Plant", "loggedIn-ChangePlant");
        settings.insertChild(changePlant);
        
        
        
        //Password
        Permissions changePassword=new Permissions(true, "Change Password", "loggedIn-ChangePassword");
        root.insertChild(changePassword);
        
        //Logout
        Permissions logOut=new Permissions(true, "Logout", "Logout");
        root.insertChild(logOut);
        
        
        make_permissions(root);
        
        return root;
    }
    
    public boolean make_permissions(Permissions root)
    {
        if(root.getChildList()==null)
            return root.isCanView();
        boolean perm=false;
        for(Permissions i: root.getChildList())
        {
            if(make_permissions(i)==true)
                perm=true;
        }
        root.setCanView(perm);
        return root.isCanView();
    }
}
