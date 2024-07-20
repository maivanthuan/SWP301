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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Match;

/**
 *
 * @author thuan
 */
public class MatchDAO extends DBContext {

    public List<Match> listFindCompetitor() {
        List<Match> matchList = new ArrayList<>();
        String query = "SELECT m.matchID, m.nameTeam1, m.userID1, m.userID2, m.date, sm.statusMatchName, m.pitchID, bt.time AS bookTime, m.price, sm.statusMatchID "
                + "FROM Match m "
                + "JOIN StatusMatch sm ON m.statusMatchID = sm.statusMatchID "
                + "JOIN BookingTime bt ON m.bookingTimeID = bt.bookingTimeID "
                + "JOIN Pitch p ON m.pitchID = p.pitchID "
                + "WHERE m.statusMatchID IN (1, 2) "
                + "AND m.date > CURRENT_TIMESTAMP";

        try (PreparedStatement statement = connection.prepareStatement(query)) {

            // Set parameter for the prepared statement
            // Execute the query and process the ResultSet
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int matchID = resultSet.getInt("matchID");
                    int userID1 = resultSet.getInt("userID1");
                    int userID2 = resultSet.getInt("userID2");
                    String pitchID = resultSet.getString("pitchID");
                    String booktTime = resultSet.getString("bookTime");
                    Date date = resultSet.getDate("date");
                    int price = resultSet.getInt("price");
                    String nameTeam = resultSet.getString("nameTeam1");
                    String statusMatchName = resultSet.getString("statusMatchName");
                    int statusMatchID = resultSet.getInt("statusMatchID");

                    Match listMatch = new Match(matchID, nameTeam, userID1, userID2, date, statusMatchName, statusMatchID, pitchID, booktTime, price);
                    matchList.add(listMatch);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return matchList;
    }

    public void createMatch(Match match) {
        try {
            String xSql = "INSERT INTO Match ( userID1, date, statusMatchID, bookingTimeID, price, nameTeam1, pitchID) "
                    + "VALUES (?, ?, ?, ?, ?, ?,?);";
            PreparedStatement st = connection.prepareStatement(xSql);
            st.setInt(1, match.getUserID1());
            st.setDate(2, match.getDate());
            st.setInt(3, 1);
            st.setInt(4, match.getBookingTimeID());
            st.setInt(5, match.getPrice());
            st.setString(6, match.getNameTeam());
            st.setString(7, match.getPitchID());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateMatch(int userID2, int matchID, String nameTeam2) {
        try {
            String sql = "UPDATE Match\n"
                    + "                    SET userID2 = ?,\n"
                    + "                        statusMatchID = ?,\n"
                    + "                   nameTeam2 = ?\n"
                    + "                    WHERE matchID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID2);
            st.setInt(2, 2);
            st.setString(3, nameTeam2);
            st.setInt(4, matchID);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Match getMatchByID(int ID) {
        Match match = null;
        String sql = "SELECT * from Match where matchID = ?;";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, ID);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int matchID = resultSet.getInt("matchID");
                    int userID1 = resultSet.getInt("userID1");
                    int userID2 = resultSet.getInt("userID2");
                    Date date = resultSet.getDate("date");
                    int statusMatchID = resultSet.getInt("statusMatchID");
                    int bookingTimeID = resultSet.getInt("bookingTimeID");
                    int price = resultSet.getInt("price");
                    String nameTeam1 = resultSet.getString("nameTeam1");
                    String pitchID = resultSet.getString("pitchID");
                    String nameTeam2 = resultSet.getString("nameTeam2");
                    match = new Match(matchID, nameTeam1, nameTeam2, userID1, userID2, date, statusMatchID, pitchID, bookingTimeID, price);

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return match;
    }

    public void cancel1(int match) throws SQLException {
        String sql = "UPDATE Match "
                + "SET userID2 = NULL, statusMatchID = 1"
                + "WHERE matchID = ?;";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, match);
        st.executeUpdate();
    }

    public void cancel2(int match) {
        String sql = "DELETE FROM Match "
                + "WHERE matchID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, match);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Match getMatch() {
        Match match = new Match();
        String sql = "SELECT * "
                + "FROM Match"
                + " WHERE matchID = (SELECT MAX(matchID) FROM Match);";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int matchID = resultSet.getInt("matchID");
                    int userID1 = resultSet.getInt("userID1");
                    int userID2 = resultSet.getInt("userID2");
                    Date date = resultSet.getDate("date");
                    int statusMatchID = resultSet.getInt("statusMatchID");
                    int bookingTimeID = resultSet.getInt("bookingTimeID");
                    int price = resultSet.getInt("price");
                    String nameTeam1 = resultSet.getString("nameTeam1");
                    String pitchID = resultSet.getString("pitchID");
                    String nameTeam2 = resultSet.getString("nameTeam2");
                    match = new Match(matchID, nameTeam1, nameTeam2, userID1, userID2, date, statusMatchID, pitchID, bookingTimeID, price);

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return match;
    }

    public List<Match> getAll() {
        List<Match> list = new ArrayList<>();
        try {
            AccountDAO accountDAO = new AccountDAO();
            String sql = "SELECT matchID,userID1,userID2,date,sm.statusMatchID,sm.statusMatchName,bk.bookingTimeID,bk.time,price,nameTeam1,nameTeam2,p.pitchID\n"
                    + "FROM Match m join StatusMatch sm on m.statusMatchID = sm.statusMatchID join BookingTime bk on m.bookingTimeID = bk.bookingTimeID\n"
                    + "join Pitch p on m.pitchID = p.pitchID";
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Match match = new Match();
                match.setMatchID(rs.getInt(1));
                match.setUserID1(rs.getInt(2));
                match.setUserID2(rs.getInt(3));
                match.setAcc1(accountDAO.selectById1(rs.getInt(2)));
                match.setAcc2(accountDAO.selectById1(rs.getInt(3)));
                match.setDate(rs.getDate(4));
                match.setStatusMatchID(rs.getInt(5));
                match.setStatusMatchName(rs.getString(6));
                match.setBookingTimeID(rs.getInt(7));
                match.setBookTime(rs.getString(8));
                match.setPrice(rs.getInt(9));
                match.setNameTeam1(rs.getString(10));
                match.setNameTeam2(rs.getString(11));
                match.setPitchID(rs.getString(12));
                list.add(match);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        MatchDAO dao = new MatchDAO();
        List<Match> list = new ArrayList<>();
        list = dao.getAll();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }

    }
}
