<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Tài Khoản</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
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

            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 0;
                border-radius: 3px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }

            th, td {
                padding: 12px 15px;
                border: 1px solid #ddd;
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
                font-weight: bold;
            }

            tr:nth-of-type(even) {
                background-color: #fcfcfc;
            }

            tr:hover {
                background-color: #e0e0e0;
            }

            .btn-custom {
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 15px;
                cursor: pointer;
                font-size: 14px;
                text-decoration: none;
                margin-top: 5px;
            }

            .btn-custom:hover {
                background-color: #45a049;
            }

            .btn-custom:active {
                background-color: #3e8e41;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }

            .back-button {
                text-align: center;
                margin-top: 20px;
            }

            .back-button a {
                color: white;
                background-color: #4CAF50;
                border: none;
                border-radius: 5px;
                padding: 10px 15px;
                text-decoration: none;
                font-size: 14px;
                cursor: pointer;
                display: inline-block;
                margin-top: 10px;
            }

            .back-button a:hover {
                background-color: #45a049;
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
            if (khachHang1 ==null)
        %>
        <div class="table-wrapper">
            <h2>Danh Sách Tài Khoản</h2>
            <table>
                <thead>
                    <tr>
                        <th>Tên Tài Khoản</th>
                        <th>Email</th>
                        <th>Số Điện Thoại</th>
                        <th>Trình Trạng</th>
                            <c:choose>
                                <c:when test="${role == 1}">
                                <th>Hành Động</th>
                                </c:when>
                            </c:choose>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td><c:out value="${user.userName}"/></td>
                            <td><c:out value="${user.email}"/></td>
                            <td><c:out value="${user.phoneNumber}"/></td>
                            <td><c:out value="${user.statusOtp ? 'Hợp Lệ' : 'Chặn'}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${role == 1}">
                                        <form action="userListServlet" method="post">
                                            <input type="hidden" name="userID" value="${user.ID}"/>
                                            <input type="hidden" name="newStatus" value="${user.statusOtp ? 0 : 1}"/>
                                            <button class="btn btn-custom" type="submit">${user.statusOtp ? 'Chặn' : 'Mở Chặn'}</button>
                                        </form>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn-custom dropdown-toggle" type="button" id="dropdownDetail${user.ID}" data-bs-toggle="dropdown" aria-expanded="false">
                                        Chi Tiết
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownDetail${user.ID}">
                                        <li><a class="dropdown-item" href="adminProductPurchaseHistoryServlet?hanhdong=loc&userID=${user.ID}">Lịch Sử Mua Hàng</a></li>
                                        <li><a class="dropdown-item" href="adminBookingPitchHistoryServlet?hanhdong=loc&userID=${user.ID}">Lịch Sử Đặt Sân</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="back-button">
                <c:choose>
                    <c:when test="${role == 1}">
                        <a href="homeadmin.jsp" class="btn btn-secondary">Quay lại </a>
                    </c:when>
                    <c:when test="${role == 2}">
                        <a href="index.jsp" class="btn btn-secondary">Quay lại </a>
                    </c:when>

                </c:choose>
            </div>
        </div>
    </body>
</html>
