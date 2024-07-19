<%-- 
    Document   : productRevenue
    Created on : Jul 3, 2024, 10:13:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
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
        <title>JSP Page</title>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
        <link rel= "stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="style.css">
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

        </style>
    </head>
    <body>
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
                        <a href="adminBookingPitchHistoryServlet"><span class="las la-user-circle"></span>
                            <span>Lịch Sử Đặt Sân</span>
                        </a>
                    </li>
                    <li>
                        <a href="adminProductPurchaseHistoryServlet"><span class="las la-user-circle"></span>
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
                <canvas id="sale-revenue"></canvas>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
                <script type="text/javascript">
                var chart = document.getElementById("sale-revenue").getContext("2d");
                var myChart = new Chart(chart, {
                    type: "bar",
                    data: {
                        labels: ["2018", "2019", "2020", "2021", "2022", "2023", "2024"],
                        datasets: [{
                                label: "Product Revenue by Year",
                                data: [${year18}, ${year19}, ${year20}, ${year21}, ${year22}, ${year23}, ${year24}],
                                backgroundColor: "rgba(255, 99, 132, 0.2)",
                                borderColor: "rgba(255, 99, 132, 1)",
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true
                    }
                });
                </script>
                <canvas id="sale-revenue1"></canvas>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
                <script type="text/javascript">
                var chart = document.getElementById("sale-revenue1").getContext("2d");
                var myChart = new Chart(chart, {
                    type: "bar",
                    data: {
                        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                        datasets: [{
                                label: "Product Revenue by month",
                                data: [${requestScope.month1}, ${requestScope.month2}, ${requestScope.month3}, ${requestScope.month4}, ${requestScope.month5}, ${requestScope.month6},
                    ${requestScope.month7}, ${requestScope.month8}, ${requestScope.month9}, ${requestScope.month10}, ${requestScope.month11}, ${requestScope.month12}],
                                backgroundColor: "rgba(255, 99, 132, 0.2)",
                                borderColor: "rgba(255, 99, 132, 1)",
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true
                    }
                });
                </script><!--
                
            
        
            <script src="./vendor/global/global.min.js"></script>
            <script src="./js/quixnav-init.js"></script>
            <script src="./js/custom.min.js"></script>
        
        
                <!-- Vectormap -->
                <script src="./vendor/raphael/raphael.min.js"></script>
                <script src="./vendor/morris/morris.min.js"></script>


                <script src="./vendor/circle-progress/circle-progress.min.js"></script>
                <script src="./vendor/chart.js/Chart.bundle.min.js"></script>

                <script src="./vendor/gaugeJS/dist/gauge.min.js"></script>

                <!--  flot-chart js -->
                <script src="./vendor/flot/jquery.flot.js"></script>
                <script src="./vendor/flot/jquery.flot.resize.js"></script>

                <!-- Owl Carousel -->
                <script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>

                <!-- Counter Up -->
                <script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
                <script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script>
                <script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>

                <script src="./js/dashboard/dashboard-1.js"></script>
            </main>
    </body>
</html>
