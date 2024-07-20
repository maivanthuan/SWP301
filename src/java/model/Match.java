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
public class Match {

    private int matchID;
    private String nameTeam1;
    private String nameTeam2;
    private int userID1;
    private int userID2;
    private Date date;
    private int statusMatchID;
    private String statusMatchName;
    private String pitchID;
    private int bookingTimeID;
    private String bookTime;
    private int price;
    private Account acc1;
    private Account acc2;

    public Match() {
    }

    public Match(int matchID, String nameTeam1, int userID1, int userID2, Date date, String statusMatchName, int statusMatchID, String pitchID, String bookTime, int price) {
        this.matchID = matchID;
        this.nameTeam1 = nameTeam1;
        this.userID1 = userID1;
        this.userID2 = userID2;
        this.date = date;
        this.statusMatchName = statusMatchName;
        this.statusMatchID = statusMatchID;
        this.pitchID = pitchID;
        this.bookTime = bookTime;
        this.price = price;

    }

    public Match(int matchID, String nameTeam1, String nameTeam2, int userID1, int userID2, Date date, int statusMatchID, String pitchID, int bookingTimeID, int price) {
        this.matchID = matchID;
        this.nameTeam1 = nameTeam1;
        this.nameTeam2 = nameTeam2;
        this.userID1 = userID1;
        this.userID2 = userID2;
        this.date = date;
        this.statusMatchID = statusMatchID;
        this.pitchID = pitchID;
        this.bookingTimeID = bookingTimeID;
        this.price = price;
    }

    public Match(String nameTeam, int userID1, Date date, int statusMatchID, String pitchID, int bookingTimeID, int price) {
        this.nameTeam1 = nameTeam;
        this.userID1 = userID1;
        this.date = date;
        this.statusMatchID = statusMatchID;
        this.pitchID = pitchID;
        this.bookingTimeID = bookingTimeID;
        this.price = price;
    }

    public Match(int matchID, String nameTeam, int userID1, Date date, String statusMatchName, String pitchID, String bookTime, int price, int statusMatchID) {
        this.matchID = matchID;
        this.nameTeam1 = nameTeam;
        this.userID1 = userID1;
        this.date = date;
        this.statusMatchName = statusMatchName;
        this.pitchID = pitchID;
        this.bookTime = bookTime;
        this.price = price;
        this.statusMatchID = statusMatchID;
    }

    public Match(String nameTeam, int userID1, Date date, String pitchID, int bookingTimeID, int price) {
        this.nameTeam1 = nameTeam;
        this.userID1 = userID1;
        this.date = date;
        this.pitchID = pitchID;
        this.bookingTimeID = bookingTimeID;
        this.price = price;
    }

    public String getNameTeam1() {
        return nameTeam1;
    }

    public void setNameTeam1(String nameTeam1) {
        this.nameTeam1 = nameTeam1;
    }

    public String getNameTeam2() {
        return nameTeam2;
    }

    public void setNameTeam2(String nameTeam2) {
        this.nameTeam2 = nameTeam2;
    }

    public String getBookTime() {
        return bookTime;
    }

    public void setBookTime(String booktime) {
        this.bookTime = booktime;
    }

    public String getNameTeam() {
        return nameTeam1;
    }

    public void setNameTeam(String nameTeam) {
        this.nameTeam1 = nameTeam;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public int getUserID1() {
        return userID1;
    }

    public void setUserID1(int userID1) {
        this.userID1 = userID1;
    }

    public int getUserID2() {
        return userID2;
    }

    public void setUserID2(int userID2) {
        this.userID2 = userID2;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatusMatchID() {
        return statusMatchID;
    }

    public void setStatusMatchID(int statusMatchID) {
        this.statusMatchID = statusMatchID;
    }

    public String getStatusMatchName() {
        return statusMatchName;
    }

    public void setStatusMatchName(String statusMatchName) {
        this.statusMatchName = statusMatchName;
    }

    public String getPitchID() {
        return pitchID;
    }

    public void setPitchID(String pitchID) {
        this.pitchID = pitchID;
    }

    public int getBookingTimeID() {
        return bookingTimeID;
    }

    public void setBookingTimeID(int categoriesID) {
        this.bookingTimeID = categoriesID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Account getAcc1() {
        return acc1;
    }

    public void setAcc1(Account acc1) {
        this.acc1 = acc1;
    }

    public Account getAcc2() {
        return acc2;
    }

    public void setAcc2(Account acc2) {
        this.acc2 = acc2;
    }

    @Override
    public String toString() {
        return "Match{" + "matchID=" + matchID + ", nameTeam1=" + nameTeam1 + ", nameTeam2=" + nameTeam2 + ", userID1=" + userID1 + ", userID2=" + userID2 + ", date=" + date + ", statusMatchID=" + statusMatchID + ", statusMatchName=" + statusMatchName + ", pitchID=" + pitchID + ", bookingTimeID=" + bookingTimeID + ", bookTime=" + bookTime + ", price=" + price + '}';
    }

}
