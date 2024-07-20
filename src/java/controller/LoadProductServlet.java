/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoriesDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Categories;
import model.Product;

/**
 *
 * @author Admin
 */
public class LoadProductServlet extends HttpServlet {
   
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        listProduct(request, response);
        String hanhdong = request.getParameter("hanhDong");
        if (hanhdong == null) {
            hanhdong = "default";
        }

        switch (hanhdong) {
        case "search":
            searchProduct(request, response);
            break;
        case "sortProduct":
            String sortOrder = request.getParameter("sortOrder");
            if ("sortTang".equals(sortOrder)) {
                sortProductTang(request, response);
            } else if ("sortGiam".equals(sortOrder)) {
                sortProductGiam(request, response);
            } else {
                listProduct(request, response);
            }
            break;
        default:
            listProduct(request, response);
            break;
    }
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

    protected void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        // Lấy tham số từ request và kiểm tra null
        String txtSearch = request.getParameter("txt");
        if (txtSearch == null) {
            txtSearch = ""; // Hoặc giá trị mặc định khác
        }

        // Khởi tạo DAO và tìm kiếm sản phẩm
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.searchByName(txtSearch);
        if (list == null) {
            list = new ArrayList<>(); // Tránh NullPointerException
        }

        // Lấy danh sách danh mục
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        List<Categories> listC = categoriesDAO.getAll();
        if (listC == null) {
            listC = new ArrayList<>(); // Tránh NullPointerException
        }

        // Đặt thuộc tính cho request và chuyển tiếp tới JSP
        request.setAttribute("listP", list);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("productinfor.jsp").forward(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(LoadProductServlet.class.getName()).log(Level.SEVERE, null, ex);
         // Gửi lỗi HTTP 500 tới client
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + ex.getMessage());
    }
}


    protected void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        if(khachHang.getRole()!=3){
            response.sendRedirect("cook.jsp");
            return;
        }
        int page = 1;
        int recordsPerPage = 6;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        ProductDAO dal = new ProductDAO();
        List<Product> list = dal.getAll(page, recordsPerPage);
        int noOfRecords = dal.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        CategoriesDAO categoriesDAO = new CategoriesDAO(); // categories
        List<Categories> listC = categoriesDAO.getAll();

        //B2: set data to jsp
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("listP", list);
        request.setAttribute("listC", listC);

        request.getRequestDispatcher("productinfor.jsp").forward(request, response);
    }
    protected void sortProductTang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO(); //product 
        int page = 1;
        int recordsPerPage = 6;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1; // Mặc định nếu tham số page không hợp lệ
            }
        }
        List<Product> list = productDAO.getAll(page, recordsPerPage);
        if (list != null) {
            list = productDAO.sortByPriceAscending(list);
        } else {
            list = new ArrayList<>();
        }
        int noOfRecords = productDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        // B2: set data to jsp
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("listP", list);
        request.getRequestDispatcher("productinfor.jsp").forward(request, response);
}
protected void sortProductGiam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ProductDAO productDAO = new ProductDAO();
    int page = 1;
    int recordsPerPage = 6;
    if (request.getParameter("page") != null) {
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1; // Mặc định nếu tham số page không hợp lệ
        }
    }

    List<Product> list = productDAO.getAll(page, recordsPerPage);
    if (list != null) {
        list = productDAO.sortByPriceDescending(list);
    } else {
        list = new ArrayList<>();
    }

    int noOfRecords = productDAO.getNoOfRecords();
    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);


    request.setAttribute("noOfPages", noOfPages);
    request.setAttribute("currentPage", page);
    request.setAttribute("listP", list);
    CategoriesDAO categoriesDAO = new CategoriesDAO(); // categories
    request.getRequestDispatcher("productinfor.jsp").forward(request, response);
}

}
