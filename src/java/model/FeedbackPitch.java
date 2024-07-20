/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
public class FeedbackPitch {
    private int feedbackID;
    private int userID;
    private String pitchID;
    private String content;
    private float rating;
    private String timeFeedback;

    public FeedbackPitch() {
    }

    public FeedbackPitch(int feedbackID, int userID, String pitchID, String content, float rating, String timeFeedback) {
        this.feedbackID = feedbackID;
        this.userID = userID;
        this.pitchID = pitchID;
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

    public String getPitchID() {
        return pitchID;
    }

    public void setPitchID(String pitchID) {
        this.pitchID = pitchID;
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
        return "FeedbackPitch{" + "feedbackID=" + feedbackID + ", userID=" + userID + ", pitchID=" + pitchID + ", content=" + content + ", rating=" + rating + ", timeFeedback=" + timeFeedback + '}';
    }

   

}