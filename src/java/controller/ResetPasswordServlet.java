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
import jakarta.servlet.http.HttpSession;
import util.MaHoa;

/**
 *
 * @author Admin
 */
public class ResetPasswordServlet extends HttpServlet {
   
   private static final long serialVersionUID = 1L;
   

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        String email = (String) session.getAttribute("email");

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            // Lấy kết nối từ session
                        // Tạo đối tượng DAO
            AccountDAO accountDAO = new AccountDAO();
            newPassword = MaHoa.toSHA1(newPassword);
            // Gọi phương thức cập nhật mật khẩu từ DAO, truyền kết nối và email
            boolean updated = accountDAO.updatePassword(email, newPassword);

            // Kiểm tra xem mật khẩu đã được cập nhật thành công hay không
            if (updated) {
                request.setAttribute("status", "resetSuccess");
            } else {
                request.setAttribute("status", "resetFailed");
            }

            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("status", "passwordMismatch");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        }
    }

}
