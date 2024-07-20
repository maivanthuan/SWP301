/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author hhip4
 */
public class FeedbackProduct {
    private int feedbackID;
    private int userID;
    private int productID;
    private String content;
    private float rating;
    private String timeFeedback;

    public FeedbackProduct() {
    }

    public FeedbackProduct(int feedbackID, int userID, int productID, String content, float rating, String timeFeedback) {
        this.feedbackID = feedbackID;
        this.userID = userID;
        this.productID = productID;
        this.content = content;
        this.rating = rating;
        this.timeFeedback = timeFeedback;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getTimeFeedback() {
        return timeFeedback;
    }

    public void setTimeFeedback(String timeFeedback) {
        this.timeFeedback = timeFeedback;
    }

    @Override
    public String toString() {
        return "FeedbackProduct{" + "feedbackID=" + feedbackID + ", userID=" + userID + ", productID=" + productID + ", content=" + content + ", rating=" + rating + ", timeFeedback=" + timeFeedback + '}';
    }
    
    
}
