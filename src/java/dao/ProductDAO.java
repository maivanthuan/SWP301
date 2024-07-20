/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DB.DBContext;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Categories;
import model.Product;

public class ProductDAO extends DBContext {

    public Product selectById1(String t) {
        Product ketQua = null;
        String xName, xDescription, xSize, xImage, xCategoryID;
        int xProductID, xPrice;
        try {

        String sql = "DECLARE @currentDate DATE = GETDATE();\n"
                   + "SELECT TOP 1 p.*, pp.price\n"
                   + "FROM Product p\n"
                   + "JOIN PriceProduct pp ON p.productID = pp.productID\n"
                   + "WHERE p.productID = ?\n"
                   + "  AND @currentDate BETWEEN pp.timeStart AND pp.timeEnd\n"
                   + "ORDER BY pp.timeEnd DESC;";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, Integer.parseInt(t));

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                xProductID = rs.getInt("productID");
                xName = rs.getString("productName");
                xDescription = rs.getString("description");
                xSize = rs.getString("size");
                xImage = rs.getString("image");
                xCategoryID = rs.getString("categoryID");
                xPrice = rs.getInt("price");
                ketQua = new Product(xProductID, xName, xDescription, xSize,
                        xImage, xCategoryID, xPrice);
            }

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    public boolean deleteProduct(int productID) throws SQLException {
        String sql = "DELETE FROM Product where productID = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, productID);
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        return rowDeleted;
    }

    public List<Product> getAll(int pageNumber, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.productID, p.productName, p.description, p.size, p.image, p.categoryID, "
                + "(SELECT TOP 1 pp.price FROM PriceProduct pp "
                + "WHERE pp.productID = p.productID "
                + "AND ? BETWEEN pp.timeStart AND pp.timeEnd) AS price "
                + "FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY ProductID) AS RowNum FROM Product) AS p "
                + "WHERE RowNum BETWEEN ? AND ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            int startRow = (pageNumber - 1) * pageSize + 1;
            int endRow = pageNumber * pageSize;
            st.setInt(2, startRow);
            st.setInt(3, endRow);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Product c = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("size"), rs.getString("image"), rs.getString("categoryID"), rs.getInt("price"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getList() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.productID, p.productName, p.description, p.size, p.image, p.categoryID, "
                + "(SELECT TOP 1 pp.price FROM PriceProduct pp "
                + "WHERE pp.productID = p.productID "
                + "AND ? BETWEEN pp.timeStart AND pp.timeEnd "
                + "ORDER BY pp.priceProductID DESC) AS price "
                + "FROM Product p ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Product c = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("size"), rs.getString("image"), rs.getString("categoryID"), rs.getInt("price"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean insertProduct(Product product) throws SQLException {
        String sql = "INSERT INTO Product ( productName, description, size, image, categoryID) VALUES (?, ?, ?, ?, ?);";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, product.getName());
        statement.setString(2, product.getDescription());
        statement.setString(3, product.getSize());
        statement.setString(4, product.getImage());
        statement.setString(5, product.getCategoryID());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        return rowInserted;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        String sql = "DELETE FROM Product where productID = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, productID);
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        return rowDeleted;
    }

    public Product selectById1(Product t) {
        Product ketQua = null;
        String xName, xDescription, xSize, xImage, xCategoryID;
        int xPrice, xProductID;
        try {

            String sql = "SELECT * FROM Product WHERE productID=?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, t.getProductID());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                xProductID = rs.getInt("productID");
                xName = rs.getString("productName");
                xDescription = rs.getString("description");
                xSize = rs.getString("size");
                xImage = rs.getString("image");
                xCategoryID = rs.getString("categoryID");
                xPrice = rs.getInt("price");
                ketQua = new Product(xProductID, xName, xDescription, xSize,
                        xImage, xCategoryID, xPrice);
            }

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    public List<Product> searchByName(String txtSearch) throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT \n"
                + "    p.productID,\n"
                + "    p.productName,\n"
                + "    p.description,\n"
                + "    p.size,\n"
                + "    p.image,\n"
                + "    p.categoryID,\n"
                + "    pp.price,\n"
                + "    pp.timeStart,\n"
                + "    pp.timeEnd\n"
                + "FROM \n"
                + "    Product p \n"
                + "JOIN \n"
                + "    PriceProduct pp \n"
                + "ON \n"
                + "    p.productID = pp.productID\n"
                + "WHERE \n"
                + "    p.productName LIKE ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, "%" + txtSearch + "%");

        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            int productID = resultSet.getInt("productID");
            String productName = resultSet.getString("productName");
            String description = resultSet.getString("description");
            String size = resultSet.getString("size");
            String image = resultSet.getString("image");
            String categoryID = resultSet.getString("categoryID");
            int price = resultSet.getInt("price");

            Product product = new Product(productID, productName, description, size, image, categoryID, price);
            listProduct.add(product);
        }

