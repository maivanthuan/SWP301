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
import jakarta.servlet.http.HttpSession;
import util.Email;
import util.MaHoa;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.Random;
import model.Account;
import util.RandomNumber;

/**
 *
 * @author Admin
 */
public class UserController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hanhDong = request.getParameter("hanhDong");
        if (hanhDong.equals("dang-nhap")) {
            dangNhap(request, response);
        } else if (hanhDong.equals("dang-xuat")) {
            dangXuat(request, response);
        } else if (hanhDong.equals("dang-ky")) {
            register(request, response);
        } else if (hanhDong.equals("doi-mat-khau")) {
            doiMatKhau(request, response);
        } else if (hanhDong.equals("changeInfor")) {
            changeInfor(request, response);
        } else if (hanhDong.equals("xac-thuc")) {
            xacThuc(request, response);
        }
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void dangNhap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("matKhau");
        matKhau = MaHoa.toSHA1(matKhau);

        Account kh = new Account();
        kh.setUserName(tenDangNhap);
        kh.setPassword(matKhau);

        AccountDAO khd = new AccountDAO();
        Account khachHang = khd.selectByUsernameAndPassWord(kh);
        String url = "";
        if (khachHang != null && khachHang.getStatusOtp()) {
            HttpSession session = request.getSession();
            session.setAttribute("khachHang", khachHang);
            url = "/index.jsp";
        } else {
            request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không đúng!  Hoặc tài khoảng chưa xác thực");
            url = "/login.jsp";
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void dangXuat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Huy bo session
        session.invalidate();

        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();

        response.sendRedirect(url + "/index.jsp");
    }

    private void doiMatKhau(HttpServletRequest request, HttpServletResponse response) {
        try {
            String matKhauHienTai = request.getParameter("matKhauHienTai");
            String matKhauMoi = request.getParameter("matKhauMoi");
            String matKhauMoiNhapLai = request.getParameter("matKhauMoiNhapLai");

            String matKhauHienTai_Sha1 = MaHoa.toSHA1(matKhauHienTai);

            String baoLoi = "";
            String url = "/changePassword.jsp";

            // Kiem tra mat khau cu co giong hay khong
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("khachHang");
            Account khachHang = null;
            if (obj != null) {
                khachHang = (Account) obj;
            }
            if (khachHang == null) {
                baoLoi = "Bạn chưa đăng nhập vào hệ thống!";
            } else {
                // Neu khach hang da dang nhap
                if (!matKhauHienTai_Sha1.equals(khachHang.getPassword())) {
                    baoLoi = "Mật khẩu hiện tại không chính xác!";
                } else {
                    if (!matKhauMoi.equals(matKhauMoiNhapLai)) {
                        baoLoi = "Mật khẩu nhập lại không khớp!";
                    } else {
                        String matKhauMoi_Sha1 = MaHoa.toSHA1(matKhauMoi);
                        khachHang.setPassword(matKhauMoi_Sha1);
                        AccountDAO khd = new AccountDAO();
                        if (khd.changePassword(khachHang)) {
                            baoLoi = "Mật khẩu đã thay đổi thành công!";
                        } else {
                            baoLoi = "Quá trình thay đổi mật khẩu không thành công!";
                        }
                    }
                }
            }

            request.setAttribute("baoLoi", baoLoi);
            url = "/index.jsp";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void changeInfor(HttpServletRequest request, HttpServletResponse response) {

        try {
            String hoVaTen = request.getParameter("hoVaTen");
            String gioiTinh = request.getParameter("gioiTinh");
            String ngaySinh = request.getParameter("ngaySinh");
            String dienThoai = request.getParameter("dienThoai");
            String email = request.getParameter("email");
            request.setAttribute("hoVaTen", hoVaTen);
            request.setAttribute("gioiTinh", gioiTinh);
            request.setAttribute("ngaySinh", ngaySinh);
            request.setAttribute("dienThoai", dienThoai);

            String url = "";

            String baoLoi = "";
            AccountDAO accountdao = new AccountDAO();
            
            request.setAttribute("baoLoi", baoLoi);

            if (baoLoi.length() > 0) {
                url = "/Register.jsp";
            } else {
                Object obj = request.getSession().getAttribute("khachHang");
                Account khachHang = null;
                if (obj != null) {
                    khachHang = (Account) obj;
                }
                if (khachHang != null) {
                    String userID = khachHang.getID();
                    Account kh = new Account(userID, "", email, hoVaTen, gioiTinh, ngaySinh, dienThoai, "", 3, "");

                    accountdao.updateInfo(kh);
                    Account kh2 = accountdao.selectById1(kh);
                    request.getSession().setAttribute("khachHang", kh2);
                    url = "/changethanhcong.jsp";
                }
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (ServletException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) {
        try {
            String tenDangNhap = request.getParameter("tenDangNhap");
            String matKhau = request.getParameter("matKhau");
            String matKhauNhapLai = request.getParameter("matKhauNhapLai");
            String hoVaTen = request.getParameter("hoVaTen");
            String gioiTinh = request.getParameter("gioiTinh");
            String ngaySinh = request.getParameter("ngaySinh");
            String dienThoai = request.getParameter("dienThoai");
            String email = request.getParameter("email");
            request.setAttribute("tenDangNhap", tenDangNhap);
            request.setAttribute("hoVaTen", hoVaTen);
            request.setAttribute("gioiTinh", gioiTinh);
            request.setAttribute("ngaySinh", ngaySinh);
            request.setAttribute("dienThoai", dienThoai);
            request.setAttribute("email", email);
            String url = "";

            String baoLoi = "";
            AccountDAO accountDAO = new AccountDAO();

            if (accountDAO.TestUserName(tenDangNhap)) {
                baoLoi += "Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác.<br/>";
            }
            if (accountDAO.TestEmail(email)) {
                baoLoi += "Email đã tồn tại, vui lòng chọn tên đăng nhập khác.<br/>";
            }
            if (!matKhau.equals(matKhauNhapLai)) {
                baoLoi += "Mật khẩu không khớp.<br/>";
            } else {
                matKhau = MaHoa.toSHA1(matKhau);
            }

            request.setAttribute("baoLoi", baoLoi);

            if (baoLoi.length() > 0) {
                url = "/Register.jsp";
            } else {

                Account kh = new Account("", tenDangNhap, email, hoVaTen, gioiTinh, ngaySinh, dienThoai, matKhau, 3, "");
//                        Account(String ID, String userName, String email, String name, String gender, String dateOfBirth, String phoneNumber, String password, int role, String avata)

                if (accountDAO.insert(kh) > 0) {
                    String soNgauNhien = RandomNumber.getSoNgauNhien();

                    // Quy dinh thoi gian hieu luc
                    Date todaysDate = new Date(new java.util.Date().getTime());
                    Calendar c = Calendar.getInstance();
                    c.setTime(todaysDate);
                    c.add(Calendar.DATE, 1);
                    Date thoGianHieuLucXacThuc = new Date(c.getTimeInMillis());

                    // Trang thai xac thuc = false		 			
                    boolean trangThaiXacThuc = false;

                    kh.setOtp(soNgauNhien);
                    kh.setTimeEffective(thoGianHieuLucXacThuc);
                    kh.setStatusOtp(trangThaiXacThuc);

                    if (accountDAO.updateVerifyInformation(kh) > 0) {
                        // Gui email cho khach hang
                        Email.sendEmail(kh.getEmail(), "Comfirm account", getNoiDung(kh));
                    }
                }
                url = "/thanhcong.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getNoiDung(Account kh) {
        String link = "http://localhost:9999/Demo/UserController?hanhDong=xac-thuc&tenDangNhap=" + kh.getUserName() + "&maXacThuc=" + kh.getOtp();
        String noiDung = "<p>Xin chao ban<strong>" + kh.getUserName() + "</strong>,</p>\r\n"
                + "<p>Vui l&ograve;ng x&aacute;c thực t&agrave;i khoản của bạn bằng c&aacute;ch nhập m&atilde; <strong>" + kh.getOtp() + "</strong>, hoặc click trực tiếp v&agrave;o đường link sau đ&acirc;y:</p>\r\n"
                + "<p><a href=\"" + link + "\">" + link + "</a></p>\r\n"
                + "<p>Đ&acirc;y l&agrave; email tự động, vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\r\n"
                + "<p>Tr&acirc;n trọng cảm ơn.</p>";
        return noiDung;
    }

    private void xacThuc(HttpServletRequest request, HttpServletResponse response) {
        try {
            String tenDangNhap = request.getParameter("tenDangNhap");
            String maXacThuc = request.getParameter("maXacThuc");

            AccountDAO khachHangDAO = new AccountDAO();

            Account kh = new Account();
            kh.setUserName(tenDangNhap);
            Account khachHang = khachHangDAO.selectById(kh);

            String msg = "";
            if (khachHang != null) {
                // Kiem tra ma xac thuc co giong nhau hay khong? // Kiem tra xem ma xac thuc con hieu luc hay khong?
                if (khachHang.getOtp().equals(maXacThuc)) {
                    // Thanh Cong
                    khachHang.setStatusOtp(true);
                    khachHangDAO.updateVerifyInformation(khachHang);
                    msg = "Xác thực thành công!";
                } else {
                    // That Bai
                    msg = "Xác thực không thành công!";
                }
            } else {
                msg = "Tài khoản không tồn tại!";
            }
            String url = "/Notification.jsp";
            request.setAttribute("baoLoi", msg);
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (ServletException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
