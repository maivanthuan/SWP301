/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class InvoicePitch {
    private int invoicePitchID;
    private Pitch pitchID;
    private PricePitch pricePitchID;
    private TotalInvoicePitch totalInvoicePitchID;
    private BookingTime bookingTimeID;
    private int price;
    private String bookTime;
    private String pitchType;
    public InvoicePitch() {
        
    }

    public InvoicePitch(Pitch pitchID, int price, String bookTime, String pitchType) {
        this.pitchID = pitchID;
        this.price = price;
        this.bookTime = bookTime;
        this.pitchType = pitchType;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBookTime() {
        return bookTime;
    }

    public void setBookTime(String bookTime) {
        this.bookTime = bookTime;
    }

    public String getPitchType() {
        return pitchType;
    }

    public void setPitchType(String pitchType) {
        this.pitchType = pitchType;
    }

    public InvoicePitch(int invoicePitchID, Pitch pitchID, PricePitch pricePitchID, TotalInvoicePitch totalInvoicePitchID, BookingTime bookingTimeID) {
        this.invoicePitchID = invoicePitchID;
        this.pitchID = pitchID;
        this.pricePitchID = pricePitchID;
        this.totalInvoicePitchID = totalInvoicePitchID;
        this.bookingTimeID = bookingTimeID;
    }

    public int getInvoicePitchID() {
        return invoicePitchID;
    }

    public void setInvoicePitchID(int invoicePitchID) {
        this.invoicePitchID = invoicePitchID;
    }

    public Pitch getPitchID() {
        return pitchID;
    }

    public void setPitchID(Pitch pitchID) {
        this.pitchID = pitchID;
    }

    public PricePitch getPricePitchID() {
        return pricePitchID;
    }

    public void setPricePitchID(PricePitch pricePitchID) {
        this.pricePitchID = pricePitchID;
    }

    public TotalInvoicePitch getTotalInvoicePitchID() {
        return totalInvoicePitchID;
    }

    public void setTotalInvoicePitchID(TotalInvoicePitch totalInvoicePitchID) {
        this.totalInvoicePitchID = totalInvoicePitchID;
    }

    public BookingTime getBookingTimeID() {
        return bookingTimeID;
    }

    public void setBookingTimeID(BookingTime bookingTimeID) {
        this.bookingTimeID = bookingTimeID;
    }

   
    
    
}
