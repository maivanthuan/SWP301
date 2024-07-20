/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.PriceProductDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import model.PriceProduct;
import model.Product;

/**
 *
 * @author thuan
 */
@MultipartConfig
public class CreateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pname = request.getParameter("name");
        String pdescription = request.getParameter("description");
        String psize = request.getParameter("size");
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dspq82lmr",
                "api_key", "977788362272316",
                "api_secret", "BY2hb1uuR_LyiFapfoJ4ig-yFok"
        ));
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String filePath = getServletContext().getRealPath("/") + File.separator + fileName;
        filePart.write(filePath);
        File fileToUpload = new File(filePath);
        Map uploadResult = cloudinary.uploader().upload(fileToUpload, ObjectUtils.emptyMap());
        String imageUrl = (String) uploadResult.get("url");
        int pprice = Integer.parseInt(request.getParameter("price"));
        String ptimestart = request.getParameter("timestart");
        String ptimeend = request.getParameter("timeend");
        String pcategoryid = request.getParameter("categoryid");
        ProductDAO dao = new ProductDAO();
        PriceProductDAO pdao = new PriceProductDAO();

        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate;
        Date sqlDate = new Date(0);
        Date sqlDate2 = new Date(0);

        try {
            utilDate = dt.parse(ptimestart); // Chuyển đổi chuỗi thành đối tượng java.util.Date
            sqlDate = new java.sql.Date(utilDate.getTime()); // Chuyển đổi java.util.Date thành java.sql.Date
            utilDate = dt.parse(ptimeend); // Chuyển đổi chuỗi thành đối tượng java.util.Date
            sqlDate2 = new java.sql.Date(utilDate.getTime()); // Chuyển đổi java.util.Date thành java.sql.Date
            System.out.println("dsayheeuiwqeyuwdhwqgdyuiwqgdhjwqgdjhwqgd ");
            System.out.println(sqlDate);
        } catch (ParseException ex) {
            java.util.logging.Logger.getLogger(CreateProductServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        Product product = new Product(1, pname, pdescription, psize, imageUrl, pcategoryid);
        PriceProduct priceproduct = new PriceProduct("", 1, pprice, sqlDate.toString(), sqlDate2.toString());

        try {
            dao.insertProduct(product);
            pdao.insertPriceProduct(priceproduct);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CreateProductServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        response.sendRedirect("productmanagerservlet");

    }
}
