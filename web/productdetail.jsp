<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="model.Account"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Account khachHangg = (Account) session.getAttribute("khachHang");
    if (khachHangg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Detail</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .product-container {
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                border-radius: 10px;
                background-color: #fff;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .product-image img {
                max-width: 100%;
                border-radius: 10px;
            }
            .product-description p {
                font-size: 18px;
            }
            .size-selection {
                margin-top: 20px;
            }
            .size-button {
                margin: 5px;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s;
            }
            .size-button.active {
                background-color: #007bff;
                color: #fff;
            }
            .checkout-container {
                margin-top: 20px;
                text-align: center;
            }
            .checkout-icon {
                font-size: 30px;
                color: #007bff;
                cursor: pointer;
                transition: transform 0.3s;
            }
            .checkout-icon:hover {
                transform: scale(1.2);
            }
            .container {
                margin-top: 20px;
            }
            .card-body {
                font-family: 'Roboto', sans-serif;
            }
            .title {
                font-weight: 700;
                margin-bottom: 20px;
            }
            .item-property p {
                margin-bottom: 10px;
            }
            .btn-back {
                margin-bottom: 20px;
            }
            .col-sm-5.border-right {
                padding-right: 20px;
            }
            .img-big-wrap {
                text-align: center;
            }
            .img-big-wrap img {
                max-width: 100%;
                max-height: 300px;
            }
            .col-sm-7 {
                padding-left: 20px;
            }
        </style>
        <title>Home Page</title>
        <style>
            .featured__item__pic__hover li:nth-child(2) a i {
                /* CSS properties */
                /* Ví dụ: */
                display: none;
            }

            .featured__item__pic__hover li:nth-child(2) a::after {
                content: "Buy";
                /* CSS properties */
                /* Ví dụ: */
                /* ... */
            }
            .featured__item__text h6 a {
                font-weight: bold;
                text-decoration: none;
            }

            .featured__item__text h6 a:hover {
                text-decoration: underline;
            }

            .featured__item__text .price {
                font-weight: normal;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
            }
            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                margin-bottom: 30px;
            }
            .feedbackProduct {
                width: calc(100% - 130px); /* Adjusted to account for button width and margin */
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
            .featured {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .review {
                display: flex;
                align-items: flex-start;
                padding: 15px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 0 5px rgba(0,0,0,0.05);
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .review:hover {
                transform: scale(1.02);
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .review img {
                border-radius: 50%;
                width: 50px;
                height: 50px;
                margin-right: 15px;
            }
            .review-content {
                max-width: calc(100% - 65px);
            }
            .review-content h5 {
                margin: 0 0 5px;
                font-size: 16px;
                font-weight: bold;
                color: #333;
            }
            .review-content p {
                margin: 0;
                font-size: 14px;
                line-height: 1.5;
                color: #555;
            }
            .review {
                position: relative;
                padding: 10px;
                border: 1px solid #ccc;
                margin-bottom: 10px;
                border-radius: 5px;
            }

            .review-options {
                position: absolute;
                top: 10px;
                right: 10px;
            }

            .delete-btn {
                background: none;
                border: none;
                cursor: pointer;
                padding: 0;
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
                            <a class="nav-link" href="loadproduct"><img src="img/logo/iconquanao.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Bán hàng
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PitchServlet"><img src="img/logo/iconsanbong.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
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
                                <a class="dropdown-item" href="HistoryBookingPitchServlet">Lịch sử đặt sân</a>
                                <a class="dropdown-item" href="OrderListHistory">Lịch sử mua hàng</a>
                                <a class="dropdown-item" href="UserController?hanhDong=dang-xuat">Đăng xuất</a>
                            </div>
                            <% }%>
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

        <div class="container">
            <div class="product-container">
                <h2 class="text-center mb-4">Product Detail</h2>
                <div class="row">
                    <div class="text-center">
                        <h4>Chi tiết sản phẩm</h4>
                    </div>
                    <br>
                    <section class="featured spad">
                        <div class="row">
                            <aside class="col-sm-5 border-right">
                                <article class="gallery-wrap"> 
                                    <div class="img-big-wrap">
                                        <div> <a href="#"><img src="${product.getImage()}"></a></div>
                                    </div>
                                </article>
                            </aside>
                            <aside class="col-sm-7">
                                <article class="card-body p-5">
                                    <h3 class="title mb-3">${product.getName()}</h3>
                                    <dl class="item-property">      
                                        <!--<dd><p>Category: ${c}</p></dd>-->
                                        <!--<dd><p>Availibility: In Stock</p></dd>-->
                                        <dd><p>${product.getDescription()}</p></dd>      
                                        <c:choose>
                                            <c:when test="${sessionScope.khachHang != null}">
                                                <dd>
                                                    <i class="fas fa-credit-card checkout-icon" onclick="goToCheckout()"> Thêm vào giỏ hàng</i>
                                                </dd>
                                            </c:when>
                                            <c:otherwise>
                                                <dd>
                                                    <i>Bạn cần đăng nhập để thêm vào giỏ hàng</i>
                                                    <a href="login.jsp">Đăng Nhập </a>
                                                </dd>
                                            </c:otherwise>
                                        </c:choose>
                                    </dl>

                                </article>
                            </aside>
                        </div>
                    </section>
                    <div class="col-md-6">
                        <div class="checkout-container">
                            <a href="loadproduct" class="btn btn-primary">Back</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- comment -->
        <div>
            <form action="ProductDetail" method="post">
                <input  type="hidden" name="action" value="addNew">
                <input  type="hidden" name="product" value="addNew">
                <input  type="hidden" name="productID" value="${productID}"> 
                <input  type="hidden" name="khachHang" value="${khachHang}">
                <input class="feedbackProduct" type="text" name="feedback" required="required">
                <button type="submit" value="feedback">Gui Nhan Xet</button>
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
                                    <form action="deletefeedbackproduct" method="doGet">

                                        <div class="review-options">
                                            <button class="delete-btn">
                                                <img src="img/bin.png" alt="Delete" style="width: 24px; height: 24px;">
                                            </button>
                                        </div>
                                        <input  type="hidden" name="productID" value="${productID}"> 
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

        <script>
            function selectSize(size) {
                var buttons = document.getElementsByClassName("size-button");
                for (var i = 0; i < buttons.length; i++) {
                    buttons[i].classList.remove("active");
                }
                event.currentTarget.classList.add("active");
            }

             function goToCheckout() {
                window.location.href = "${pageContext.request.contextPath}/buy?num=1&productID=${product.productID}";
                    }

                    function changeStyle(element, isHover) {
                        if (isHover) {
                            element.style.fontWeight = 'bold';
                        } else {
                            element.style.fontWeight = 'normal';
                        }
                    }
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Start Script -->
        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- End Script -->
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
