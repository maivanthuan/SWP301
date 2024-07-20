<%-- 
    Document   : homeadmin
    Created on : Jul 4, 2024, 1:23:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Admin</title>
        <link rel= "stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
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
            :root {
                --main-color: #262C78;
                --color-dark: #1D2231;
                --text-grey: #8390A2;
            }

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                list-style-type: none;
                text-decoration: none;
                font-family: 'Poppins', sans-serif;
            }

            .sidebar {
                width: 345px;
                position: fixed;
                left: 0;
                top: 0;
                height: 100%;
                background: var(--main-color);
                z-index: 100;
                transition: width 300ms;
            }

            .sidebar-brand {
                height: 90px;
                padding: 1rem 0rem 1rem 2rem;
                color: #fff;
            }

            .sidebar-brand span {
                display: inline-block;
                padding-right: 1rem;
            }

            .sidebar-menu {
                margin-top: 1rem;
            }

            .sidebar-menu li {
                width: 100%;
                margin-bottom: 1.3rem;
                padding-left: 1rem;
            }

            .sidebar-menu a {
                padding-left: 1rem;
                display: block;
                color: #fff;
                font-size: 1.2rem;
            }

            .sidebar-menu a.active {
                background: #fff;
                padding-top: 1rem;
                padding-bottom: 1rem;
                color: var(--main-color);
                border-radius: 30px 0px 0px 30px;
            }

            .sidebar-menu a span:first-child {
                font-size: 1.5rem;
                padding-right: 1rem;
            }

            #nav-toggle:checked + .sidebar{
                width: 70px;
            }

            #nav-toggle:checked + .sidebar .sidebar-brand,
            #nav-toggle:checked + .sidebar li{
                padding-left: 1rem;
                text-align: center;
            }

            #nav-toggle:checked + .sidebar li a{
                padding-left: 0rem;
            }

            #nav-toggle:checked + .sidebar .sidebar-brand h2 span:last-child,
            #nav-toggle:checked + .sidebar li a span:last-child{
                display: none;
            }

            #nav-toggle:checked ~ .main-content{
                margin-left: 70px;
            }

            #nav-toggle:checked ~ .main-content header{
                width: calc(100% - 70px);
                left: 70px;
            }
            .main-content {
                transition: margin-left 300ms;
                margin-left: 345px;
            }

            header {
                background: #fff;
                display: flex;
                justify-content: space-between;
                padding: 1rem;
                box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
                position: fixed;
                left: 345px;
                width: calc(100% - 345px);
                top: 0;
                z-index: 100;
                transition: left 300ms;
            }

            #nav-toggle{
                display: none;
            }

            header h2 {
                color: #222;
            }

            header label span {
                font-size: 1.7rem;
                padding-left: 1rem;
            }

            .search-wrapper {
                border: 1px solid #ccc;
                border-radius: 30px;
                height: 50px;
                display: flex;
                align-items: center;
                overflow-x: hidden;
            }

            .search-wrapper span {
                display: inline-block;
                padding: 0rem 1rem;
                font-size: 1.5rem;
            }

            .search-wrapper input {
                height: 100%;
                padding: .5rem;
                border: none;
                outline: none;
            }

            .user-wrapper {
                display: flex;
                align-items: center;
            }

            .user-wrapper img {
                margin-right: 1rem;
            }

            .user-wrapper h4 {
                margin-bottom: 0rem !important;
            }

            .user-wrapper small {
                display: inline-block;
                color: var(--text-grey);
            }

            main {
                margin-top: 85px;
                padding: 2rem 1.5rem;
                background: #f5f1f9;
                min-height: calc(100vh - 90px);
            }

            .cards {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 2rem;
                margin-top: 1rem;
            }

            .card-single {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: #fff;
                padding: 2rem;
                border-radius: 2px;
            }

            .card-single div:first-child span {
                color: var(--text-grey);
            }

            .card-single div:last-child span {
                font-size: 3rem;
                color: var(--main-color);
            }

            .card-single:last-child {
                background: var(--main-color);
            }

            .card-single:last-child h1,
            .card-single:last-child div:first-child span,
            .card-single:last-child div:last-child span {
                color: #fff;
            }
            .recent-grid{
                margin-top: 3.5rem;
                display: grid;
                grid-template-columns: 65% auto;
                gap: 2rem;
            }

            .card{
                background: #fff;
                border-radius: 5px;
            }

            .card-header,
            .card-body{
                padding: 1rem;
            }

            .card-header{
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #f0f0f0;
            }

            .card-header button{
                background: var(--main-color);
                border-radius: 10px;
                color: #fff;
                font-size: .8rem;
                padding: .5rem 1rem;
                border: 1px solid var(--main-color);
            }

            table{
                border-collapse: collapse;
            }

            thead tr{
                border-top: 1px solid #f0f0f0;
                border-bottom: 2px solid #f0f0f0;
            }

            thead td{
                font-weight: 700;
            }

            td{
                padding: .5rem 1rem;
                font-size: .9rem;
                color: #222;
            }

            td .status{
                display: inline-block;
                height: 10px;
                width: 10px;
                border-radius: 50%;
                margin-right: 1rem;
            }

            tr td:last-child{
                display: flex;
                align-items: center;
            }

            .status.purple{
                background: #663399;
            }

            .status.pink{
                background: #ff1493;
            }

            .status.orange{
                background: orangered;
            }

            .table-responsive{
                width: 100%;
                overflow-x: auto;
            }

            .customer{
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: .5rem .7rem;
            }

            .info{
                display: flex;
                align-items: center;
            }

            .info img{
                border-radius: 50%;
                margin-right: 1rem;
            }

            .info h4{
                font-size: .8rem;
                font-weight: 700;
                color: #222;
            }

            .info small{
                font-weight: 600;
                color: var(--text-grey);
            }

            .contact span{
                font-size: 1.2rem;
                display: inline-block;
                margin-left: .5rem;
                color: var(--main-color);
            }

            @media only screen and(max-width: 1200px){
                .sidebar{
                    width: 70px;
                }

                .sidebar .sidebar-brand,
                .sidebar li{
                    padding-left: 1rem;
                    text-align: center;
                }

                .sidebar li a{
                    padding-left: 0rem;
                }

                .sidebar .sidebar-brand h2 span:last-child,
                .sidebar li a span:last-child{
                    display: none;
                }

                .main-content{
                    margin-left: 70px;
                }

                .main-content header{
                    width: calc(100% - 70px);
                    left: 70px;
                }
            }

            @media only screen and (max-width: 960px){
                .card{
                    grid-template-columns: repeat(3, 1fr);
                }

                .recent-grid{
                    grid-template-columns: 60% 40%;
                }
            }

            @media only screen and (max-width: 768px){
                .card{
                    grid-template-columns: repeat(2, 1fr);
                }

                .recent-grid{
                    grid-template-columns: 100%;
                }

                .search-wrapper{
                    display: none;
                }

                .sidebar{
                    left: -100% !important;
                }

                header h2{
                    display: flex;
                    align-items: center;
                }

                header h2 label{
                    display: inline-block;
                    background: var(--main-color);
                    padding-right: 0rem;
                    margin-right: 1rem;
                    height: 40px;
                    width: 40px;
                    border-radius: 50%;
                    color: #fff;
                    display: flex;
                    justify-content: center !important;
                }

                header h2 span{
                    text-align: center;
                    padding-right: 0rem;
                }

                header h2{
                    font-size: 1.1rem;
                }

                .main-content{
                    width: 100%;
                    margin-left: 0rem;
                }

                header{
                    width: 100% !important;
                    left: 0 !important;
                }

                #nav-toggle:checked +.sidebar{
                    left: 0 !important;
                    z-index: 100;
                    width: 345px;
                }

                #nav-toggle:checked + .sidebar .sidebar-brand,
                #nav-toggle:checked + .sidebar li{
                    padding-left: 2rem;
                    text-align: left;
                }

                #nav-toggle:checked + .sidebar:hover li a{
                    padding-left: 1rem;
                }

                #nav-toggle:checked + .sidebar:hover .sidebar-brand h2 span:last-child,
                #nav-toggle:checked + .sidebar li a span:last-child{
                    display: inline;
                }

                #nav-toggle:checked ~ .main-content{
                    margin-left: 0rem !important;
                }
            }

            @media only screen and (max-width: 560px){
                .card{
                    grid-template-columns: repeat(2, 1fr);
                }
            }
            .sidebar-brand {
                height: 90px;
                padding: 1rem 0rem 1rem 2rem;
                color: #fff;
            }

            .sidebar-brand h2 {
                display: flex;
                align-items: center;
                cursor: pointer;
            }

            .sidebar-brand a {
                text-decoration: none;
                color: inherit;
            }

            .sidebar-brand span {
                display: inline-block;
                padding-right: 1rem;
            }

            .sidebar-brand .lab {
                font-size: 2rem;
                margin-right: 5px;
            }

            .sidebar-brand .lab:hover {
                color: inherit;
            }
            .blur-background {
                filter: blur(5px);
            }
            .sidebar-menu a {
                text-decoration: none; /* Loại bỏ dấu gạch chân */
            }
                    .blur-background {
            filter: blur(0px); /* Loại bỏ hiệu ứng mờ */
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 1); /* Màu nền đen với độ mờ 90% */
            display: none;
            z-index: 10;
        }

        .modal.show + .overlay {
            display: block;
        }

        </style>
    </head>
    <body>
        <%
    Object obj1 = session.getAttribute("khachHang");
    Account khachHang1 = null;
    if (obj1 != null) {
        khachHang1 = (Account) obj1;
    }
    if (khachHang1 == null) {
        %>
        <script>
            window.location.href = 'login.jsp';
        </script>
        <% } else if (khachHang1.getRole() != 1) { %>
        <div class="overlay"></div>
        <div class="modal fade" id="roleModal" tabindex="-1" aria-labelledby="roleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="roleModalLabel">Thông báo</h5>
                    </div>
                    <div class="modal-body">
                        Đéo phận sự miễn vào.
                    </div>
                </div>
            </div>
        </div>
        <script>
            var roleModal = new bootstrap.Modal(document.getElementById('roleModal'), {});
            roleModal.show();
            document.querySelector('body').classList.add('blur-background');
            document.querySelector('.overlay').style.display = 'block';
            setTimeout(function () {
                window.location.href = 'index.jsp';
            }, 2000);
        </script>
        <% } %>
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar">
            <div class="sidebar-brand">
                <a href="homeadmin.jsp">
                    <h2><span class="lab la-accusoft"></span><span>Admin</span></h2>
                </a>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="RevenuePitchServlet"><span class="las la-igloo"></span>
                            <span>Thống Kê Đặt Sân</span>
                        </a>
                    </li>
                    <li>
                        <a href="RevenueProductServlet"><span class="las la-users"></span>
                            <span>Thông Kê Mua Hàng</span>
                        </a>
                    </li>
                    <li>
                        <a href="productmanagerservlet"><span class="las la-clipboard-list"></span>
                            <span>Tạo Sản Phẩm</span>
                        </a>
                    </li>
                    <li>
                        <a href="staffcontroller"><span class="las la-shopping-bag"></span>
                            <span>Tạo Tài Khoản Nhân Viên</span>
                        </a>
                    </li>
                    <li>
                        <a href="userListServlet"><span class="las la-user-circle"></span>
                            <span>Danh Sách Tài Khoản</span>
                        </a>
                    </li>
                    <li>
                        <a href="adminBookingPitchHistoryServlet?hanhdong=list"><span class="las la-user-circle"></span>
                            <span>Lịch Sử Đặt Sân</span>
                        </a>
                    </li>
                    <li>
                        <a href="adminProductPurchaseHistoryServlet?hanhdong=list"><span class="las la-user-circle"></span>
                            <span>Lịch Sử Mua Hàng</span>
                        </a>
                    </li>
                    <li>
                        <a href="UserController?hanhDong=dang-xuat"><span class="las la-user-circle"></span>
                            <span>Đăng Xuất</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <header>
                <h2>
                    <label for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label>
                    Dashboard
                </h2>
                <div class="search-wrapper">
                    <span class="las las-search"></span>
                    <input type="search" placeholder="Search here"/>
                </div>
                <div class="user-wrapper">
                    <img src="img/logo/logo5b.jpg" height="70px" alt="">
                    <div>
                        <h4>5B Sport</h4>
                        <small>ADMIN</small>
                    </div>
                </div>
            </header>
            <main>
                <div class="cards">
                    <div class="card-single">
                        <div>
                            <h1>54</h1>
                            <span>Customers</span>
                        </div>
                        <div>
                            <span class="las la-users"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>79</h1>
                            <span>Projects</span>
                        </div>
                        <div>
                            <span class="las la-clipboard-list"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>124</h1>
                            <span>Orders</span>
                        </div>
                        <div>
                            <span class="las la-shopping-bag"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>$7k</h1>
                            <span>Income</span>
                        </div>
                        <div>
                            <span class="lab la-google-wallet"></span>
                        </div>
                    </div>
                </div>

                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Recent Projects</h3>

                                <button>See all <span class="las la-arrow-right"></span></button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table width="100%">
                                        <thead>
                                            <tr>
                                                <td>Project Title</td>
                                                <td>Department</td>
                                                <td>Status</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>UI/UX Design</td>
                                                <td>UI Team</td>
                                                <td>
                                                    <span class="status purple"></span>
                                                    Review
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Web Development</td>
                                                <td>Frontend</td>
                                                <td>
                                                    <span class="status pink"></span>
                                                    In progress
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ushop app</td>
                                                <td>Mobile Team</td>
                                                <td>
                                                    <span class="status orange"></span>
                                                    Pending
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>UI/UX Design</td>
                                                <td>UI Team</td>
                                                <td>
                                                    <span class="status purple"></span>
                                                    Review
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Web Development</td>
                                                <td>Frontend</td>
                                                <td>
                                                    <span class="status pink"></span>
                                                    In progress
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ushop app</td>
                                                <td>Mobile Team</td>
                                                <td>
                                                    <span class="status orange"></span>
                                                    Pending
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>UI/UX Design</td>
                                                <td>UI Team</td>
                                                <td>
                                                    <span class="status purple"></span>
                                                    Review
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Web Development</td>
                                                <td>Frontend</td>
                                                <td>
                                                    <span class="status pink"></span>
                                                    In progress
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ushop app</td>
                                                <td>Mobile Team</td>
                                                <td>
                                                    <span class="status orange"></span>
                                                    Pending
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="customers">
                        <div class="card">
                            <div class="card-header">
                                <h3>Customers</h3>

                                <button>See all<span class="las la-arrow-right"></span></button>
                            </div>
                            <div class="card-body">
                                <div class="customer">
                                    <div class="info">
                                        <img src="" width="40px" height="40px" alt="">
                                        <div>
                                            <h4>Nguyen Nhat Truong</h4>
                                            <small>Leader</small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>

                                <div class="customer">
                                    <div class="info">
                                        <img src="" width="40px" height="40px" alt="">
                                        <div>
                                            <h4>Mai Van Thuan</h4>
                                            <small>Member</small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>

                                <div class="customer">
                                    <div class="info">
                                        <img src="" width="40px" height="40px" alt="">
                                        <div>
                                            <h4>Nguyen Phuoc An</h4>
                                            <small>Member</small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>

                                <div class="customer">
                                    <div class="info">
                                        <img src="" width="40px" height="40px" alt="">
                                        <div>
                                            <h4>Nguyen Le Hoang Hiep</h4>
                                            <small>Member</small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>

                                <div class="customer">
                                    <div class="info">
                                        <img src="" width="40px" height="40px" alt="">
                                        <div>
                                            <h4>Vo Nhat Nguyen</h4>
                                            <small>Member</small>
                                        </div>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    </body>
</html>
