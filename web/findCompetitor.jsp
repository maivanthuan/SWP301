<%-- 
    Document   : findCompetitor
    Created on : Jun 27, 2024, 11:50:41 PM
    Author     : thuan
--%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Account khachHangg = (Account) session.getAttribute("khachHang");
    if (khachHangg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Find Competitor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            position: relative;
            z-index: 1;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.9); /* 50% opacity black */
            display: none;
            z-index: 10;
        }
        .blur-background {
            filter: blur(5px);
        }
    </style>
</head>
<body>
    <jsp:include page="Navbar.jsp"></jsp:include>
    <div class="container">
        <h1>Đăng Ký Ghép Cặp</h1>
        <form action="FindCompetitorServlet" method="post">
            <label for="date">Chọn Ngày: </label>
            <input type="date" id="date" name="date" required>
            <input type="hidden" name="hanhdong" value="find">
            <label for="timeSlot">Chọn Khung Giờ: </label>
            <select id="booktime" name="booktime" required>
                <option value="" disabled selected hidden></option>
                <option value="1">6-7</option>
                <option value="2">7-8</option>
                <option value="3">8-9</option>
                <option value="4">9-10</option>
                <option value="5">10-11</option>
                <option value="6">14-15</option>
                <option value="7">15-16</option>
                <option value="8">16-17</option>
                <option value="9">17-18</option>
                <option value="10">18-19</option>
                <option value="11">19-20</option>
                <option value="12">20-21</option>
                <option value="13">21-22</option>
                <option value="14">22-...</option>
            </select>
            <button class="button" type="submit">Tìm Sân</button>
        </form>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
