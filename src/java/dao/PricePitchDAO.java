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
import java.util.Random;
import java.util.UUID;
import model.BookingTime;
import model.Pitch;
import model.PricePitch;

/**
 *
 * @author Admin
 */
public class PricePitchDAO extends DBContext {

    public List<PricePitch> getAll() {
        List<PricePitch> list = new ArrayList<>();
        String sql = "select * from dbo.PricePitch";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PitchDAO pdao = new PitchDAO();

                Pitch p = pdao.getPitchByID(rs.getString("pitchID"));
                PricePitch c = new PricePitch(rs.getString("pricePitchID"), p, rs.getInt("price"), rs.getDate("timeStart").toString(), rs.getDate("timeEnd").toString());
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public PricePitch getPricePitchByID(String pricePitchID) {
        PricePitch pp = new PricePitch();
        String sql = "SELECT *\n"
                + "FROM PricePitch p\n"
                + "WHERE p.pricePitchID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pricePitchID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                PitchDAO pdao = new PitchDAO();
                Pitch p = pdao.getPitchByID(rs.getString("pitchID"));
                pp = new PricePitch(rs.getString("pricePitchID"), p, rs.getInt("price"), rs.getDate("timeStart").toString(), rs.getDate("timeEnd").toString());

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return pp;

    }

    public boolean deletePricePitch(String pitchID) throws SQLException {
        String sql = "DELETE FROM PricePitch where pitchID = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, pitchID);
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        return rowDeleted;
    }

public boolean insertPricePitch(PricePitch pricepitch) throws SQLException {
    String sql = "INSERT INTO PricePitch (pricePitchID, pitchID, price, timeStart, timeEnd) VALUES (?, ?, ?, ?, ?)";
    
    // Sử dụng Random để tạo số ngẫu nhiên có đúng 6 chữ số
    Random random = new Random();
    int randomNumber = random.nextInt(400000) + 100000; // Đảm bảo số ngẫu nhiên luôn có 6 chữ số

    // Chuyển số ngẫu nhiên thành chuỗi
    String randomID = String.valueOf(randomNumber);

    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setString(1, randomID);
    statement.setString(2, pricepitch.getPitchID().getPitchID());
    statement.setInt(3, pricepitch.getPrice());
    statement.setString(4, pricepitch.getTimeStart());
    statement.setString(5, pricepitch.getTimeEnd());
    
    boolean rowInserted = statement.executeUpdate() > 0;
    statement.close();
    return rowInserted;
}

    public static void main(String[] args) {
        PricePitchDAO dao = new PricePitchDAO();
//        dao.deletePricePitch();
        dao.getAll();
        System.out.println(dao.getAll().toString());
    }
}
