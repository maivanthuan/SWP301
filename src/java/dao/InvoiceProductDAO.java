/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DB.DBContext;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.InvoiceProduct;

/**
 *
 * @author Admin
 */
public class InvoiceProductDAO extends DBContext{
public int getTotalPriceByMonth(int month) {
          String sql = "SELECT SUM(totalPrice) FROM totalInvoiceProduct WHERE MONTH(orderDate) = ? and YEAR(orderDate) = YEAR(GETDATE())";

          try {
              PreparedStatement st = connection.prepareStatement(sql);
              st.setInt(1, month);
              ResultSet rs = st.executeQuery();
              if (rs.next()) {
                  return rs.getInt(1);
              }
          } catch (SQLException e) {
              System.out.println(e);
          }
          return 0;
      }
      public int getTotalPriceByYear(int year) {
          String sql = "SELECT SUM(totalPrice) FROM totalInvoiceProduct WHERE YEAR(orderDate) = ?";

          try {
              PreparedStatement st = connection.prepareStatement(sql);
              st.setInt(1, year);
              ResultSet rs = st.executeQuery();
              if (rs.next()) {
                  return rs.getInt(1);
              }
          } catch (SQLException e) {
              System.out.println(e);
          }
          return 0;
      }
public void createInvoiceProduct(int productID, int quantity, LocalDate orderDate) {
    String sql = "INSERT INTO InvoiceProduct (totalInvoiceProductID, productID, quantity, priceProductID) " +
                 "SELECT tip.totalInvoiceProductID, ?, ?, pp.priceProductID " +
                 "FROM ( " +
                 "    SELECT MAX(totalInvoiceProductID) AS totalInvoiceProductID " +
                 "    FROM TotalInvoiceProduct " +
                 ") AS tip " +
                 "CROSS APPLY ( " +
                 "    SELECT TOP 1 priceProductID " +
                 "    FROM PriceProduct " +
                 "    WHERE productID = ? " +
                 "      AND ? BETWEEN timeStart AND timeEnd " +
                 "    ORDER BY timeEnd DESC " +
                 ") AS pp;";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, productID);
        ps.setInt(2, quantity);
        ps.setInt(3, productID);
        ps.setDate(4, Date.valueOf(orderDate));

        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
public List<InvoiceProduct> getLatestInvoiceProductInfo()  {
    List<InvoiceProduct> invoiceProducts = new ArrayList<>();
    String sql = "SELECT P.productName, IP.quantity, PP.price " +
                          "FROM InvoiceProduct IP " +
                          "JOIN Product P ON IP.productID = P.productID " +
                          "JOIN PriceProduct PP ON IP.priceProductID = PP.priceProductID " +
                          "WHERE IP.totalInvoiceProductID = (SELECT MAX(totalInvoiceProductID) FROM TotalInvoiceProduct)";
    try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InvoiceProduct invoice = new InvoiceProduct(rs.getInt("quantity"),rs.getString("productName"),rs.getInt("price"));
                invoiceProducts.add(invoice);
            }
   } catch (Exception e) {
            System.out.println(e);
        }
        return invoiceProducts;

}

    public static void main(String[] args) throws Exception {
        
        InvoiceProductDAO dao = new InvoiceProductDAO();
        List<InvoiceProduct> list= dao.getLatestInvoiceProductInfo();
        for (InvoiceProduct o : list) {
               System.out.println(o);
        }
       
    }
}
