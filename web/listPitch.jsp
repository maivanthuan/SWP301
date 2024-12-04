<%-- 
    Document   : list
    Created on : May 20, 2024, 8:31:56 PM
    Author     : boyin
--%>
<%@page import="model.Account"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <% 
     Object obj = session.getAttribute("khachHang");
     Account khachHang = null;
     if (obj != null) {
         khachHang = (Account) obj;
     }
    
     if (khachHang != null) {
         int role = khachHang.getRole(); // Giả sử role lấy từ khách hàng
    
         if (role == 2) {
        %>
        <jsp:include page="Navbar_1.jsp" />
        <%
                } else {
        %>
        <jsp:include page="Navbar.jsp" />
        <%
                }
            } else {
        %>
        <jsp:include page="Navbar.jsp" />
        <%
            }
        %>
        <!-- End Navbar -->
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
        <div class="container mt-4">
            <h3 class="title-section">Lọc Sân</h3>
            <form id="filterForm" class="row g-3">
                <div class="col-md-4">
                    <label for="pitchType" class="form-label">Loại sân</label>
                    <select id="pitchType" class="form-select">
                        <option value="all" selected>Tất cả</option>
                        <option value="5">Sân 5 người</option>
                        <option value="7">Sân 7 người</option>
                        <option value="11">Sân 11 người</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary mt-4" onclick="filterPitches()">Lọc</button>
                </div>
            </form>
        </div>
        <!-- List sân -->
        <div class="container">
            <div class="row ">
                <div class="col-md-12 col-12">
                    <div nh-block="aue2hl0" nh-block-cache="false" class="box-playground-page">
                        <h3 class="title-section mt-4">Danh sách sân</h3>

                        <div id="pitchListContainer" class="row">
                            <c:forEach items="${pitchList}" var="pitch">
                                <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                                    <div nh-playground="6950" class="playground-item swiper-slide">
                                        <div class="inner-image mb-3">
                                            <div class="ratio-3-2">
                                                <a href="pitchInfo.jsp" title="Sân bóng FPT">
                                                    <img src="${pitch.image}" style="width: 100%; border-radius: 10px;">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="inner-content">
                                            <div class="playground-title">
                                                <h5>Sân bóng FPT</h5>
                                                <p class="card-text">Mã sân: ${pitch.pitchID}</p>
                                                <p class="card-text">Loại sân: ${pitch.pitchType}</p>
                                                <form action="BookingTimeServlet" method="post">
                                                    <input type="hidden" name="action" value="1">
                                                    <input type="hidden" name="pitchID" value="${pitch.pitchID}">
                                                    <input type="hidden" name="pitchType" value="${pitch.pitchType}">
                                                    <button type="submit">Book Now</button>
                                                </form>
                                            </div>                       
                                        </div>
                                    </div>
                                </div>  
                            </c:forEach>
                            <div class="pagination">
                                <c:if test="${currentPage > 1}">
                                    <a href="PitchServlet?page=1">First</a>
                                    <a href="PitchServlet?page=${currentPage - 1}">Previous</a>
                                </c:if>
                                <span>Page ${currentPage}</span>
                                <c:if test="${currentPage < noOfPages}">
                                    <a href="PitchServlet?page=${currentPage + 1}">Next</a>
                                    <a href="PitchServlet?page=${noOfPages}">Last</a>
                                </c:if>
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
        </div>
        <!-- End footer -->
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
                            function filterPitches() {
                                var pitchType = $('#pitchType').val();

                                console.log('Filter parameters:', {pitchType});

                                $.ajax({
                                    url: 'filterPitch',
                                    type: 'POST',
                                    data: {
                                        pitchType: pitchType === 'all' ? 'all' : pitchType
                                    },
                                    success: function (response) {
                                        $('#pitchListContainer').html(response);
                                    },
                                    error: function (xhr, status, error) {
                                        console.error('Error filtering pitches:', status, error);
                                    }
                                });
                            }
    </script>
</html>
