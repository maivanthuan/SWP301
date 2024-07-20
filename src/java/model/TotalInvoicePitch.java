/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class TotalInvoicePitch {

    private int totalIvoiceID;
    private Account userID;
    private Date bookTime;
    private int matchID;
    private int totalPrice;

    public TotalInvoicePitch() {
    }

    public TotalInvoicePitch(Account userID, Date bookTime, int matchID) {
        this.userID = userID;
        this.bookTime = bookTime;
        this.matchID = matchID;
    }


    public TotalInvoicePitch(int totalIvoiceID, Account userID, Date bookTime) {
        this.totalIvoiceID = totalIvoiceID;
        this.userID = userID;
        this.bookTime = bookTime;
    }

    public int getTotalIvoiceID() {
        return totalIvoiceID;
    }

    public void setTotalIvoiceID(int totalIvoiceID) {
        this.totalIvoiceID = totalIvoiceID;
    }

    public Account getUserID() {
        return userID;
    }

    public void setUserID(Account userID) {
        this.userID = userID;
    }

    public Date getBookTime() {
        return bookTime;
    }

    public void setBookTime(Date bookTime) {
        this.bookTime = bookTime;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

}
