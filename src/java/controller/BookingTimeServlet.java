/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.BookingTimeDAO;
import dao.InvoicePitchDAO;
import dao.PitchDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;
import model.BookingTime;
import model.Pitch;
import java.sql.Date;
import java.text.ParseException;
import model.Account;
import model.InvoicePitch;

/**
 *
 * @author Admin
 */
public class BookingTimeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookingTimeDAO dal = new BookingTimeDAO();
        List<BookingTime> list = dal.getAll();
        request.setAttribute("bktList", list);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("pitchInfo.jsp");
        dispatcher.forward(request, response);
    }

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    String url = "";
    String baoLoi = "";
    PitchDAO dao = new PitchDAO();
    request.setAttribute("baoLoi", baoLoi);

    String action = request.getParameter("action");

    if (baoLoi.length() > 0) {
        url = "/Register.jsp";
    } else {
        Object obj = request.getSession().getAttribute("khachHang");
        Account khachHang = null;
        if (obj != null) {
            khachHang = (Account) obj;
        }
        switch (action) {
            case "1":
                String pitchID = request.getParameter("pitchID");
                Pitch pitch = dao.getPitchByID(pitchID);
                System.out.println("anh dep trai " + pitchID);
                request.setAttribute("pitchID", pitchID);
                request.setAttribute("pitch", pitch);
                url = "/pitchInfo.jsp";
                break;
            case "2":
                String pitch1 = request.getParameter("pitch");
                if (pitch1 == null || pitch1.isEmpty()) {
                    baoLoi = "Pitch không hợp lệ";
                    url = "/error.jsp";
                    request.setAttribute("baoLoi", baoLoi);
                    break;
                }
                PitchDAO pdal = new PitchDAO();
                Pitch pitch2 = pdal.getPitchByID(pitch1);
                if (pitch2 == null) {
                    baoLoi = "Pitch không tồn tại";
                    url = "/error.jsp";
                    request.setAttribute("baoLoi", baoLoi);
                    break;
                }
                System.out.println("ccccccc2");
                String date = request.getParameter("date");
                if (date == null || date.isEmpty()) {
                    baoLoi = "Ngày tháng không hợp lệ";
                    url = "/error.jsp";
                    request.setAttribute("baoLoi", baoLoi);
                    break;
                }
                System.out.println(date);
                SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");

                java.util.Date utilDate;
                Date sqlDate = new Date(0);
                try {
                    utilDate = dt.parse(date); // Chuyển đổi chuỗi thành đối tượng java.util.Date
                    sqlDate = new java.sql.Date(utilDate.getTime()); // Chuyển đổi java.util.Date thành java.sql.Date
                    System.out.println("dsayheeuiwqeyuwdhwqgdyuiwqgdhjwqgdjhwqgd ");
                    System.out.println(sqlDate);
                } catch (ParseException e) {
                    // Xử lý ngoại lệ ParseException ở đây
                    e.printStackTrace();
                    // Hoặc có thể set baoLoi và điều hướng đến trang lỗi
                    baoLoi = "Ngày tháng không hợp lệ";
                    url = "/error.jsp";
                    request.setAttribute("baoLoi", baoLoi);
                    break;
                }

                BookingTimeDAO bkt = new BookingTimeDAO();
                List<BookingTime> bktList = bkt.getAll();
                InvoicePitchDAO iv = new InvoicePitchDAO();
                List<InvoicePitch> ivList = iv.getAll();
                for (InvoicePitch ivp : ivList) {
                    if (ivp.getTotalInvoicePitchID() != null && ivp.getTotalInvoicePitchID().getBookTime() != null
                            && sqlDate.compareTo(ivp.getTotalInvoicePitchID().getBookTime()) == 0) {
                        if (ivp.getPitchID() != null && ivp.getPitchID().getPitchID().equals(pitch1)) {

                            for (int i = 0; i < bktList.size(); i++) {
                                if (bktList.get(i).getBookingTimeID() == ivp.getBookingTimeID().getBookingTimeID()) {
                                    bktList.remove(i);
                                }
                            }
                        }
                    }
                }
                request.setAttribute("bookList", bktList);
                session.setAttribute("date", sqlDate);
                request.setAttribute("pitch2", pitch2);
                System.out.println(bktList.toString());
                System.out.println(date);
                System.out.println(bktList.size());
                url = "/bookPitch.jsp";

                break;

            default:
                throw new AssertionError();
        }
    }

    RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
    rd.forward(request, response);
}

    

}
