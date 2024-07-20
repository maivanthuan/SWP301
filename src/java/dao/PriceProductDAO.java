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

import model.PriceProduct;

public class PriceProductDAO extends DBContext{
    public List<PriceProduct> getAll() {
        List<PriceProduct> list = new ArrayList<>();
        String sql = "select * from dbo.PriceProduct";
        try {
             PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                PriceProduct c = new PriceProduct(rs.getString("priceProductID"), rs.getInt("productID"), rs.getInt("price"), rs.getString("timeStart"), rs.getString("timeEnd"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
public boolean insertPriceProduct(PriceProduct priceproduct) throws SQLException {
        String sql = "INSERT INTO PriceProduct ( ProductID, Price, TimeStart, TimeEnd) SELECT MAX(productID), ?, ?,?\n" +
"                FROM Product;";

        PreparedStatement statement = connection.prepareStatement(sql);  
        statement.setInt(1, priceproduct.getPrice());
        statement.setString(2, priceproduct.getTimeStart());
        statement.setString (3, priceproduct.getTimeEnd());
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        return rowInserted;
    }
public boolean insertPriceProduct2(PriceProduct priceproduct) throws SQLException {
    String sql = "INSERT INTO PriceProduct (ProductID, Price, TimeStart, TimeEnd) VALUES (?, ?, ?, ?)";

    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setInt(1, priceproduct.getProductID());
    statement.setInt(2, priceproduct.getPrice());
    statement.setString(3, priceproduct.getTimeStart());
    statement.setString(4, priceproduct.getTimeEnd());

    boolean rowInserted = statement.executeUpdate() > 0;
    
    statement.close();
    return rowInserted;
}
    
    public boolean deletePriceProduct(int productID) throws SQLException {
        String sql = "DELETE FROM PriceProduct where productID = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, productID);
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        return rowDeleted;
    }
      
      public static void main(String[] args) {
        PriceProductDAO priceProductDAO = new PriceProductDAO();
        List<PriceProduct> list = priceProductDAO.getAll();
          for (PriceProduct o : list) {
              System.out.println(o);
          }
    }
}
