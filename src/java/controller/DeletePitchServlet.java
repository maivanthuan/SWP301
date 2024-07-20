/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PitchDAO;
import dao.PricePitchDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class DeletePitchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        delete(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("pitchID");
        System.out.println("pitch id "+id);
        PricePitchDAO pidao = new PricePitchDAO();
        PitchDAO dao = new PitchDAO();
        try {
            pidao.deletePricePitch(id);
            dao.deletePitch(id);
        } catch (SQLException ex) {
            Logger.getLogger(DeletePitchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("PitchManager");
    }
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
        }
    
}
