/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MatchDAO;
import dao.PitchDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Pitch;

/**
 *
 * @author thuan
 */
public class SearchPitchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String hanhdong = request.getParameter("hanhdong");
        System.out.println("hanhdong" + hanhdong);
        session.setAttribute("hanhdong", hanhdong);
        if (hanhdong == null) {
            hanhdong = "default";
        }
        switch (hanhdong) {
            case "search":
                search(request, response);
                break;
            case "datsan":
                comfirm(request, response);
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//       String date = request.getParameter("date");
//        int booktime = Integer.parseInt(request.getParameter("booktime"));
//        PitchDAO dal = new PitchDAO();
//        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
//        java.util.Date utilDate;
//        Date sqlDate = new Date(0);
//        try {
//            utilDate = dt.parse(date); 
//            sqlDate = new java.sql.Date(utilDate.getTime()); 
//        } catch (ParseException ex) {
//            Logger.getLogger(SearchPitchServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        List<Pitch> plist = dal.getAvailablePitches(sqlDate, booktime);
//        request.setAttribute("plist",plist);
//        session.setAttribute("date", sqlDate);
//       RequestDispatcher dispatcher = request.getRequestDispatcher("resultSearchPitch.jsp");
//       dispatcher.forward(request, response);
        doGet(request, response);
    }
    protected void search(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        try {
            PitchDAO pitchDAO = new PitchDAO();
            String dateString = request.getParameter("date");
            String booktimeString = request.getParameter("booktime");
            Date date = Date.valueOf(dateString);
            System.out.println("dateedeeeee");
            System.out.println(date);
            int booktime = Integer.parseInt(booktimeString);    
            List<Pitch> listMatch = pitchDAO.getAvailablePitches(date, booktime);
            System.out.println("sdadhjksahdjsahdaksj");
            System.out.println(listMatch.toString());
            session.setAttribute("dateMatch", date);
            session.setAttribute("booktime", booktime);
            request.setAttribute("listMatchAvailable", listMatch);
            request.getRequestDispatcher("resultSearchPitch.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request");
            } catch (IOException ex) {
                Logger.getLogger(SearchPitchServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
            protected void comfirm(HttpServletRequest request, HttpServletResponse response) throws IOException  {
        HttpSession session = request.getSession();
        MatchDAO matchDAO = new MatchDAO();
        Object obj = session.getAttribute("khachHang");
        Account khachHang = null;
        if (obj != null && obj instanceof Account) {
            khachHang = (Account) obj;
        }
        if (khachHang == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        try {
            int price = Integer.parseInt(request.getParameter("price"));
            System.out.println(price);;
            String pitchID = request.getParameter("pitchID");
            System.out.println(pitchID);
            session.setAttribute("amount", price);
            request.setAttribute("total", price);
            session.setAttribute("pitchID", pitchID);
            String hanhdong= "datsan";
            System.out.println(price);
            RequestDispatcher dispatcher = request.getRequestDispatcher("payMatch.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request");
        }
    }
    }
    
