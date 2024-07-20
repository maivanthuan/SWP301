/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 **/
public class InvoiceProduct {
    private int invoiceProductID;
    private String totalPriceProductID;
    private String productID;
    private int quantity;
    private String priceProductID;
    private String productName;
    private int price;

    public InvoiceProduct(int invoiceProductID, String totalPriceProductID, String productID, int quantity, String priceProductID) {
        this.invoiceProductID = invoiceProductID;
        this.totalPriceProductID = totalPriceProductID;
        this.productID = productID;
        this.quantity = quantity;
        this.priceProductID = priceProductID;
    }

    public InvoiceProduct(int quantity, String productName, int price) {
        this.quantity = quantity;
        this.productName = productName;
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    // Getters và setters cho các trường
    public int getInvoiceProductID() {
        return invoiceProductID;
    }

    public void setInvoiceProductID(int invoiceProductID) {
        this.invoiceProductID = invoiceProductID;
    }

    public String getTotalPriceProductID() {
        return totalPriceProductID;
    }

    public void setTotalPriceProductID(String totalPriceProductID) {
        this.totalPriceProductID = totalPriceProductID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPriceProductID() {
        return priceProductID;
    }

    public void setPriceProductID(String priceProductID) {
        this.priceProductID = priceProductID;
    }

    @Override
    public String toString() {
        return "InvoiceProduct{" + "quantity=" + quantity + ", productName=" + productName + ", price=" + price + '}';
    }

}