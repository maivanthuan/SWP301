<%-- 
    Document   : footer
    Created on : May 27, 2024, 12:01:16 PM
    Author     : thuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        </div>
    </body>
</html>
