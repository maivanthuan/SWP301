package dao;

import DB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import model.Product;
import model.TotalInvoicePitch;
import model.TotalInvoiceProduct;

/**
 *
 * @author boyin
 */
public class TotalInvoiceProductDAO extends DBContext{
    public List<Product> getProductByOrder(String id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*\n"
                + "      ,[quantity]\n"
                + "      ,pp.price\n"
                + "  FROM [SWPTest].[dbo].[InvoiceProduct] i join Product p on p.productID = i.productID join PriceProduct pp on pp.priceProductID = i.priceProductID where i.totalInvoiceProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("size"), rs.getString("image"), rs.getString("categoryID"), rs.getInt("price"),rs.getInt("quantity"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    // lay ra nhung don hang cua 1 khach hang
    public Vector<TotalInvoiceProduct> getOrderByUserID(int userID) {
        Vector<TotalInvoiceProduct> orderList = new Vector<>();
        String   sql = "SELECT o.*, u.userName, os.statusName " +
                     "FROM TotalInvoiceProduct o " +
                     "JOIN Account u ON o.userID = u.userID " +
                     "JOIN OrderStatus os ON o.orderStatusID = os.orderStatusID " +
                     "WHERE o.userID = ?";
        try {
            int id, totalInvoiceProductID, orderStatusID;
            String name, phoneNumber, address, orderDate;
            TotalInvoiceProduct order;
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("userID");
                name = rs.getString("name");
                phoneNumber = rs.getString("phoneNumber");
                address = rs.getString("address");
                orderDate = rs.getString("orderDate");
                orderStatusID = rs.getInt("orderStatusID");
                String statusName = rs.getString("statusName");
                totalInvoiceProductID = rs.getInt("totalInvoiceProductID");
                order = new TotalInvoiceProduct(id, userID, name, phoneNumber, address, orderDate, orderStatusID, statusName, totalInvoiceProductID);
                order.setTotal(rs.getDouble("totalPrice"));
                orderList.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderList;
    }
    public void createTotalInvoiceProduct(TotalInvoiceProduct totalInvoiceProduct) {
        try {
            String xSql = "INSERT INTO TotalInvoiceProduct ( userID, name, phoneNumber, address, orderDate, orderStatusID, totalPrice) "
                    + "VALUES (?, ?, ?, ?, ?, ?,?);";
            PreparedStatement st = connection.prepareStatement(xSql);
            st.setInt(1, totalInvoiceProduct.getUserID());
            st.setString(2, totalInvoiceProduct.getName());
            st.setString(3, totalInvoiceProduct.getPhone());
            st.setString(4, totalInvoiceProduct.getAddress());
            st.setDate(5, Date.valueOf(totalInvoiceProduct.getTime()));
            st.setInt(6, 1);
            st.setInt(7, (int)totalInvoiceProduct.getTotal());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
//
//    // lay ra tat ca nhung don hang
//    public Vector<Orders> getAllOrders() {
//        Vector<Orders> orderList = new Vector<>();
//        String sql = "SELECT o.*, u.username, os.status_name FROM TotalInvoiceProduct o\n"
//                + "join Users u on o.UserID = u.ID\n"
//                + "join OrderStatus os on o.StatusID = os.orderstatus_id ";
//
//        try {
//            int id, userID,totalPriceProductID, orderStatusID, invoiceProductID;
//            String name, phoneNumber, address, orderDate;
//            TotalInvoiceProduct order;
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                id = rs.getInt("ID");  
//                userID = rs.getInt("UserID");
//                name = rs.getString("Name");
//                phoneNumber = rs.getString("phonenumber");
//                address = rs.getString("Address");
//                orderDate = rs.getString("OrderDate");
//                orderStatusID = rs.getInt("OrderStatusID");
//                invoiceProductID = rs.getInt("InvoiceProductID");
//                totalPriceProductID = rs.getInt("TotalPriceProductID");
//                order = new TotalInvoiceProduct(id, userID, name, phoneNumber, address, orderDate, orderStatusID, invoiceProductID, totalPriceProductID);
//                orderList.add(order);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return orderList;
//    }
//
//    // tao 1 don hàng
//    public void createOrder(TotalInvoiceProduct order) {
//        try {
//            String sql = "INSERT INTO TotalInvoiceProduct (UserID, Name, phonenumber, Address, OrderDate, OrderStatusID, InvoiceProductID, TotalPriceProductID) "
//                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, order.getUserID());
//            ps.setString(2, order.getName());
//            ps.setString(3, order.getPhone());
//            ps.setString(4, order.getAddress());
//            ps.setString(5, order.getOrderDate());
//            ps.setInt(6, order.getOrderStatusID());
//            ps.setInt(7, order.getInvoiceProductID());
//            ps.setInt(8, order.getTotalPriceProductID());
//            ps.setInt(9, 1);
//            ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    public void nextStatus(int orderId) {
//        try {
//            // Tìm `StatusID` hiện tại của đơn hàng
//            String getStatusSql = "SELECT StatusID FROM TotalInvoiceProduct WHERE ID = ?";
//            PreparedStatement st = connection.prepareStatement(getStatusSql);
//            ResultSet rs = st.executeQuery();
//            st.setInt(1, orderId);
//            rs = st.executeQuery();
//
//            int currentStatus = 0;
//            if (rs.next()) {
//                currentStatus = rs.getInt("StatusID");
//            } else {
//                // Không tìm thấy đơn hàng với ID tương ứng
//                // Xử lý lỗi hoặc thông báo
//                return;
//            }
//
//            if (currentStatus < 3) {
//                // Chỉ tăng `StatusID` nếu nó nhỏ hơn 3
//                int newStatus = currentStatus + 1;
//
//                // Cập nhật `StatusID`
//                String updateStatusSql = "UPDATE TotalInvoiceProduct SET StatusID = ? WHERE ID = ?";
//                st = connection.prepareStatement(updateStatusSql);
//                st.setInt(1, newStatus);
//                st.setInt(2, orderId);
//                st.executeUpdate();
//            } else {
//                // Đã đạt đến trạng thái tối đa
//                // Có thể xử lý hoặc thông báo tùy theo nhu cầu
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    public static void main(String[] args) {
        TotalInvoiceProductDAO od = new TotalInvoiceProductDAO();
         List<TotalInvoiceProduct> list =od.getOrderByUserID(1);
         System.out.println(list.size());
        
    }
}



