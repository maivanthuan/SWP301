<%-- 
    Document   : adminbookingpitchhistory
    Created on : Jun 27, 2024, 10:30:06 AM
    Author     : Clownfool
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 20px;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            table {
                width: 80%;
                margin: 0 auto;
                border-collapse: separate;
                border-spacing: 0;
                box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                border-radius: 10px;
                overflow: hidden;
            }

            th, td {
                padding: 15px;
                border: 1px solid #ddd;
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #e0e0e0;
            }
            .invoice {
                max-width: 800px;
                margin: auto;
                padding: 20px;
                border: 1px solid #eee;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
                font-size: 16px;
                line-height: 24px;
                font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
                color: #555;
            }
            .invoice-box {
                margin-bottom: 40px;
            }
            .invoice-box table {
                width: 100%;
                line-height: inherit;
                text-align: left;
                border-collapse: collapse;
            }
            .invoice-box table td {
                padding: 5px;
                vertical-align: top;
            }
            .invoice-box table tr td:nth-child(2) {
                text-align: right;
            }
            .invoice-box table tr.top table td {
                padding-bottom: 20px;
            }
            .invoice-box table tr.information table td {
                padding-bottom: 40px;
            }
            .invoice-box table tr.heading td {
                background: #eee;
                border-bottom: 1px solid #ddd;
                font-weight: bold;
            }
            .invoice-box table tr.details td {
                padding-bottom: 20px;
            }
            .invoice-box table tr.item td {
                border-bottom: 1px solid #eee;
            }
            .invoice-box table tr.item.last td {
                border-bottom: none;
            }
            .invoice-box table tr.total td:nth-child(2) {
                border-top: 2px solid #eee;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <%
    Account khachHang = (Account) session.getAttribute("khachHang");
    if (khachHang == null) {
        response.sendRedirect("login.jsp");
        return;
    }
//
//    String redirectPage = "index.jsp"; // Mặc định chuyển về trang index.jsp
//
//    switch (khachHang.getRole()) {
//        case 1:
//            redirectPage = "adminBookingPitchHistoryServlet?hanhdong=loc&userID="; // Nếu là role 1, chuyển về trang userListServlet
//            break;
//        case 3:
//            redirectPage = "index.jsp"; // Nếu là role 3, chuyển về trang index.jsp
//            break;
//        // Thêm các case khác nếu cần
//    }
%>
        <!-- End Navbar -->
        <div class="invoice">
            <div class="invoice-box">
                <table cellpadding="0" cellspacing="0">
                    <tr class="top">
                        <td colspan="3">
                            <table>
                                <tr>
                                    <td class="title">
                                        <h2>Chi Tiết Hóa Đơn</h2>
                                    </td>
                                    <td>
                                        Ngày: <c:out value="${bookingDetails[0].bookTime}"/><br>
                                        Mã #: <c:out value="${bookingDetails[0].invoicePitchID}"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="information">
                        <td colspan="3">
                            <table>
                                <tr>
                                    <td>
                                        Khách hàng: <c:out value="${bookingDetails[0].userName}"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="heading">
                        <td> Mã Sân  </td>
                        <td> Loại  </td>
                        <td> Giá </td>
                        <td> Khung Giờ </td>
                    </tr>
                    <c:forEach var="detail" items="${bookingDetails}">
                        <tr class="item">
                            <td>
                                <c:out value="${detail.pitchID}"/>
                            </td>
                            <td>
                                <c:out value="${detail.pitchType}"/>
                            </td>
                            <td>
                                <c:out value="${detail.price}"/> VND
                            </td>
                            <td>
                                <c:out value="${detail.time}"/>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr class="total">
                        <td></td>
                        <td></td>
                        <td>
                            Total: <c:out value="${bookingDetails[0].totalPrice}"/> VND
                        </td>
                    </tr>
                </table>
        <div class="back-button">
            <a href="adminBookingPitchHistoryServlet?hanhdong=loc&userID=${khachHang.ID}" class="btn btn-secondary">Quay lại</a>
        </div>
            </div>
        </div>


    </body>
</html>