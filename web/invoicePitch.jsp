<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hóa đơn</title>
        <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hóa đơn của bạn</h1>
        <p><strong>Mã ngân hàng:</strong> ${vnp_BankCode}</p>
        <p><strong>Tên khách hàng:</strong> ${totalInvoicePitch.getUserID().getName()}</p>
        <p><strong>Số điện thoại:</strong> ${totalInvoicePitch.getUserID().getPhoneNumber()}</p>
        <p><strong>Ngày đặt sân:</strong> ${date}</p>
        <h2>Chi tiết </h2>
        <table>
            <tr>
                <th>ID Sân</th>
                <th>Loại Sân</th>
                <th>Giá</th>
                <th>Khung giờ đặt</th>
            </tr>
            <c:forEach var="invoicePitch" items="${invoicePitch}">
                <tr>
                    <td>${invoicePitch.getPitchID().getPitchID()}</td>
                    <td>${invoicePitch.price}</td>
                    <td>${invoicePitch.pitchType}</td>
                    <td>${invoicePitch.bookTime}</td>
                </tr>
            </c:forEach>
        </table>

        <a href="PitchServlet" class="back-button">Quay lại</a>
    </div>
</body>
</html>