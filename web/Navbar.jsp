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
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
                <!-- logo -->
                <a class="navbar-brand" href="#"><img src="img/logo/logo5b.jpg" alt="Logo" style="height:70px; margin:15px"></a>       
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
                            <a class="nav-link" href="banhang.jsp"><img src="img/logo/iconquanao.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Bán hàng
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listPitch.jsp"><img src="img/logo/iconsanbong.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Sân bóng
                            </a>
                        </li>

                        <li class="nav-item dropdown">
                            



                            <%
                                                Object obj = session.getAttribute("khachHang");
                                                Account khachHang = null;
                                                if (obj!=null)
                                                        khachHang = (Account)obj;
						
                                                if(khachHang==null){
                            %>
                            <a class="btn btn-primary" style="white-space: nowrap;" href="login.jsp">
                                Đăng nhập
                            </a>
                            <a class="btn btn-primary" href="Register.jsp">Đăng ký</a>
                            <%} else { %>
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="img/logo/icontaikhoan_1.png" alt="Tai khoan" style="height:30px; margin-left: 15px"> <br/>
                                Tài khoản
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="changePassword.jsp">Thay đổi mật khẩu</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="change.jsp">Thông tin cá nhân</a>

                                <a class="dropdown-item" href="UserController?hanhDong=dang-xuat">Đăng xuất</a>
                            </div>
                            <% }%>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="giohang.jsp"><img src="img/logo/icongiohang.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Giỏ Hàng
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- end account, giỏ hàng, list sân -->
            </nav>
        </div>
    </body>
</html>
