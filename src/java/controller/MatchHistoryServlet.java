/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.MatchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Match;

/**
 *
 * @author thuan
 */
public class MatchHistoryServlet extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        MatchDAO matchDAO = new MatchDAO();
        List<Match> list = matchDAO.getAll();
        request.setAttribute("matchHistory", list);
        request.getRequestDispatcher("ordermatch-history.jsp").forward(request, response);
    } 

}
