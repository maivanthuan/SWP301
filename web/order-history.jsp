<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>FastFood</title>
        <style>
            /* Custom CSS */

            /* Table Styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th,
            td {
                text-align: left;
                padding: 10px;
            }

            th {
                background-color: #f2f2f2;
            }

            /* CSS cho nút "Next Status" */
            .next-status-button {
                background: none;
                border: none;
                color: blue; /* Màu văn bản tương tự như liên kết */
                text-decoration: none; /* Gạch chân tương tự như liên kết */
                cursor: pointer;
                padding: 0;
            }

            .next-status-button:focus {
                outline: none; /* Loại bỏ đường viền khi tập trung (nếu cần) */
            }
            /* End of Custom CSS */
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
                            <a class="nav-link" href="loadproduct"><img src="img/logo/iconquanao.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Bán hàng
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="list-pitch.jsp"><img src="img/logo/iconsanbong.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Sân bóng
                            </a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="img/logo/icontaikhoan_1.png" alt="Tai khoan" style="height:30px; margin-left: 15px"> <br/>
                                Tài khoản
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Đăng nhập</a>
                                <a class="dropdown-item" href="#">Đăng ký</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Thay đổi mật khẩu</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Thông tin cá nhân</a>
                                <a class="dropdown-item" href="#">Đăng xuất</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="show"><img src="img/logo/icongiohang.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Giỏ Hàng
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- end account, giỏ hàng, list sân -->
            </nav>
        </div>
        <!-- End Navbar -->
        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container mt-4">
                <div class="row">
                    <div class="col-lg-12">
                        <h3><strong>Order History</strong></h3> 
                        <div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>ODID</th>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Order Date</th>
                                        <th>Total Amount</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${orders}" var="o">
                                        <tr>
                                            <td>${o.getTotalInvoiceProductID()}</td>                                         
                                            <td>${o.name}</td>
                                            <td>${o.phone}</td>
                                            <td>${o.address}</td>
                                            <td>${o.orderDate}</td>
                                            <td>${o.total} VND</td>
                                            <td>${o.statusName}</td>     
                                            <td>
                                                <a href="OrderDetail?id=${o.getTotalInvoiceProductID()}">Chi Tiết</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div style="float: right">
                                <a href="OrderListHistory" class="btn btn-primary">Quay Lại</a>
                            </div>
                        </div>
                    </div
                </div>
            </div>
        </section>
        <!-- Hero Section End -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>



    </body>
</html>
