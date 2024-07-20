/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author thuan
 */
public class DeleteStaffServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String uidParam = request.getParameter("uID");
    
    if (uidParam == null || uidParam.trim().isEmpty()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid 'uID' parameter");
        return;
    }
    
    try {
        int id = Integer.parseInt(uidParam);
        AccountDAO dao = new AccountDAO();
        
        dao.deleteStaffAccount(id);   
        
        response.sendRedirect("staffcontroller");
    } catch (NumberFormatException ex) {
        
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid 'uID' parameter format");
    }   catch (SQLException ex) {
            Logger.getLogger(DeleteStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
}
