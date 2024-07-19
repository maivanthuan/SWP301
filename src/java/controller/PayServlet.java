/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import static com.sun.xml.internal.ws.spi.db.BindingContextFactory.LOGGER;
import dao.PitchDAO;
import dao.PricePitchDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import model.Account;
import model.Pitch;
import model.PricePitch;

/**
 *
 * @author Admin
 */
public class PayServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    HttpSession session = request.getSession();
    String[] bookPitch = request.getParameterValues("bookPitch");

    if (bookPitch == null) {
        bookPitch = new String[0];
    }

    session.setAttribute("bookList", bookPitch);

    String pitchID = request.getParameter("pitch2");
    if (pitchID != null) {
        session.setAttribute("pitchID", pitchID);
    } else {
        // Xử lý khi pitchID là null, có thể gán giá trị mặc định hoặc thông báo lỗi
        session.setAttribute("pitchID", "");  // Gán giá trị mặc định là chuỗi rỗng
    }

    int numberOfSelectedPitch = bookPitch.length;
    int totalPrice = 0;

    if (pitchID != null && !pitchID.isEmpty()) {
        PricePitchDAO ppdal = new PricePitchDAO();
        List<PricePitch> listpp = ppdal.getAll();
        for (PricePitch pricePitch : listpp) {
            if (pricePitch.getPitchID().getPitchID().equals(pitchID)) {
                totalPrice = pricePitch.getPrice() * numberOfSelectedPitch;
                System.out.println("gia "+totalPrice);
                break;  // Exit the loop once the matching pitch is found
            }
        }
    }

    request.setAttribute("total", totalPrice);

    Account khachHang = (Account) session.getAttribute("khachHang");
    if (khachHang == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    RequestDispatcher dispatcher;
    if (khachHang.getRole() == 3) {
        dispatcher = request.getRequestDispatcher("payPitch.jsp");
    } else if (khachHang.getRole() == 2) {
        dispatcher = request.getRequestDispatcher("payStaff.jsp");
    } else {
        // Handle other roles if needed, or default behavior
        response.sendRedirect("error.jsp");
        return;
    }

    dispatcher.forward(request, response);
}

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
////        doGet(request, response);
//      HttpSession session = request.getSession(); 
//      String pitchID = request.getParameter("pitchID");
//      PitchDAO dal = new PitchDAO();
//      Pitch pitch = dal.getPitchByID1(pitchID);
//      request.setAttribute("total", pitch.getPrice());
//      RequestDispatcher dispatcher = request.getRequestDispatcher("payPitch.jsp");
//      dispatcher.forward(request, response);
//      
//    } 

}
