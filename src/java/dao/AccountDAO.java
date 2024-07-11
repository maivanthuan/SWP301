/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.jdi.connect.spi.Connection;
import dal.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from dbo.Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Account c = new Account(rs.getString("userID"), rs.getString("userName"), rs.getString("email"), rs.getString("name"), rs.getString("gender"),
                        rs.getString("dateOfBirth"), rs.getString("phoneNumber"), rs.getString("password"), rs.getInt("roleID"), rs.getString("avata"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public Account selectById1(Account t) {
        Account ketQua = null;
        String xUserName, xPassWord, xId, xEmail, xName, xGender, xPhoneNumber, xAvata;
        int xRole;
        String xDateOfBirth;
        try {

            String sql = "SELECT * FROM Account WHERE id=?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, t.getID());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                xUserName = rs.getString("userName");
                xPassWord = rs.getString("password");
                xId = rs.getString("ID");
                xEmail = rs.getString("email");
                xName = rs.getString("name");
                xGender = rs.getString("Gender");
                xDateOfBirth = rs.getString("dateOfBirth");
                xPhoneNumber = rs.getString("phoneNumber");
                xAvata = rs.getString("avata");
                xRole = rs.getInt("role");
                String otp = rs.getString("otp");
                Date timeEffective = rs.getDate("timeEffective");
                boolean statusOtp = rs.getBoolean("statusOtp");
                ketQua = new Account(xId, xUserName, xEmail, xName, xGender,
                        xDateOfBirth, xPhoneNumber, xPassWord, xRole, xAvata, otp, timeEffective, statusOtp);
            }

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }
    public Account selectById(Account t) {
        Account ketQua = null;
        String xUserName, xPassWord, xId, xEmail, xName, xGender, xPhoneNumber, xAvata;
        int xRole;
        String xDateOfBirth;
        try {

            String sql = "SELECT * FROM Account WHERE userName=?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, t.getUserName());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                xUserName = rs.getString("userName");
                xPassWord = rs.getString("password");
                xId = rs.getString("ID");
                xEmail = rs.getString("email");
                xName = rs.getString("name");
                xGender = rs.getString("Gender");
                xDateOfBirth = rs.getString("dateOfBirth");
                xPhoneNumber = rs.getString("phoneNumber");
                xAvata = rs.getString("avata");
                xRole = rs.getInt("role");
                String otp = rs.getString("otp");
                Date timeEffective = rs.getDate("timeEffective");
                boolean statusOtp = rs.getBoolean("statusOtp");
                ketQua = new Account(xId, xUserName, xEmail, xName, xGender,
                        xDateOfBirth, xPhoneNumber, xPassWord, xRole, xAvata, otp, timeEffective, statusOtp);
            }

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    public int updateVerifyInformation(Account t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL

            // Bước 2: tạo ra đối tượng statement
            String sql = "UPDATE Account " + " SET " + " otp=?" + ", timeEffective=?" + ", statusOtp=?" + " WHERE userName=?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, t.getOtp());
            st.setDate(2, (Date) t.getTimeEffective());
            st.setBoolean(3, t.getStatusOtp());
            st.setString(4, t.getUserName());
            // Bước 3: thực thi câu lệnh SQL

            System.out.println(sql);
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    public Account selectByUsernameAndPassWord(Account t) {
        Account ketQua = null;
        String xUserName, xPassWord, xId, xEmail, xName, xGender, xPhoneNumber, xAvata;
        int xRole;
        String xDateOfBirth;
        try {
            // Bước 1: tạo kết nối đến CSDL

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM Account WHERE userName=? and passWord=?";
            PreparedStatement st = connection.prepareStatement(sql);
            System.out.println(t.getUserName() + "/" + t.getPassword());
            st.setString(1, t.getUserName());
            st.setString(2, t.getPassword());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                xUserName = rs.getString("userName");
                xPassWord = rs.getString("passWord");
                xId = rs.getString("ID");
                xEmail = rs.getString("email");
                xName = rs.getString("name");
                xGender = rs.getString("Gender");
                xDateOfBirth = rs.getString("dateOfBirth");
                xPhoneNumber = rs.getString("phoneNumber");
                xAvata = rs.getString("avata");
                xRole = rs.getInt("role");
                String otp = rs.getString("otp");
                Date timeEffective = rs.getDate("timeEffective");
                boolean statusOtp = rs.getBoolean("statusOtp");
                ketQua = new Account(xId, xUserName, xEmail, xName, xGender,
                        xDateOfBirth, xPhoneNumber, xPassWord, xRole, xAvata, otp, timeEffective, statusOtp);
            }

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    public boolean changePassword(Account t) {
        int ketQua = 0;
        try {
            
            String sql = "UPDATE Account " + " SET " + " passWord=?" + " WHERE userName=?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, t.getPassword());
            st.setString(2, t.getUserName());
            // Bước 3: thực thi câu lệnh SQL

            System.out.println(sql);
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua > 0;
    }

    public int insert(Account c) {
        int ketQua = 0;
        String sql = "insert into Account(userName,email,name,gender,phoneNumber,dateOfBirth,passWord,role,avata)" + " values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, c.getUserName());
            st.setString(2, c.getEmail());
            st.setString(3, c.getName());
            st.setString(4, c.getGender());
            st.setString(5, c.getPhoneNumber());
            st.setString(6, c.getDateOfBirth());
            st.setString(7, c.getPassword());
            st.setInt(8, c.getRole());
            st.setString(9, c.getAvata());
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return ketQua;
    }

    public int updateInfo(Account t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL

            // Bước 2: tạo ra đối tượng statement
            String sql = "UPDATE account " + " SET " + " email=?" + ", name=?"
                    + ", gender=?" + ", dateOfBirth=?" + ", phoneNumber=?" + " WHERE id=?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, t.getEmail());
            st.setString(2, t.getName());
            st.setString(3, t.getGender());
            st.setString(4, t.getDateOfBirth());
            st.setString(5, t.getPhoneNumber());
            st.setString(6, t.getID());
            // Bước 3: thực thi câu lệnh SQL

            System.out.println(sql);
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }
    
    public boolean updatePassword(String email, String newPassword) {
        // Chuỗi truy vấn SQL
        String sql = "UPDATE Account SET password = ? WHERE email = ?";
        
        try {
            // Chuẩn bị câu lệnh SQL
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, newPassword);
                ps.setString(2, email);
                
                // Thực thi truy vấn
                int rowCount = ps.executeUpdate();
                
                // Kiểm tra xem có dòng dữ liệu nào được cập nhật không
                return rowCount > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Nếu không có dòng dữ liệu nào được cập nhật, trả về false
        return false;
    }
    public boolean TestUserName(String tenDangNhap) {
        boolean ketQua = false;
        try {

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM Account WHERE userName=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, tenDangNhap);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                ketQua = true;
            }

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }
    public boolean TestEmail(String email) {
        boolean ketQua = false;
        try {

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM Account WHERE email=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                ketQua = true;
            }

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }
    public Account login(String userName, String password) {
        String sql = "SELECT * FROM Account WHERE userName = ? AND passWord = ?";
        String xUserName, xPassWord, xId, xEmail, xName, xGender, xPhoneNumber, xAvata;
        int xRole;
        String xDateOfBirth;
        Account account = null;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            rs = st.executeQuery();
            while (rs.next()) {

                xUserName = rs.getString("userName");
                xPassWord = rs.getString("password");
                xId = rs.getString("ID");
                xEmail = rs.getString("email");
                xName = rs.getString("name");
                xGender = rs.getString("Gender");
                xDateOfBirth = rs.getString("dateOfBirth");
                xPhoneNumber = rs.getString("phoneNumber");
                xAvata = rs.getString("avata");
                xRole = rs.getInt("role");
                account = new Account(xId, xUserName, xEmail, xName, xGender,
                        xDateOfBirth, xPhoneNumber, xPassWord, xRole, xAvata);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }

    public static void main(String[] args) {
        Account t = new Account();
        t.setUserName("demo");
        t.setRole(3);
        t.setPassword("nhattruong");
        AccountDAO c = new AccountDAO();
        System.out.println(c.changePassword(t));

//        c.insert(new Account("a", "truongnguyen", "truongnguyenàas", "a", "b", "c", "d", "a", 3, "10"));
//        List<Account> list = c.getAll();
//        if (list == null) {
//            System.out.println("null");
//        } else {
//            for (Account b : list) {
//                System.out.println(b.getID());
//            }
//        }
//       Account ac =  new Account("", "truong", "", "", "", "", "", "a", 3, "");
//       Account kq = c.selectByUsernameAndPassWord(ac);
//       System.out.println(kq.getDateOfBirth());
    }
}
