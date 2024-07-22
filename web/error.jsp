<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Objects"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        #error-message {
            color: red;
            font-weight: bold;
            font-size: 24px; /* Tăng kích thước chữ */
            text-align: center; /* Canh giữa chữ */
        }
    </style>
    <script>
        window.onload = function() {
            var errorMessage = "<%= Objects.toString(session.getAttribute("error"), "") %>";
            <% session.removeAttribute("error"); %> // Xóa thông báo lỗi khỏi session sau khi lấy

            if (errorMessage) {
                var errorDiv = document.getElementById('error-message');
                errorDiv.innerText = errorMessage;
                setTimeout(function() {
                    window.location.href = "http://localhost:9999/Demo/login.jsp";
                }, 3000);
            }
        }
    </script>
</head>
<body>
    <div id="error-message"></div>
</body>
</html>