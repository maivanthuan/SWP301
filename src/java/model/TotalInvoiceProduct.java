package model;

import java.time.LocalDate;


public class TotalInvoiceProduct {

    private int ID;
    private int userID;
    private String name;
    private String phone;
    private String address;
    private String orderDate;
    private int orderStatusID;
    private String statusName;
    private int totalInvoiceProductID;
    private double total;
    private LocalDate time;
    // Constructors
    public TotalInvoiceProduct() {
    }

    public TotalInvoiceProduct(int userID, String name, String phone, String address, double total, LocalDate time) {
        this.userID = userID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.total = total;
        this.time = time;
    }

    public LocalDate getTime() {
        return time;
    }

    public void setTime(LocalDate time) {
        this.time = time;
    }

    public TotalInvoiceProduct(int ID, int userID, String name, String phone, String address, String orderDate, int orderStatusID, String statusName, int totalInvoiceProductID, double total) {
        this.ID = ID;
        this.userID = userID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.orderStatusID = orderStatusID;
        this.statusName = statusName;
        this.totalInvoiceProductID = totalInvoiceProductID;
        this.total = total;
    }
    
    public TotalInvoiceProduct(int ID, int userID, String name, String phone, String address, String orderDate, int orderStatusID, String statusName, int totalInvoiceProductID) {
        this.ID = ID;
        this.userID = userID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.orderStatusID = orderStatusID;
        this.statusName = statusName;
        this.totalInvoiceProductID = totalInvoiceProductID;
    }

    @Override
    public String toString() {
        return "Orders{" + "ID=" + ID + ", userID=" + userID + ", name=" + name + ", phone=" + phone + ", address=" + address + ", orderDate=" + orderDate + ", orderStatusID=" + orderStatusID + ", statusName=" + statusName + ", totalInvoiceProductID=" + totalInvoiceProductID + ", total=" + total + '}';
    }

    

    public TotalInvoiceProduct(int userID, String name, String phone, String address, String orderDate, int totalInvoiceProductID) {
        this.userID = userID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.totalInvoiceProductID = totalInvoiceProductID;
    }
    
    

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderStatusID() {
        return orderStatusID;
    }

    public void setOrderStatusID(int orderStatusID) {
        this.orderStatusID = orderStatusID;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
    
    
    public int getTotalInvoiceProductID() {
        return totalInvoiceProductID;
    }

    public void setTotalInvoiceProductID(int totalInvoiceProductID) {
        this.totalInvoiceProductID = totalInvoiceProductID;
    }
}
