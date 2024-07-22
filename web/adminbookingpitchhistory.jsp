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

            .btn-custom {
                background-color: #33cc00;
                color: white;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
            }

            .btn-custom:hover {
                background-color: #33cc00;
            }

            .back-button {
                margin-top: 20px;
                text-align: center;
            }

            .back-button a {
                text-decoration: none;
                color: #333;
            }

            .back-button a:hover {
                color: #4CAF50;
            }
        </style>
    </head>
    <body>
        <%
            Object obj1 = session.getAttribute("khachHang");
            Account khachHang1 = null;
            if (obj1 != null) {
                khachHang1 = (Account) obj1;
            }
        %>
        <h2>Lịch Sử Đặt Sân</h2>
        <h5>Chọn ngày:</h5>
        <form action="bookingDetailServlet" method="get">
            <input type="date" id="selectedDate" name="selectedDate">
            <input type="hidden" name="hanhdong" value="loc">
            <button type="submit" class="btn btn-primary">Lọc</button>
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Người Dùng</th>
                    <th>Ngày Đặt</th>
                    <th>Tổng Tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="history" items="${bookingHistories}">
                    <tr>
                        <td>${history.userName}</td>                      
                        <td>${history.bookTime}</td>
                        <td>${history.totalPrice}</a</td>
                        <td>
                            <button class="btn btn-secondary" onclick="window.location.href = '${pageContext.request.contextPath}/bookingDetailServlet?totalInvoiceID=${history.totalInvoiceID}&hanhdong=chitiet'">Chi tiết</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="back-button">
            <c:choose>
                <c:when test="${role == 3||role==2}">
                    <a href="index.jsp" class="btn btn-secondary">Quay lại</a>
                </c:when>
                <c:when test="${role == 1}">
                    <a href="userListServlet" class="btn btn-secondary">Trang Chủ</a>
                </c:when>
            </c:choose>

        </div>

    </body>
</html>