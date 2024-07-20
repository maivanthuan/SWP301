/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class PricePitch {

    private String pricePitchID;
    private Pitch pitchID;
    private int price;
    private String timeStart, timeEnd;

    public PricePitch() {
    }

    public PricePitch(String pricePitchID, Pitch pitchID, int price, String timeStart, String timeEnd) {
        this.pricePitchID = pricePitchID;
        this.pitchID = pitchID;
        this.price = price;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
    }

    public PricePitch(String pricePitchID, Pitch pitchID, int price) {
        this.pricePitchID = pricePitchID;
        this.pitchID = pitchID;
        this.price = price;
    }

    public String getPricePitchID() {
        return pricePitchID;
    }

    public void setPricePitchID(String pricePitchID) {
        this.pricePitchID = pricePitchID;
    }

    public Pitch getPitchID() {
        return pitchID;
    }

    public void setPitchID(Pitch pitchID) {
        this.pitchID = pitchID;
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
        return "PricePitch{" + "pricePitchID=" + pricePitchID + ", pitchID=" + pitchID + ", price=" + price + ", timeStart=" + timeStart + ", timeEnd=" + timeEnd + '}';
    }

}
