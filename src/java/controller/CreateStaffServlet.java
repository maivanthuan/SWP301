/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import util.Email;
import util.MaHoa;

/**
 *
 * @author thuan
 */
public class CreateStaffServlet extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pusername = request.getParameter("username");
        System.out.println(pusername);
        String pname = request.getParameter("name");
        String pgender = request.getParameter("gender");
        String pphonenumber = request.getParameter("phonenumber");
        String ppassword = request.getParameter("password");
        String pemail = request.getParameter("email");
        String pdateOfBirth = request.getParameter("dateOfBirth");
        String baoLoi = "";
        String ppassword1=null;
        AccountDAO accountDAO = new AccountDAO();

        if (accountDAO.TestUserName(pusername)) {
            baoLoi += "Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác.<br/>";
        }
        if (accountDAO.TestEmail(pemail)) {
            baoLoi += "Email đã tồn tại, vui lòng chọn email khác.<br/>";
        }else {
                 ppassword1 = MaHoa.toSHA1(ppassword  );
            }
        request.setAttribute("baoLoi", baoLoi);

        if (baoLoi.length() > 0) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/CreateStaff.jsp");
            rd.forward(request, response);
        } else {
            AccountDAO dao = new AccountDAO();
            Account account = new Account(4, pusername, pemail, pname, pgender, pdateOfBirth, pphonenumber, ppassword1, 2, "1", true);
            dao.insertStaff(account);

            Email.sendEmail(account.getEmail(), "Comfirm account", getNoiDung(account,ppassword));

            response.sendRedirect("staffcontroller");
        }
    }

    public static String getNoiDung(Account account,String password) {
        String link = "http://localhost:9999/Demo/UserController?hanhDong=xac-thuc&tenDangNhap=" + account.getUserName();
        String noiDung = "<p>Xin chao ban<strong>" + account.getName() + "</strong>,</p>\r\n"
                + "<p>tài khoản nhân viên của bạn đã được thêm thành công <strong>"
                + "vui lòng đăng nhập theo tên đăng nhập:   " + account.getUserName() + " mật khẩu: " + password + " và thay đổi thông tin sau khi đăng nhập</a></p>\r\n"
                + "<p>Hạn cuối thay đổi thông tin là 5 ngày kể từ ngày nhận được email này.</p>\r\n"
                + "<p>Tr&acirc;n trọng cảm ơn.</p>";
        return noiDung;
    } 
}
