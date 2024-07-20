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
public class ProcessServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String num = request.getParameter("num");
        String productID = request.getParameter("productID");
        HashMap<Product, Integer> map = (HashMap<Product, Integer>) request.getSession().getAttribute("cart");
        if (map == null) {
            map = new HashMap<>();
        }
        ProductDAO productsDAO = new ProductDAO();
        Product product = productsDAO.selectById1(productID);
        int qua = Integer.parseInt(num);
        if (qua == -1) {
            if (map.get(product) == 1) {
                map.remove(product);
            } else {
                map.put(product, map.get(product) - 1);
            }
        } else {
            map.put(product, map.get(product) + 1);
        }
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}