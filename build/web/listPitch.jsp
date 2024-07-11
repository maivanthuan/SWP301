<%-- 
    Document   : list
    Created on : May 20, 2024, 8:31:56 PM
    Author     : boyin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
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
        <jsp:include page="Navbar.jsp"></jsp:include>
        
        <!-- thông tin sân -->
        <div class="container-fluid" style="margin-top: 30px">
            <div class="row">
                <!-- Phần Carousel -->
                <div id="carouselExampleControls" class="carousel slide col-md-8" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100 stadium-img" src="img/thongtin/san1.jpg" alt="First slide" style="border-radius: 7px;">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/thongtin/san2.jpg" alt="Second slide" style="border-radius: 7px;">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/thongtin/san3.jpg" alt="Third slide" style="border-radius: 7px;">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/thongtin/san4.jpg" alt="Fourth slide" style="border-radius: 7px;">
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
                    <p><strong>Giờ mở cửa:</strong> 6:00 AM</p>
                    <p><strong>Giờ đóng cửa:</strong> 22:00 PM</p>
                    <p><strong>Giá sân:</strong> </br>-Sân 5: 250.000/1h </br>-Sân 7: 450.000/1h</br>-Sân 11: 15.000.000/2h </p>
                    <p><strong>Dịch vụ:</strong> Đồ uống, Thuê thiết bị thể thao</p>
                </div>
            </div>
        </div>
        <!-- End thông tin -->       
       
        <!-- List sân -->
        <div class="container">
            <div class="row ">
                <div class="col-md-12 col-12">
                    <div nh-block="aue2hl0" nh-block-cache="false" class="box-playground-page">
                        <h3 class="title-section mt-4">Danh sách sân</h3>
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                <div nh-playground="6950" class="playground-item swiper-slide">
                                    <div class="inner-image mb-3">
                                        <div class="ratio-3-2">
                                            <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                <img src="img/list/san1.png" style="width: 100%; border-radius: 10px;">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="inner-content">
                                        <div class="playground-title">
                                            <h5>Sân bóng FPT</h5>
                                            <p class="card-text">Số sân: Sân số 1</p>
                                            <p class="card-text">Loại sân: Sân 5 người</p>
                                            <a href="pitchInfo.jsp" class="btn btn-primary">Đặt ngay</a>
                                        </div>                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                <div nh-playground="6950" class="playground-item swiper-slide">
                                    <div class="inner-image mb-3">
                                        <div class="ratio-3-2">
                                            <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                <img src="img/list/san2.png" style="width: 100%; border-radius: 10px;">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="inner-content">
                                        <div class="playground-title">
                                            <h5>Sân bóng FPT</h5>
                                            <p class="card-text">Số sân: Sân số 2</p>
                                            <p class="card-text">Loại sân: Sân 5 người</p>
                                            <a href="pitchInfo.jsp" class="btn btn-primary">Đặt ngay</a>
                                        </div>                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                <div nh-playground="6950" class="playground-item swiper-slide">
                                    <div class="inner-image mb-3">
                                        <div class="ratio-3-2">
                                            <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                <img src="img/list/san3.png" style="width: 100%; border-radius: 10px;">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="inner-content">
                                        <div class="playground-title">
                                            <h5>Sân bóng FPT</h5>
                                            <p class="card-text">Số sân: Sân số 3</p>
                                            <p class="card-text">Loại sân: Sân 5 người</p>
                                            <a href="pitchInfo.jsp" class="btn btn-primary">Đặt ngay</a>
                                        </div>                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                <div nh-playground="6950" class="playground-item swiper-slide">
                                    <div class="inner-image mb-3">
                                        <div class="ratio-3-2">
                                            <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                <img src="img/list/san5.png" style="width: 100%; border-radius: 10px;">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="inner-content">
                                        <div class="playground-title">
                                            <h5>Sân bóng FPT</h5>
                                            <p class="card-text">Số sân: Sân số 4</p>
                                            <p class="card-text">Loại sân: Sân 5 người</p>
                                            <a href="pitchInfo.jsp" class="btn btn-primary">Đặt ngay</a>
                                        </div>                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                <div nh-playground="6950" class="playground-item swiper-slide">
                                    <div class="inner-image mb-3">
                                        <div class="ratio-3-2">
                                            <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                <img src="img/list/san6.png" style="width: 100%; border-radius: 10px;">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="inner-content">
                                        <div class="playground-title">
                                            <h5>Sân bóng FPT</h5>
                                            <p class="card-text">Số sân: Sân số 5</p>
                                            <p class="card-text">Loại sân: Sân 5 người</p>
                                            <a href="pitchInfo.jsp" class="btn btn-primary">Đặt ngay</a>
                                        </div>                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                <div nh-playground="6950" class="playground-item swiper-slide">
                                    <div class="inner-image mb-3">
                                        <div class="ratio-3-2">
                                            <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                <img src="img/list/san7.png" style="width: 100%; border-radius: 10px;">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="inner-content">
                                        <div class="playground-title">
                                            <h5>Sân bóng FPT</h5>
                                            <p class="card-text">Số sân: Sân số 6</p>
                                            <p class="card-text">Loại sân: Sân 7 người</p>
                                            <a href="pitchInfo.jsp" class="btn btn-primary">Đặt ngay</a>
                                        </div>                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                <div nh-playground="6950" class="playground-item swiper-slide">
                                    <div class="inner-image mb-3">
                                        <div class="ratio-3-2">
                                            <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                <img src="img/list/san8.png" style="width: 100%; border-radius: 10px;">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="inner-content">
                                        <div class="playground-title">
                                            <h5>Sân bóng FPT</h5>
                                            <p class="card-text">Số sân: Sân số 7</p>
                                            <p class="card-text">Loại sân: Sân 7 người</p>
                                            <a href="pitchInfo.jsp" class="btn btn-primary">Đặt ngay</a>
                                        </div>                       
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                <div nh-playground="6950" class="playground-item swiper-slide">
                                    <div class="inner-image mb-3">
                                        <div class="ratio-3-2">
                                            <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                <img src="img/list/san9.png" style="width: 100%; border-radius: 10px;">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="inner-content">
                                        <div class="playground-title">
                                            <h5>Sân bóng FPT</h5>
                                            <p class="card-text">Số sân: Sân số 8</p>
                                            <p class="card-text">Loại sân: Sân 11 người</p>
                                            <a href="pitchInfo.jsp" class="btn btn-primary">Đặt ngay</a>
                                        </div>                       
                                    </div>
                                </div>
                            </div>
                        </div>                       
                    </div>
                </div>
            </div>
        </div>
        <!-- End List -->
        
        <!-- support -->
        <div nh-row="kf19v8c" class=" footer-top">
            <div class="container">
                <div class="row ">
                    <div class="col-md-12 col-12">
                        <img nh-lazy="image" class="img-fluid" alt="banner" src="img/pagecontent/culua.jpg" style="border-radius: 10px;">
                    </div>
                </div>
            </div>
        </div>
        <!-- End support -->
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
