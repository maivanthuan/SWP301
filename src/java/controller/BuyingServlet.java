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
public class BuyingServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyingServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {               
        String num = request.getParameter("num");
        String productID = request.getParameter("productID");
        HashMap<Product,Integer> map = (HashMap<Product,Integer>) request.getSession().getAttribute("cart");
        if(map == null){
            map = new HashMap<>();
        }
        ProductDAO productsDAO = new ProductDAO();
        Product product = productsDAO.selectById1(productID);
        if(map.containsKey(product)){
            map.put(product, map.get(product) + Integer.parseInt(num));
        }
        else {
            map.put(product, Integer.parseInt(num));
        }
        String txt = "";
        Cookie[] cookies = request.getCookies();
        for(Cookie i : cookies){
            if(i.getName().equals("cart")){
                i.setMaxAge(0);
                response.addCookie(i);
                break;
            }
        }   
        for(Product i : map.keySet()){
            txt += "/" + i.getProductID() + "/" + map.get(i);
        }
        request.getSession().setAttribute("cart", map);
        txt = txt.substring(1);
        Cookie cookie = new Cookie("cart", txt);
        cookie.setMaxAge(7 * 60 * 60);
        response.addCookie(cookie);
        String referer = request.getHeader("referer");
        response.sendRedirect(referer);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

