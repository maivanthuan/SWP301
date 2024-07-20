/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author thuan
 */
public class AdminProductPurchaseHistory {
    private int invoiceProductID;
    private String userName;
    private int productID;
    private String productName;
    private int quantity;
    private int price;
    private Date orderDate;
    private String statusName;
    private int totalPrice;
    private int totalInvoiceProductID;
    private String image;
    private String size;

    public AdminProductPurchaseHistory() {
    }

    public AdminProductPurchaseHistory(int invoiceProductID, String userName, int productID, String productName, int quantity, int price, Date orderDate, String statusName, int totalPrice, int totalInvoiceProductID, String image, String size) {
        this.invoiceProductID = invoiceProductID;
        this.userName = userName;
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.orderDate = orderDate;
        this.statusName = statusName;
        this.totalPrice = totalPrice;
        this.totalInvoiceProductID = totalInvoiceProductID;
        this.image = image;
        this.size = size;
    }

    public int getInvoiceProductID() {
        return invoiceProductID;
    }

    public void setInvoiceProductID(int invoiceProductID) {
        this.invoiceProductID = invoiceProductID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getTotalInvoiceProductID() {
        return totalInvoiceProductID;
    }

    public void setTotalInvoiceProductID(int totalInvoiceProductID) {
        this.totalInvoiceProductID = totalInvoiceProductID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "AdminProductPurchaseHistory{" + "invoiceProductID=" + invoiceProductID + ", userName=" + userName + ", productID=" + productID + ", productName=" + productName + ", quantity=" + quantity + ", price=" + price + ", orderDate=" + orderDate + ", statusName=" + statusName + ", totalPrice=" + totalPrice + ", totalInvoiceProductID=" + totalInvoiceProductID + ", image=" + image + ", size=" + size + '}';
    }

    
}
