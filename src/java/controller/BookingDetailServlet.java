/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AdminBookingPitchHistoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import model.Account;
import model.AdminBookingPitchHistory;

/**
 *
 * @author thuan
 */
public class BookingDetailServlet extends HttpServlet {
   

   
     private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hanhdong = request.getParameter("hanhdong");
        switch (hanhdong) {
            case "chitiet":
                list(request, response);
                break;
            case "loc":
                find(request, response);
                break;
        }
    }
    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                HttpSession session = request.getSession();
        Object obj = session.getAttribute("khachHang");
        Account khachHang = null;
        if (obj != null) {
            khachHang = (Account) obj;
        }
        if (khachHang == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String totalInvoiceID = request.getParameter("totalInvoiceID");
        int role = khachHang.getRole();
        session.setAttribute("role", role);
        AdminBookingPitchHistoryDAO dao = new AdminBookingPitchHistoryDAO();
        List<AdminBookingPitchHistory> bookingDetails = dao.getBookingHistoryByTotalInvoiceID(totalInvoiceID);

        request.setAttribute("bookingDetails", bookingDetails);
        request.getRequestDispatcher("bookingdetail.jsp").forward(request, response);
    }
        protected void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminBookingPitchHistoryDAO dao = new AdminBookingPitchHistoryDAO();
        String selectedDateStr = request.getParameter("selectedDate");
        java.util.Date utilDate = null;
        java.sql.Date sqlDate = null;

        if (selectedDateStr != null && !selectedDateStr.isEmpty()) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                utilDate = sdf.parse(selectedDateStr);
                sqlDate = new java.sql.Date(utilDate.getTime());
            } catch (ParseException e) {
                e.printStackTrace(); // Xử lý ngoại lệ nếu có
            }
            System.out.println("date " + sqlDate);
            List<AdminBookingPitchHistory> purchaseHistories = dao.getBookingHistoryByDate(sqlDate);
            request.setAttribute("bookingHistories", purchaseHistories);
            request.getRequestDispatcher("adminbookingpitchhistory.jsp").forward(request, response);
        }
    }
}