        resultSet.close();
        statement.close();

        return listProduct;
    }

    public List<Product> getProductByCategoriesID(String categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.productID,p.productName,p.description,p.size,p.image,p.categoryID,pp.price,pp.timeStart,pp.timeEnd\n"
                + "FROM Product p JOIN PriceProduct pp ON p.productID = pp.productID "
                + "where categoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Product c = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getString("description"), rs.getString("size"), rs.getString("image"), rs.getString("categoryID"), rs.getInt("price"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNoOfRecords() {
        try {
            String sql = "SELECT COUNT(*) AS count FROM Product";
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

    public List<Product> sortByPriceAscending(List<Product> list) {
        Collections.sort(list, (Product p1, Product p2) -> Double.compare(p1.getPrice(), p2.getPrice()));
        return list;
    }

    public List<Product> sortByPriceDescending(List<Product> list) {
        Collections.sort(list, (Product p1, Product p2) -> Double.compare(p2.getPrice(), p1.getPrice()));
        return list;
    }

    public List<Product> getProductByProductID(int productID) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.productID, p.productName, p.description, p.size, p.image, p.categoryID,\n"
                + "(SELECT TOP 1 pp.price FROM PriceProduct pp \n"
                + " WHERE pp.productID = p.productID \n"
                + " AND ? BETWEEN pp.timeStart AND pp.timeEnd) AS price \n"
                + "FROM Product p \n"
                + "WHERE p.productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            st.setInt(2, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getString("description"),
                        rs.getString("size"),
                        rs.getString("image"),
                        rs.getString("categoryID"),
                        rs.getInt("price")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByProductID2(int productID) {
        String sql = "SELECT p.productID, p.productName, p.description, p.size, p.image, p.categoryID, "
                + "pp.timeStart, pp.timeEnd, "
                + "(SELECT TOP 1 pp.price FROM PriceProduct pp "
                + "WHERE pp.productID = p.productID "
                + "AND ? BETWEEN pp.timeStart AND pp.timeEnd "
                + "ORDER BY pp.priceProductID DESC) AS price "
                + "FROM Product p "
                + "LEFT JOIN PriceProduct pp ON p.productID = pp.productID "
                + "WHERE p.productID = ?";

        Product c = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            st.setInt(2, productID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                c = new Product(
                        rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getString("description"),
                        rs.getString("size"),
                        rs.getString("image"),
                        rs.getString("categoryID"),
                        rs.getInt("price"),
                        rs.getString("timeStart"),
                        rs.getString("timeEnd")
                );

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }

    public int updateProduct(Product p) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL

            // Bước 2: tạo ra đối tượng statement
            String sql = "UPDATE Product " + " SET " + " productName=?" + ", description=?"
                    + ", size=?" + ", image=?" + " WHERE productID=?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, p.getName());
            st.setString(2, p.getDescription());
            st.setString(3, p.getSize());
            st.setString(4, p.getImage());
            st.setInt(5, p.getProductID());
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

    public static void main(String[] args) throws SQLException {
        ProductDAO productDAO = new ProductDAO();
        //     List<Product> list = productDAO.getList();
        //       list = productDAO.sortByPriceDescending(list);
        //     for (Product o : list) {
        //       System.out.println(o);

        List<Product> list = productDAO.getProductByProductID(1);
        for (Product o : list) {
            System.out.println(o);
        }
    }
}
