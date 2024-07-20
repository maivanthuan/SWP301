/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DB.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Match;
import model.Pitch;
import model.PricePitch;
import model.TotalInvoicePitch;

/**
 *
 * @author Admin
 */
public class TotalInvoicePitchDAO extends DBContext {

    public List<TotalInvoicePitch> getAll() {
        List<TotalInvoicePitch> list = new ArrayList<>();
        String sql = "select * from dbo.TotalInvoicePitch";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDAO adao = new AccountDAO();
                Account a = adao.selectById1(rs.getInt("userID"));
                TotalInvoicePitch c = new TotalInvoicePitch(rs.getInt("totalInvoiceID"), a, rs.getDate("bookTime"));

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public TotalInvoicePitch getTotalInvoicePitchByID(int TotalInvoicePitchID) {
        TotalInvoicePitch c = new TotalInvoicePitch();
        String sql = "SELECT *\n"
                + "FROM TotalInvoicePitch p\n"
                + "WHERE p.totalInvoiceID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, TotalInvoicePitchID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                AccountDAO adao = new AccountDAO();
                Account a = adao.selectById1(rs.getInt("userID"));
                c = new TotalInvoicePitch(rs.getInt("totalInvoiceID"), a, rs.getDate("bookTime"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;

    }

    public void createTotalInvoicePitch(TotalInvoicePitch totalInvoicePitch) {
        try {
            String xSql = "INSERT INTO TotalInvoicePitch (  userID, bookTime, totalprice) "
                    + "VALUES (?, ?,?);";
            PreparedStatement st = connection.prepareStatement(xSql);
            st.setInt(1, totalInvoicePitch.getUserID().getID());
            st.setDate(2, (Date) totalInvoicePitch.getBookTime());
            st.setInt(3, totalInvoicePitch.getMatchID());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void createTotalInvoiceMatch(TotalInvoicePitch totalInvoicePitch) {
        try {
            String xSql = "INSERT INTO TotalInvoicePitch (  userID, bookTime,totalPrice, matchID) "
                    + "VALUES (?, ?,?,?);";
            PreparedStatement st = connection.prepareStatement(xSql);
            st.setInt(1, totalInvoicePitch.getUserID().getID());
            st.setDate(2, (Date) totalInvoicePitch.getBookTime());
            st.setInt(3, totalInvoicePitch.getTotalPrice());
            st.setInt(4,totalInvoicePitch.getMatchID());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteTotalInvoicePitch(int matchID) {
        String sql = "DELETE FROM TotalInvoicePitch WHERE matchID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, matchID);
            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Deleted invoice with matchID " + matchID);
            } else {
                System.out.println("No invoice found with matchID " + matchID);
            }

        } catch (SQLException e) {
            System.err.println("Error deleting invoice: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public int getTotalInvoiceID(int match) {
        int totalID= 0;
        String sql = "select totalInvoiceID from TotalInvoicePitch where matchID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, match);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                   totalID = resultSet.getInt("totalInvoiceID");

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalID;
    
    }
    public static void main(String[] args) {
        TotalInvoicePitchDAO tipdao = new TotalInvoicePitchDAO();
        int total = tipdao.getTotalInvoiceID(38);
        System.out.println(total);
    }
}
