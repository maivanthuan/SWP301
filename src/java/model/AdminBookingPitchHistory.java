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
public class AdminBookingPitchHistory {
    private int invoicePitchID;
    private String userName;
    private String pitchID;
    private int pitchType;
    private int price;
    private Date bookTime;
    private String time;
    private int totalPrice;
    private int totalInvoiceID;

    public AdminBookingPitchHistory(int invoicePitchID, String userName, String pitchID, int pitchType, int price, Date bookTime, String time, int totalPrice, int totalInvoiceID) {
        this.invoicePitchID = invoicePitchID;
        this.userName = userName;
        this.pitchID = pitchID;
        this.pitchType = pitchType;
        this.price = price;
        this.bookTime = bookTime;
        this.time = time;
        this.totalPrice = totalPrice;
        this.totalInvoiceID = totalInvoiceID;
    }

   public AdminBookingPitchHistory(){}

    public int getInvoicePitchID() {
        return invoicePitchID;
    }

    public void setInvoicePitchID(int invoicePitchID) {
        this.invoicePitchID = invoicePitchID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPitchID() {
        return pitchID;
    }

    public void setPitchID(String pitchID) {
        this.pitchID = pitchID;
    }

    public int getPitchType() {
        return pitchType;
    }

    public void setPitchType(int pitchType) {
        this.pitchType = pitchType;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getBookTime() {
        return bookTime;
    }

    public void setBookTime(Date bookTime) {
        this.bookTime = bookTime;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getTotalInvoiceID() {
        return totalInvoiceID;
    }

    public void setTotalInvoiceID(int totalInvoiceID) {
        this.totalInvoiceID = totalInvoiceID;
    }

    @Override
    public String toString() {
        return "AdminBookingPitchHistory{" + "invoicePitchID=" + invoicePitchID + ", userName=" + userName + ", pitchID=" + pitchID + ", pitchType=" + pitchType + ", price=" + price + ", bookTime=" + bookTime + ", time=" + time + ", totalPrice=" + totalPrice + ", totalInvoiceID=" + totalInvoiceID + '}';
    }
   
}
