<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Account"%>
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
        <p><strong>Tên khách hàng:</strong> ${totalInvoiceProduct.name}</p>
        <p><strong>Số điện thoại:</strong> ${totalInvoiceProduct.phone}</p>
        <p><strong>Địa chỉ:</strong> ${totalInvoiceProduct.address}</p>
        <p><strong>Ngày đặt hàng:</strong> ${orderdate}</p>
        <p><strong>Tổng số tiền:</strong> ${totalInvoiceProduct.total}</p>

        <h2>Chi tiết sản phẩm</h2>
        <table>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
            </tr>
            <c:forEach var="invoice" items="${invoiceProduct}">
                <tr>
                    <td>${invoice.productName}</td>
                    <td>${invoice.quantity}</td>
                    <td>${invoice.price}</td>
                </tr>
            </c:forEach>
        </table>

        <a href="index.jsp" class="back-button">Quay lại</a>
    </div>
</body>
</html>
