<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListPitchces</title>

    <!-- Import các thư viện CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="lib/lightbox/css/lightbox.min.css">
    <link rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css">
    <link href="css/style.css" rel="stylesheet">

    <!-- Import các thư viện JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <style>
        /* CSS tùy chỉnh cho trang của bạn */
        .stadium-img {
            width: 100%;
            height: auto;
            max-height: 50vh; /* Chiếm 50% chiều dọc màn hình */
        }

        #stadium-info {
            background-color: #F1F1EF; /* Nền màu trắng */
            padding: 20px;
            border-radius: 7px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
        }

        #stadium-info h2 {
            color: #333; /* Màu chữ đậm */
            font-size: 24px; /* Kích thước chữ */
            margin-bottom: 20px; /* Khoảng cách với các phần thông tin khác */
        }

        .footer {
            background-color: #F1F1EF;
            font-family: unset;
            height: 330px;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.9); /* Màu nền đen với độ mờ 90% */
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
            window.location.href = 'index.jsp';
        </script>
        <% } else if (khachHang1.getRole() ==1) { %>
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
                window.location.href = 'homeadmin.jsp';
            }, 2000);
        </script>
        <% } %>

<!-- Navbar -->
<%
Object obj = session.getAttribute("khachHang");
Account khachHang = null;
if (obj != null) {
    khachHang = (Account) obj;
}

if (khachHang != null && khachHang.getRole() == 2) {
    // Navbar cho role 2
%>
<jsp:include page="Navbar_1.jsp"></jsp:include>
<%
} else {
    // Navbar mặc định cho các role khác (bao gồm cả role 3)
%>
<jsp:include page="Navbar.jsp"></jsp:include>
<%
}
%>
<!-- Kết thúc Navbar -->

<!-- Nội dung của trang -->
<div class="mt-4">
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-interval="2000">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/pagecontent/theme1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="img/pagecontent/theme2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="img/pagecontent/theme3.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top">
        <div class="col mb-3">
            <a href="/" class="d-flex align-items-center mb-3 link-body-emphasis text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <p class="text-body-secondary"></p>
        </div>
        <div class="col mb-3">
            <h5>Chính sách</h5>
            <ul class="nav flex-column">
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Chính sách bảo mật</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Điều khoản sử dụng</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Hướng dẫn đổi trả</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Cam kết chất lượng</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Giao hàng & Nhận hàng</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Đặt hàng & Thanh toán</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Tuyển dụng</a></li>
            </ul>
        </div>
        <div class="col mb-3">
            <h5>Thông tin liên hệ</h5>
            <ul class="nav flex-column">
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Địa chỉ: Khu đô thị FPT, Hòa Hải, </br>Ngũ Hành Sơn, Đà Nẵng</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Điện thoại: 0905134237</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Email: hiepnlhde170421@fpt.edu.vn</a></li>
                <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Hotline (Zalo): 0905134237</a></li>
            </ul>
        </div>
        <div class="col mb-3">
            <h5>This is the specific location</h5>
            <div class="map">
                <a href="https://maps.app.goo.gl/8svQx9WGs9rEZdEE9"><img src="img/local/local.jpg" onclick="https://maps.app.goo.gl/8svQx9WGs9rEZdEE9"
                                                                         width="400" height="200" style="border-radius: 10px;"></a>
            </div>
        </div>
    </footer>
</div>

<!-- Import các thư viện JavaScript bổ sung -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
