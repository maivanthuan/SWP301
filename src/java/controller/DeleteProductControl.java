/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.PriceProductDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author thuan
 */
public class DeleteProductControl extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("pID"));
            PriceProductDAO pdao = new PriceProductDAO();
            ProductDAO dao = new ProductDAO(); 
       
        try {
            pdao.deletePriceProduct(id);
            dao.deleteProduct(id);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DeleteProductControl.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    
            response.sendRedirect("productmanagerservlet");
    } 
}
