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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PriceProduct;
import model.Product;

/**
 *
 * @author thuan
 */
@MultipartConfig
public class UpdateProductControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("pID"));
        System.out.println("cccccccccccc");
        System.out.println(id);


        ProductDAO dao = new ProductDAO();
        PriceProductDAO ppdao = new PriceProductDAO();
        Product p = dao.getProductByProductID2(id);
        System.out.println("dmmmmmdadamdamdamd");
        System.out.println(p.getPrice());

        request.setAttribute("pr", p);
        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("pID"));
        System.out.println("cccccccccccc");
        System.out.println(id);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String size = request.getParameter("size");
        ProductDAO dao = new ProductDAO();
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dspq82lmr",
                "api_key", "977788362272316",
                "api_secret", "BY2hb1uuR_LyiFapfoJ4ig-yFok"
        ));
        Part filePart = request.getPart("file");
        String imageUrl = dao.getProductByProductID2(id).getImage();
        String fileName = filePart.getSubmittedFileName();
        if (!fileName.isEmpty()) {           
            String filePath = getServletContext().getRealPath("/") + File.separator + fileName;
            filePart.write(filePath);
            File fileToUpload = new File(filePath);
            Map uploadResult = cloudinary.uploader().upload(fileToUpload, ObjectUtils.emptyMap());
            imageUrl = (String) uploadResult.get("url");
        }
        int price = Integer.parseInt(request.getParameter("price"));
        System.out.println("cccLz Hiiep");
        System.out.println(price);
        String timestart = request.getParameter("timestart");
        String timeend = request.getParameter("timeend");
        ProductDAO dal = new ProductDAO();
        PriceProductDAO ppdao = new PriceProductDAO();
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate;
        Date sqlDate = new Date(0);
        Date sqlDate2 = new Date(0);
         
        try {
            utilDate = dt.parse(timestart); // Chuyển đổi chuỗi thành đối tượng java.util.Date
            sqlDate = new java.sql.Date(utilDate.getTime()); // Chuyển đổi java.util.Date thành java.sql.Date
                          utilDate = dt.parse(timeend); // Chuyển đổi chuỗi thành đối tượng java.util.Date
                        sqlDate2 = new java.sql.Date(utilDate.getTime()); // Chuyển đổi java.util.Date thành java.sql.Date
                        System.out.println("dsayheeuiwqeyuwdhwqgdyuiwqgdhjwqgdjhwqgd ");
                        System.out.println(sqlDate);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateProductControl.class.getName()).log(Level.SEVERE, null, ex);
        }
                 
        Product p = dao.getProductByProductID2(id);
        Product p2 = new Product(p.getProductID(), name, description, size, imageUrl, p.getCategoryID());
        dao.updateProduct(p2);
        PriceProduct pp = new PriceProduct("1", p.getProductID(), price, sqlDate.toString(), sqlDate2.toString());
        
        try {
            ppdao.insertPriceProduct2(pp);
        } catch (SQLException ex) {
            System.out.println("nguuuuuuuuuuuuuuuuu");
           
        }
        
        Product p3 =dao.getProductByProductID2(p.getProductID());
        request.setAttribute("pr", p3);
        request.getRequestDispatcher("productmanagerservlet").forward(request, response);
    }
}
