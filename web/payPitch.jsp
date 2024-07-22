<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Sân Bóng</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('img/bgsanbong.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }
        .container {
            width: 90%;
            max-width: 600px;
            padding: 30px;
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            font-weight: bold;
            color: #ffd700;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            background-color: #f9f9f9;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button[type="submit"]:hover {
            background-color: #218838;
        }
        .qr-code {
            margin-top: 20px;
        }
        .qr-code img {
            max-width: 100%;
            height: auto;
        }
        .info-label {
            color: #ffd700;
            font-size: 1.1rem;
            margin: 5px 0;
        }
        @media (max-width: 768px) {
            .container {
                width: 100%;
                padding: 20px;
            }
        }
        .container {
            width: 50%;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .container h2 {
            margin-bottom: 20px;
            color: black; /* Đặt màu đen cho tiêu đề */
        }
        .container p {
            font-size: 1.2em;
            margin-bottom: 20px;
            color: black; /* Đặt màu đen cho giá tiền */
        }
        .container button {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
    <h2>Thanh toán ngay</h2>
    <p>Tổng số tiền: ${total}</p>
    <form action="payment" method="get">
        <input type="hidden" name="amount" value="${total*100}">
        <input type="hidden" name="hanhdong" value="pitch">
        <button type="submit">Thanh toán</button>
    </form>
</div>
</body>
</html>
