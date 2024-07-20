/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import model.Product;

/**
 *
 * @author Admin
 */
public class RemoveServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String productID = request.getParameter("id");
        HashMap<Product, Integer> map = (HashMap<Product, Integer>) request.getSession().getAttribute("cart");
        ProductDAO productsDAO = new ProductDAO();
        Product product = productsDAO.selectById1(productID);
        map.remove(product);
        String txt = "";
        Cookie[] cookies = request.getCookies();
        for (Cookie i : cookies) {
            if (i.getName().equals("cart")) {
                i.setMaxAge(0);
                response.addCookie(i);
                break;
            }
        }
        for (Product i : map.keySet()) {
            txt += "/" + i.getProductID() + "/" + map.get(i);
        }
        if (!txt.isEmpty()) {
            txt = txt.substring(1);
            Cookie cookie = new Cookie("cart", txt);
            cookie.setMaxAge(7 * 60 * 60);
            response.addCookie(cookie);
        }
        request.getSession().setAttribute("cart", map);
        response.sendRedirect("show");
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}