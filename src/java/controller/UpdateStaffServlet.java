/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import model.Account;

/**
 *
 * @author thuan
 */
public class UpdateStaffServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String hanhdong = request.getParameter("hanhdong");
        System.out.println(hanhdong);
        switch (hanhdong) {
            case "chitiet":
                listAcc(request, response);
                break;
            case "capnhat":
                update(request, response);
                break;
        }
    } 
    protected void listAcc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("uID"));
        System.out.println("cccccccccccc");
        System.out.println(id);


        AccountDAO dao = new AccountDAO();
        Account a = dao.selectById1(id);
        System.out.println("dmmmmmdadamdamdamd"+a);

        request.setAttribute("ac", a);
        request.getRequestDispatcher("UpdateStaff.jsp").forward(request, response);
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
        doGet(request, response);
    }
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số từ yêu cầu và in ra để kiểm tra
        int id = Integer.parseInt(request.getParameter("uID"));
        

        // Lấy các thông tin khác từ yêu cầu
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        System.out.println(email);
        String dateOfBirth = request.getParameter("dob");

        AccountDAO dao = new AccountDAO();

        // Định dạng ngày tháng
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate;
        Date sqlDate = new Date(0);

        try {
            // Chuyển đổi chuỗi thành đối tượng java.util.Date và sau đó thành java.sql.Date
            utilDate = dt.parse(dateOfBirth);
            sqlDate = new java.sql.Date(utilDate.getTime());
            System.out.println("Ngày sinh (SQL Date): " + sqlDate);
        } catch (ParseException e) {
            // Xử lý ngoại lệ ParseException
            e.printStackTrace();
            // Có thể đặt thông báo lỗi và điều hướng đến trang lỗi
            request.setAttribute("errorMessage", "Ngày sinh không hợp lệ. Vui lòng kiểm tra lại.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }

        // Lấy thông tin tài khoản hiện tại từ cơ sở dữ liệu
        Account a = dao.selectById1(id);

        // Tạo đối tượng Account mới với các thông tin cập nhật
        Account a2 = new Account(id,name,gender,email,dateOfBirth,phoneNumber);
        System.out.println(a2.toString());
        // Cập nhật thông tin tài khoản trong cơ sở dữ liệu
        dao.updateStaff(a2, a2.getID());

        // Lấy lại thông tin tài khoản cập nhật từ cơ sở dữ liệu
        Account a3 = dao.selectById1(id);

        // Đặt tài khoản cập nhật làm thuộc tính trong yêu cầu
        request.setAttribute("ac", a3);

        // Chuyển tiếp yêu cầu đến "staffcontroller"
        response.sendRedirect("staffcontroller");
    }
}
