<%-- 
    Document   : Navbar
    Created on : May 21, 2024, 3:47:45 AM
    Author     : Admin
--%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ListPitchces</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <style>
            /* Định dạng kích thước của hình ảnh sân */
            .stadium-img {
                width: 100%;
                height: auto;
                max-height: 50vh; /* Chiếm 50% chiều dọc màn hình */
            }

            /* Phần thông tin sân */
            #stadium-info {
                background-color: #F1F1EF; /* Nền màu trắng */
                padding: 20px;
                border-radius: 7px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
            }

            /* Định dạng tiêu đề */
            #stadium-info h2 {
                color: #333; /* Màu chữ đậm */
                font-size: 24px; /* Kích thước chữ */
                margin-bottom: 20px; /* Khoảng cách với các phần thông tin khác */
            }
            .footer{
                background-color: #F1F1EF;
                font-family: unset;
                height: 330px;
            }
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
                background-color: #f0f0f0;
                padding: 10px;
                border-radius: 5px;
            }

            .pagination a,
            .pagination span {
                margin: 0 5px;
                padding: 8px 16px;
                text-decoration: none;
                color: white;
                background-color: #4caf50; /* Green color */
                border: 1px solid #4caf50;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .pagination a:hover {
                background-color: #45a049; /* Darker green */
            }

            .pagination span {
                background-color: #2e7d32; /* Darker green for the current page indicator */
            }

            .pagination a:visited {
                color: white;
            }

            /* Định dạng cho nút đăng nhập và đăng ký */
            .nav-buttons {
                display: flex;
                align-items: center;
                gap: 10px; /* Khoảng cách giữa hai nút */
            }

            .nav-buttons a {
                white-space: nowrap;
                padding: 8px 16px;
                font-size: 14px; /* Kích thước chữ */
                border-radius: 4px;
            }

            .btn-login {
                background-color: #007bff; /* Màu nền của nút đăng nhập */
                color: white;
            }

            .btn-register {
                background-color: #28a745; /* Màu nền của nút đăng ký */
                color: white;
            }
            .btn-login:hover {
                background-color: #000033; /* Màu nền khi di chuột vào nút đăng nhập */
            }

            .btn-register:hover {
                background-color: #dc3545; /* Màu nền khi di chuột vào nút đăng ký */
            }


        </style>
    </head>
    <body>
        <!-- Navbar -->
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
                <!-- logo -->
                <a class="navbar-brand" href="index.jsp"><img src="img/logo/logo5b.jpg" alt="Logo" style="height:70px; margin:15px"></a>       
                <!-- end logo -->   

                <!-- search -->
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Nhập nội dung tìm kiếm" aria-label="Search" style="width: 500px;">
                    <button class="btn btn-outline-success" type="submit" style="background-color: #262C78; color: white;">Search</button>
                </form>    
                <!-- end search -->

                <!-- account, giỏ hàng, list sân -->
                <div style="margin-right: 20px">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="searchPitch2.jsp"><img src="img/logo/1200px-Search_Icon.svg.png" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Tìm Sân
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="FindCompetitorServlet"><img src="img/logo/timdoithu.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Tìm đối thủ
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loadproduct"><img src="img/logo/iconquanao.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Bán hàng
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PitchServlet"><img src="img/logo/iconsanbong.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Sân bóng
                            </a>
                        </li>


                        <%
                                            Object obj = session.getAttribute("khachHang");
                                            Account khachHang = null;
                                            if (obj!=null)
                                                    khachHang = (Account)obj;
						
                                            if(khachHang==null){
                        %>
                        <div class="nav-buttons">
                            <a class="btn btn-login" href="login.jsp">
                                Đăng nhập
                            </a>
                            <a class="btn btn-register" href="Register.jsp">Đăng ký</a>
                        </div>
                        <%} else { %>
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="img/logo/icontaikhoan_1.png" alt="Tai khoan" style="height:30px; margin-left: 15px"> <br/>
                            Tài khoản
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <!-- Điểm thay đổi: Thêm các thẻ <li> bao quanh thẻ <a> -->
                            <li><a class="dropdown-item" href="changePassword.jsp">Thay đổi mật khẩu</a></li>
                            <li><a class="dropdown-item" href="change.jsp">Thông tin cá nhân</a></li>
                            <li><a class="dropdown-item" href="adminBookingPitchHistoryServlet?hanhdong=loc&userID=${khachHang.ID}">Lịch Sử Đặt Sân</a></li>
                            <li><a class="dropdown-item" href="adminProductPurchaseHistoryServlet?hanhdong=loc&userID=${khachHang.ID}">Lịch Sử Mua Hàng</a></li>
                            <li><a class="dropdown-item" href="UserController?hanhDong=dang-xuat">Đăng xuất</a></li>
                        </ul>
                        <% }%>
                        <li class="nav-item">
                            <a class="nav-link" href="show"><img src="img/logo/icongiohang.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Giỏ Hàng
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="UserController?hanhDong=dang-xuat"><img src="img/logo/pngtree-vector-logout-icon-png-image_958608.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Đăng Xuất 
                            </a>
                        </li>

                    </ul>
                </div>
                <!-- end account, giỏ hàng, list sân -->
            </nav>
        </div>
        <!-- End Navbar -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+DlPUoMHpY5F0RvI96EKsEnFnvL4" crossorigin="anonymous"></script>
    </body>
</html>
