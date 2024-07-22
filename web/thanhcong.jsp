<%-- 
    Document   : thanhcong
    Created on : May 19, 2024, 12:19:34 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng kí thành công</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
    }
    .message-box {
        text-align: center;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }
    .message-box h1 {
        font-size: 24px;
        color: #4CAF50;
    }
</style>
</head>
<body>
    <div class="message-box">
        <h1>Đăng kí tài khoản thành công! Hãy xác nhận tài khoản trong email bạn đã đăng ký để có thể sử dụng.</h1>
    </div>
    <script>
        setTimeout(function(){
            window.location.href = 'login.jsp';
        }, 5000);
    </script>
</body>
</html>