/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.FeedbackProduct;


public class FeedbackDAO extends DBContext {

    public List<FeedbackProduct> getFeedbackByproductID(int productID) {
        List<FeedbackProduct> list = new ArrayList<>();
        String sql = "SELECT f.feedbackID, f.userID, f.productID, f.content, f.rating, f.timeFeedback\n"
                + "FROM FeedbackProduct f\n"
                + "JOIN Product p ON f.productID = p.productID\n"
                + "WHERE f.productID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                FeedbackProduct c = new FeedbackProduct(rs.getInt("feedbackID"), rs.getInt("userID"), rs.getInt("productID"), rs.getString("content"), rs.getFloat("rating"), rs.getString("timeFeedback"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public boolean insertFeedback(FeedbackProduct feedbackProduct) throws SQLException {
        String sql = "INSERT INTO FeedbackProduct ( userID, productID, content, rating, timeFeedback) VALUES (?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        
        statement.setInt(1, feedbackProduct.getUserID());
        statement.setInt(2, feedbackProduct.getProductID());
        statement.setString(3, feedbackProduct.getContent());  
        statement.setFloat(4, feedbackProduct.getRating());
        statement.setString(5, feedbackProduct.getTimeFeedback());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        return rowInserted;
    }
    
     public boolean deleteFeedback(int feedbackID) throws SQLException {
        String sql = "DELETE FROM FeedbackProduct where feedbackID = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, feedbackID);
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        return rowDeleted;
    }
    public static void main(String[] args) throws SQLException {
        FeedbackDAO feedbackProductDAO = new FeedbackDAO();
        feedbackProductDAO.deleteFeedback(1);
        
    }
}
