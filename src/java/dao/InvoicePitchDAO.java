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
import model.Account;
import model.BookingTime;
import model.InvoicePitch;
import model.Pitch;
import model.PricePitch;
import model.TotalInvoicePitch;

/**
 *
 * @author Admin
 */
public class InvoicePitchDAO extends DBContext {

    public List<InvoicePitch> getAll() {
        List<InvoicePitch> list = new ArrayList<>();
        String sql = "SELECT * FROM InvoicePitch";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PitchDAO pdao = new PitchDAO();
                PricePitchDAO ppdao = new PricePitchDAO();
                TotalInvoicePitchDAO ttdao = new TotalInvoicePitchDAO();
                BookingTimeDAO bkdao = new BookingTimeDAO();
                Pitch p = pdao.getPitchByID(rs.getString("pitchID"));
                PricePitch pp = ppdao.getPricePitchByID(rs.getString("pricePitchID"));
                TotalInvoicePitch tt = ttdao.getTotalInvoicePitchByID(rs.getInt("totalInvoiceID"));
                BookingTime bk = bkdao.getBookingTimeByID(rs.getInt("bookingTimeID"));
                InvoicePitch c = new InvoicePitch(rs.getInt("invoicePitchID"), p, pp, tt, bk);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public InvoicePitch getInvoicePitchByID(int InvoicePitchID) {
        InvoicePitch c = new InvoicePitch();
        String sql = "SELECT * FROM InvoicePitch WHERE totalInvoiceID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, InvoicePitchID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PitchDAO pdao = new PitchDAO();
                PricePitchDAO ppdao = new PricePitchDAO();
                TotalInvoicePitchDAO ttdao = new TotalInvoicePitchDAO();
                BookingTimeDAO bkdao = new BookingTimeDAO();
                Pitch p = pdao.getPitchByID(rs.getString("pitchID"));
                PricePitch pp = ppdao.getPricePitchByID(rs.getString("pricePitchID"));
                TotalInvoicePitch tt = ttdao.getTotalInvoicePitchByID(rs.getInt("totalInvoiceID"));
                BookingTime bk = bkdao.getBookingTimeByID(rs.getInt("bookingTimeID"));
                c = new InvoicePitch(rs.getInt("invoicePitchID"), p, pp, tt, bk);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;

    }

    public void RemoveInvoicePitchByID(int InvoicePitchID) {
        String sql = "DELETE FROM InvoicePitch WHERE invoicePitchID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, InvoicePitchID);
             int rowsAffected = st.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("Bảng ghi đã được xóa thành công.");
        } else {
            System.out.println("Không có bản ghi nào được xóa.");
        }
        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    public int getTotalPriceByMonth(int month) {
        String sql = "SELECT SUM(totalPrice) FROM totalInvoicePitch WHERE MONTH(bookTime) = ? and YEAR(bookTime) = YEAR(GETDATE())";

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
        String sql = "SELECT SUM(totalPrice) FROM TotalInvoicePitch WHERE YEAR(bookTime) = ?";

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
    public void createInvoicePitch(String pitchID, int  bookingTimeID) {
    String sql = "INSERT INTO InvoicePitch ( totalInvoiceID, pitchID,bookingTimeID,pricePitchID) "
               + "SELECT MAX(total.totalInvoiceID), ?, ?, "
               + "(SELECT pricePitchID FROM PricePitch WHERE pitchID = ?)"
               + "FROM TotalInvoicePitch total;";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setString(1, pitchID);
        ps.setInt(2, bookingTimeID);
        ps.setString(3, pitchID);

        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    public List<InvoicePitch> getLatestInvoicePitchInfo() throws SQLException {
    List<InvoicePitch> invoicePitchs = new ArrayList<>();
    String sql = "SELECT P.pitchID, P.pitchType, PP.price, BT.time " +
                 "FROM InvoicePitch IP " +
                 "JOIN Pitch P ON IP.pitchID = P.pitchID " +
                 "JOIN PricePitch PP ON IP.pricePitchID = PP.pricePitchID " +
                 "JOIN BookingTime BT ON IP.bookingTimeID = BT.bookingTimeID " +
                 "WHERE IP.totalInvoiceID = (SELECT MAX(totalInvoiceID) FROM TotalInvoicePitch)";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            PitchDAO pdao = new PitchDAO();
            String pitchID = rs.getString("pitchID");
            String pitchType = rs.getString("pitchType");
            int price = rs.getInt("price");
            String bookTime = rs.getString("time");

            // Tạo đối tượng Pitch từ pitchID
            
            Pitch p = pdao.getPitchByID(rs.getString("pitchID"));

            // Tạo đối tượng InvoiceProduct và thêm vào danh sách
            InvoicePitch invoicePitch = new InvoicePitch(p, price, bookTime, pitchType);
            invoicePitchs.add(invoicePitch);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return invoicePitchs;
}
        public void deleteInvoicePitch(int totalID) {
        String sql = "DELETE FROM InvoicePitch WHERE totalInvoiceID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, totalID);
            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Deleted invoice with matchID " + totalID);
            } else {
                System.out.println("No invoice found with matchID " + totalID);
            }

        } catch (SQLException e) {
            System.err.println("Error deleting invoice: " + e.getMessage());
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        InvoicePitchDAO ivdal = new InvoicePitchDAO();
        ivdal.RemoveInvoicePitchByID(2);
    }
}
