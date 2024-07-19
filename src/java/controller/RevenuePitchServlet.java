/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.InvoicePitchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thuan
 */
public class RevenuePitchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         String chart_raw = request.getParameter("chart");
        InvoicePitchDAO dal = new InvoicePitchDAO();

        int chart = chart_raw == null ? 0 : Integer.parseInt(chart_raw);
//        if (chart == 0) {
            int year18 = dal.getTotalPriceByYear(2018);
            int year19 = dal.getTotalPriceByYear(2019);
            int year20 = dal.getTotalPriceByYear(2020);
            int year21 = dal.getTotalPriceByYear(2021);
            int year22 = dal.getTotalPriceByYear(2022);
            int year23 = dal.getTotalPriceByYear(2023);
            int year24 = dal.getTotalPriceByYear(2024);
            System.out.println("tien ngu");
            System.out.println(year24);
            request.setAttribute("year18", year18);
            request.setAttribute("year19", year19);
            request.setAttribute("year20", year20);
            request.setAttribute("year21", year21);
            request.setAttribute("year22", year22);
            request.setAttribute("year23", year23);
            request.setAttribute("year24", year24);
            request.setAttribute("chart", chart);
//        } else {
            int month1 = dal.getTotalPriceByMonth(1);
            int month2 = dal.getTotalPriceByMonth(2);
            int month3 = dal.getTotalPriceByMonth(3);
            int month4 = dal.getTotalPriceByMonth(4);
            int month5 = dal.getTotalPriceByMonth(5);
            int month6 = dal.getTotalPriceByMonth(6);
            int month7 = dal.getTotalPriceByMonth(7);
            int month8 = dal.getTotalPriceByMonth(8);
            int month9 = dal.getTotalPriceByMonth(9);
            int month10 = dal.getTotalPriceByMonth(10);
            int month11 = dal.getTotalPriceByMonth(11);
            int month12 = dal.getTotalPriceByMonth(12);

            request.setAttribute("month1", month1);
            request.setAttribute("month2", month2);
            request.setAttribute("month3", month3);
            request.setAttribute("month4", month4);
            request.setAttribute("month5", month5);
            request.setAttribute("month6", month6);
            request.setAttribute("month7", month7);
            request.setAttribute("month8", month8);
            request.setAttribute("month9", month9);
            request.setAttribute("month10", month10);
            request.setAttribute("month11", month11);
            request.setAttribute("month12", month12);
//            request.setAttribute("chart", chart);
//        }
//        List<Account> accounts = sd.getAllAccountByRole(4);
//        List<Account> newAccounts = sd.getNewAccountByRole(4);
//        BigDecimal today = sd.getTotalMoneyOrderToday();
//        BigDecimal total = sd.getTotalMoneyOrder();
//        request.setAttribute("user", accounts.size());
//        request.setAttribute("newuser", newAccounts.size());
//        request.setAttribute("today", today);
//        request.setAttribute("total", total);
        request.getRequestDispatcher("pitchRevenue.jsp").forward(request, response);
    } 
}
