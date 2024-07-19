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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import model.Account;
import model.Pitch;

/**
 *
 * @author Admin
 */
public class PitchDAO extends DBContext {

    public List<Pitch> getAll(int pageNumber, int pageSize) {
        List<Pitch> list = new ArrayList<>();
        String sql = "SELECT paged.pitchID, paged.pitchType, paged.status, paged.image\n"
                + "FROM (\n"
                + "    SELECT *, ROW_NUMBER() OVER (ORDER BY pitchID) AS RowNum \n"
                + "    FROM Pitch\n"
                + ") AS paged\n"
                + "WHERE paged.RowNum BETWEEN ? AND ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            int startRow = (pageNumber - 1) * pageSize + 1;
            int endRow = pageNumber * pageSize;
            st.setInt(1, startRow);
            st.setInt(2, endRow);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Pitch c = new Pitch(rs.getString("pitchID"), rs.getInt("pitchType"), rs.getInt("status"), rs.getString("image"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Pitch getPitchByID(String pitchID) {
        Pitch p = new Pitch();
        String sql = "SELECT \n"
                + "    p.pitchID, \n"
                + "    p.pitchType, \n"
                + "    p.status,\n"
                + "    p.image\n"
                + "FROM Pitch p\n"
                + "WHERE p.pitchID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pitchID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new Pitch(rs.getString("pitchID"), rs.getInt("pitchType"), rs.getInt("status"), rs.getString("image"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;

    }
    public Pitch getPitchByID1(String pitchID) {
        List<Pitch> list = new ArrayList<>();
        Pitch p=null;
        String sql = "SELECT p.pitchID, p.pitchType, p.status, p.image,"
                + "(SELECT TOP 1 pp.price FROM PricePitch pp "
                + "WHERE pp.pitchID = p.pitchID "
                + "AND ? BETWEEN pp.timeStart AND pp.timeEnd) AS price "
                + "FROM Pitch p\n"
                + "WHERE p.pitchID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            st.setString(2, pitchID);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                p = new Pitch(rs.getString("pitchID"), rs.getInt("pitchType"), rs.getInt("status"), rs.getString("image"),rs.getInt("price"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;
    }
//    public Pitch getPitchByID(String pitchID) {
//        Pitch p = new Pitch();
//        String sql = "SELECT\n"
//                + "    p.pitchID, \n"
//                + "    p.image, \n"
//                + "    p.status, \n"
//                + "    p.pitchType,\n"
//                + "    pp.price,\n"
//                + "    tip.bookTime\n"
//                + "FROM Pitch p\n"
//                + "JOIN PricePitch pp ON p.pitchID = pp.pitchID\n"
//                + "JOIN InvoicePitch ip ON p.pitchID = ip.pitchID AND pp.pricePitchID = ip.pricePitchID \n"
//                + "JOIN TotalInvoicePitch tip ON ip.totalInvoiceID = tip.totalInvoiceID\n"
//                + "WHERE p.pitchID = ?\n"
//                + "  AND tip.bookTime BETWEEN pp.timeStart AND pp.timeEnd";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, pitchID);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                p = new Pitch(rs.getString("pitchID"), rs.getInt("pitchType"), rs.getInt("status"), rs.getString("image"), rs.getInt("price"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return p;
//
//    }

    public int getNoOfRecords() {
        try {
            String sql = "SELECT COUNT(*) AS count FROM Pitch";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Pitch> getAvailablePitches(Date date, int bookTimeID) {
        List<Pitch> availablePitches = new ArrayList<>();
        String sql = "SELECT p.*, pp.price\n"
                + "FROM Pitch p\n"
                + "LEFT JOIN PricePitch pp ON p.pitchID = pp.pitchID\n"
                + "                       AND ? BETWEEN pp.timeStart AND pp.timeEnd\n"
                + "WHERE p.pitchID NOT IN (\n"
                + "    SELECT DISTINCT i.pitchID\n"
                + "    FROM InvoicePitch i\n"
                + "    JOIN TotalInvoicePitch t ON i.totalInvoiceID = t.totalInvoiceID\n"
                + "    WHERE t.bookTime = ? AND i.bookingTimeID = ?\n"
                + ")\n"
                + "AND p.pitchID NOT IN (\n"
                + "    SELECT DISTINCT m.pitchID\n"
                + "    FROM Match m\n"
                + "    WHERE CAST(m.date AS DATE) = ? AND m.bookingTimeID = ?\n"
                + ");";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setDate(1, date);
            stmt.setDate(2, date);
            stmt.setInt(3, bookTimeID);
            stmt.setDate(4, date);
            stmt.setInt(5, bookTimeID);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Pitch pitch = new Pitch(
                        rs.getString("pitchID"),
                        rs.getInt("pitchType"),
                        rs.getInt("status"),
                        rs.getString("image"),
                        rs.getInt("price")
                );
                availablePitches.add(pitch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return availablePitches;
    }

    public boolean insertPitch(Pitch pitch) throws SQLException {
        String sql = "INSERT INTO [dbo].[Pitch]\n"
                + "           ([pitchID]\n"
                + "           ,[pitchType]\n"
                + "           ,[image]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, pitch.getPitchID());
        statement.setInt(2, pitch.getPitchType());
        statement.setString(3, pitch.getImage());
        statement.setInt(4, 1);
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        return rowInserted;
    }

    public void editPitch(String pitchID, Pitch updatedPitch) {
        String sql = "UPDATE Pitch SET pitchType = ?,image = ?\n"
                + "WHERE pitchID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, updatedPitch.getPitchType());
            st.setString(2, updatedPitch.getImage());
            st.setString(3, pitchID);
            st.executeUpdate();
            String xSQL = "UPDATE PricePitch SET price = ?\n"
                    + " WHERE pitchID = ?";
            PreparedStatement stm = connection.prepareStatement(xSQL);
            stm.setInt(1, updatedPitch.getPrice());
            stm.setString(2, pitchID);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }
        public boolean deletePitch(String pitchID) throws SQLException {
        String sql = "DELETE FROM Pitch where pitchID = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, pitchID);
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        return rowDeleted;
    }
            public List<Pitch> getList() {
        List<Pitch> list = new ArrayList<>();
        String sql = "SELECT p.pitchID, p.pitchType, p.image, "
                + "(SELECT TOP 1 pp.price FROM PricePitch pp "
                + "WHERE pp.pitchID = p.pitchID "
                + "AND ? BETWEEN pp.timeStart AND pp.timeEnd) AS price "
                + "FROM Pitch p";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Pitch c = new Pitch(rs.getString("pitchID"), rs.getInt("pitchType"), rs.getString("image"), rs.getInt("price"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
                public Vector<Pitch> getAllPitch() {
        Vector<Pitch> pitchList = new Vector<>();
        String sql = "SELECT * FROM Pitch";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            int pitchType, price;
            String pitchID, image;
            Pitch pitch;
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                pitchID = rs.getString("pitchID");
                pitchType = rs.getInt("pitchType");
                image = rs.getString("image");
                price = rs.getInt("Price");
                Pitch pi = new Pitch(pitchID, pitchType, image, price);
                pitchList.add(pi);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pitchList;
    }
        

    public static void main(String[] args) {
        PitchDAO p = new PitchDAO();
        Pitch list = p.getPitchByID1("12321");
//        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.toString());
//        }

    }
}
