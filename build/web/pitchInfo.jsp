<%-- 
    Document   : datsan
    Created on : May 17, 2024, 7:49:07 AM
    Author     : nguye
--%>
<%@page import="model.Account"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Sân 5 người</title>
        <style>
            /* Định dạng kích thước của hình ảnh sân */
            .stadium-img {
                width: 100%;
                height: auto;
                max-height: 50vh; /* Chiếm 50% chiều dọc màn hình */
            }

            /* Phần thông tin sân */
            #stadium-info {
                background-color: #f8f9fa; /* Nền màu trắng */
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
            }

            /* Định dạng tiêu đề */
            #stadium-info h2 {
                color: #333; /* Màu chữ đậm */
                font-size: 24px; /* Kích thước chữ */
                margin-bottom: 20px; /* Khoảng cách với các phần thông tin khác */
            }

            /* Định dạng các mục thông tin */
            #stadium-info p {
                color: #555; /* Màu chữ nhạt */
                font-size: 16px; /* Kích thước chữ */
                margin-bottom: 10px; /* Khoảng cách giữa các mục */
            }
            body {
                background-color: #f0f0f0;
            }
            .container {
                display: flex;
                height: 100vh;
                padding: 20px;
            }
            .reservation-form {
                width: 30%;
                padding: 20px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .reservation-form h3 {
                margin-bottom: 20px;
                font-weight: bold;
            }
            .reservation-form .form-group {
                margin-bottom: 15px;
            }
            .reservation-form .btn-primary {
                background-color: #007bff;
                color: #fff;
                border: none;
                width: 100%;
                padding: 10px;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            .reservation-form .btn-primary:hover {
                background-color: #0056b3;
            }
            .time-slot-table {
                width: 70%;
                padding: 20px;
                box-sizing: border-box;
            }
            .time-slot-table h3 {
                margin-bottom: 20px;
                font-weight: bold;
            }
            .time-slot-table .table {
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .time-slot-table .btn {
                margin: 5px 0;
                width: 100%;
            }
            .time-slot-table .btn-booked {
                background-color: #e0e0e0;
                color: #888;
            }
            .time-slot-table .btn-available {
                background-color: #007bff;
                color: #fff;
                transition: background-color 0.3s ease;
            }
            .time-slot-table .btn-available:hover {
                background-color: #0056b3;
            }
            .time-slot-table .date-nav {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .time-slot-table .date-nav button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            .time-slot-table .date-nav button:hover {
                background-color: #0056b3;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }
            .rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: center;
                align-items: center;
                position: relative;
            }
            .rating > input {
                display: none;
            }
            .rating > label {
                cursor: pointer;
                font-size: 2.5rem;
                color: #ccc;
                transition: color 0.3s;
            }
            .rating > label:hover,
            .rating > input:checked ~ label {
                color: #ffdd00;
            }
            .rating > input:checked ~ label:hover,
            .rating > input:checked ~ label:hover ~ label {
                color: #ccc;
            }
            .average-rating {
                font-size: 1.5rem;
                margin-top: 10px;
                text-align: center;
                color: #555;
            }
            .comment-button {
                display: block;
                margin-top: 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 1rem;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .comment-button:hover {
                background-color: #0056b3;
            }
            .comment-dropdown {
                display: none;
                margin-top: 10px;
            }
            .comment-dropdown textarea {
                width: 100%;
                height: 100px;
                resize: none;
                margin-top: 5px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-family: Arial, sans-serif;
                font-size: 1rem;
            }
            .comment-dropdown button {
                background-color: #28a745;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 1rem;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .comment-dropdown button:hover {
                background-color: #218838;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }
            .question-form {
                width: 100vw;
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .question-form h3 {
                margin-bottom: 20px;
                font-weight: bold;
                text-align: center;
            }
            .question-form .form-group {
                margin-bottom: 20px;
            }
            .question-form label {
                font-weight: bold;
            }
            .question-form textarea {
                width: 100%;
                height: 150px;
                resize: none;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-family: Arial, sans-serif;
                font-size: 1rem;
            }
            .question-form button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 1rem;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .question-form button:hover {
                background-color: #0056b3;
            }


            .container {
                width: 100%;
                background-color: white;
                padding: 20px;
                box-sizing: border-box;
            }
            .grid-item {
                width:  100%;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;

                border-radius: 8px;
            }
            h3 {
                margin-top: 0;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            input[type="date"], button {
                margin-bottom: 10px;
                padding: 10px;
                font-size: 16px;
            }
            button {
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->

        <!-- End Navbar -->
        <%
            Object obj = session.getAttribute("khachHang");
            Account khachHang = null;
            if (obj != null) {
                khachHang = (Account) obj;
            }

            if (khachHang != null) {
                int role = khachHang.getRole(); // Lấy vai trò của khách hàng

                // Kiểm tra vai trò và include navbar tương ứng
                if (role == 2) {
        %>
        <jsp:include page="Navbar_1.jsp" /> <%-- Thay thế bằng Navbar cho vai trò 2 --%>
        <%
                } else {
        %>
        <jsp:include page="Navbar.jsp" /> <%-- Thay thế bằng Navbar mặc định cho các vai trò khác --%>
        <%
                }
            } else {
        %>
        <jsp:include page="Navbar.jsp" /> <%-- Thay thế bằng Navbar mặc định cho người dùng chưa đăng nhập --%>
        <h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
        <%
            }

            // Nếu đã đăng nhập, lấy thông tin khách hàng
            if (khachHang != null) {
                String baoLoi = request.getAttribute("baoLoi") + "";
                baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

                String hoVaTen = khachHang.getName();
                String gioiTinh = khachHang.getGender();
                String ngaySinh = khachHang.getDateOfBirth();
                String dienThoai = khachHang.getPhoneNumber();
                String email = khachHang.getEmail();
            }
        %>




        <a href="index.jsp">Trang chủ </a>> Sân bóng đá 5 người

        <div class="container-fluid" style="margin-top: 30px">
            <div class="row">
                <!-- Phần Carousel -->
                <div id="carouselExampleControls" class="carousel slide col-md-8" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100 stadium-img" src="img/san1.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/san2.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/san3.jpg" alt="Third slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/san4.jpg" alt="Fourth slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>

                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>

                    </a>
                </div>
                <!-- Phần thông tin sân -->
                <div class="col-md-4" id="stadium-info" >
                    <h2>Thông tin sân</h2>
                    <p><strong>Giờ mở cửa:</strong> 7:00 AM</p>
                    <p><strong>Giờ đóng cửa:</strong> 10:00 PM</p>

                    <p><strong>Dịch vụ:</strong> Đồ uống, Thuê thiết bị thể thao</p>
                </div>
            </div>
        </div>

        <!-- đặt sân theo yêu cầu -->
        <div class="container">

            <div class="grid-item">
                <%
                          // Lấy ngày hiện tại dưới dạng yyyy-mm-dd
                          String currentDate = LocalDate.now().toString();
                %>
                <h3>Chọn Ngày</h3>
                <form action="BookingTimeServlet" method="post">
                    <input type="hidden" name="action" value="2" />
                    <input type="hidden" name="pitch" value="${pitch.pitchID}">
                    <input type="date" name="date" required min="<%= currentDate %>" />
                    <button type="submit">Kiểm tra</button>
                </form>


            </div>

            <script>
                // Lấy ngày hiện tại dưới dạng yyyy-mm-dd
                const today = new Date().toISOString().split('T')[0];
                // Đặt giá trị min cho input date
                document.querySelector('input[type="date"]').setAttribute('min', today);
            </script>
        </div>
        <div>

            <form action="feedbackPitch" method="post">
                <input  type="hidden" name="action" value="addNew">
                <input  type="hidden" name="pitch" value="addNew">
                <input  type="hidden" name="pitchID" value="${pitchID}"> 
                <input  type="hidden" name="khachHang" value="${khachHang}">
                <input class="feedbackPitch" type="text" name="feedback" required="required">
                <button type="submit" value="feedback">Gui Nhan Xet</button>
            </form>
            <form action="feedbackPitch" method="get">

                <input  type="hidden" name="pitchID" value="${pitchID}"> 
                <input  type="hidden" name="khachHang" value="${khachHang}">

                <button type="submit" value="feedback">Xem feedback</button>
            </form>
            <section class="featured spad">
                <div class="row">
                    <c:forEach items="${listF}" var="f">
                        <div class="col-12">
                            <div class="review">
                                <div class="review-content">
                                    <h5>${adal.selectById1(f.getUserID()).getName()}</h5>
                                    <p>${f.getContent()}</p>
                                </div>
                                <c:if test="${f.getUserID() == khachHang.getID()}">
                                    <form action="deletefeedbackPitch" method="doGet">
                                        <div class="review-options">
                                            <button class="delete-btn">
                                                <img src="img/bin.png" alt="Delete" style="width: 24px; height: 24px;">
                                            </button>
                                        </div>
                                        <input  type="hidden" name="pitchID" value="${pitchID}"> 
                                        <input  type="hidden" name="khachHang" value="${khachHang}">
                                        <input  type="hidden" name="fID" value="${f.getFeedbackID()}">
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </div>
                <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
