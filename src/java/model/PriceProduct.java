/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

public class PriceProduct {
    private String priceProductID;
    private int productID;
    private int price;
    private String timeStart;
    private String timeEnd;

    public PriceProduct() {
    }

    public PriceProduct(String priceProductID, int productID, int price, String timeStart, String timeEnd) {
        this.priceProductID = priceProductID;
        this.productID = productID;
        this.price = price;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
    }

    public String getPriceProductID() {
        return priceProductID;
    }

    public void setPriceProductID(String priceProductID) {
        this.priceProductID = priceProductID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    @Override
    public String toString() {
        return "priceProduct{" + "priceProductID=" + priceProductID + ", productID=" + productID + ", price=" + price + ", timeStart=" + timeStart + ", timeEnd=" + timeEnd + '}';
    }
    
    
}
