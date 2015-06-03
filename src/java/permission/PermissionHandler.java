/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package permission;

import hibernate.pojo.TblPlant;
import java.math.BigDecimal;

/**
 *
 * @author Ankit
 */
public class PermissionHandler {
    
     private Boolean BRemoveTrip;
     private Boolean BViewTrip;
     private Boolean BNodeView;
     private Boolean BAddTrip;
     private Boolean BViewException;
     private Boolean BEndException;
     private Boolean BViewHistory;
     private Boolean BSetupNewPlant;
     private Boolean BPlantModify;
     private Boolean BAddUser;
     private Boolean BModifyUser;
     private Boolean BChangeCurrentPlant;
     private Boolean BAddVehicle;
     private Boolean BModifyVehicle;
     private Boolean BModifyDriver;
     private Boolean BAddDriver;
     private Boolean BViewDo;
     private Boolean BLoggedIn;

    public PermissionHandler() {
    }

    public PermissionHandler(String s) {
        if(s.equals("admin")){
            this.BRemoveTrip = true;
            this.BViewTrip = true;
            this.BNodeView = true;
            this.BAddTrip = true;
            this.BViewException = true;
            this.BEndException = true;
            this.BViewHistory = true;
            this.BSetupNewPlant = true;
            this.BPlantModify = true;
            this.BAddUser = true;
            this.BModifyUser = true;
            this.BChangeCurrentPlant = true;
            this.BAddVehicle = true;
            this.BModifyVehicle = true;
            this.BModifyDriver = true;
            this.BAddDriver = true;
            this.BViewDo = true;
            this.BLoggedIn = true;
        }
        if(s.equals("transporter")){
            this.BAddVehicle = true;
            this.BModifyVehicle = true;
            this.BModifyDriver = true;
            this.BAddDriver = true;
            this.BViewDo = true;
            this.BLoggedIn = true;
        }
    }
     
    
     
    public Boolean getBRemoveTrip() {
        return BRemoveTrip;
    }

    public void setBRemoveTrip(Boolean BRemoveTrip) {
        this.BRemoveTrip = BRemoveTrip;
    }

    public Boolean getBViewTrip() {
        return BViewTrip;
    }

    public void setBViewTrip(Boolean BViewTrip) {
        this.BViewTrip = BViewTrip;
    }

    public Boolean getBNodeView() {
        return BNodeView;
    }

    public void setBNodeView(Boolean BNodeView) {
        this.BNodeView = BNodeView;
    }

    public Boolean getBAddTrip() {
        return BAddTrip;
    }

    public void setBAddTrip(Boolean BAddTrip) {
        this.BAddTrip = BAddTrip;
    }

    public Boolean getBViewException() {
        return BViewException;
    }

    public void setBViewException(Boolean BViewException) {
        this.BViewException = BViewException;
    }

    public Boolean getBEndException() {
        return BEndException;
    }

    public void setBEndException(Boolean BEndException) {
        this.BEndException = BEndException;
    }

    public Boolean getBViewHistory() {
        return BViewHistory;
    }

    public void setBViewHistory(Boolean BViewHistory) {
        this.BViewHistory = BViewHistory;
    }

    public Boolean getBSetupNewPlant() {
        return BSetupNewPlant;
    }

    public void setBSetupNewPlant(Boolean BSetupNewPlant) {
        this.BSetupNewPlant = BSetupNewPlant;
    }

    public Boolean getBPlantModify() {
        return BPlantModify;
    }

    public void setBPlantModify(Boolean BPlantModify) {
        this.BPlantModify = BPlantModify;
    }

    public Boolean getBAddUser() {
        return BAddUser;
    }

    public void setBAddUser(Boolean BAddUser) {
        this.BAddUser = BAddUser;
    }

    public Boolean getBModifyUser() {
        return BModifyUser;
    }

    public void setBModifyUser(Boolean BModifyUser) {
        this.BModifyUser = BModifyUser;
    }

    public Boolean getBChangeCurrentPlant() {
        return BChangeCurrentPlant;
    }

    public void setBChangeCurrentPlant(Boolean BChangeCurrentPlant) {
        this.BChangeCurrentPlant = BChangeCurrentPlant;
    }

    public Boolean getBAddVehicle() {
        return BAddVehicle;
    }

    public void setBAddVehicle(Boolean BAddVehicle) {
        this.BAddVehicle = BAddVehicle;
    }

    public Boolean getBModifyVehicle() {
        return BModifyVehicle;
    }

    public void setBModifyVehicle(Boolean BModifyVehicle) {
        this.BModifyVehicle = BModifyVehicle;
    }

    public Boolean getBModifyDriver() {
        return BModifyDriver;
    }

    public void setBModifyDriver(Boolean BModifyDriver) {
        this.BModifyDriver = BModifyDriver;
    }

    public Boolean getBAddDriver() {
        return BAddDriver;
    }

    public void setBAddDriver(Boolean BAddDriver) {
        this.BAddDriver = BAddDriver;
    }

    public Boolean getBViewDo() {
        return BViewDo;
    }

    public void setBViewDo(Boolean BViewDo) {
        this.BViewDo = BViewDo;
    }

    public Boolean getBLoggedIn() {
        return BLoggedIn;
    }

    public void setBLoggedIn(Boolean BLoggedIn) {
        this.BLoggedIn = BLoggedIn;
    }
    
}
