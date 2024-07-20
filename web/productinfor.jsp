<%-- 
    Document   : productinfor
    Created on : May 27, 2024, 11:13:04 AM
    Author     : nguye
--%>
<%@page import="model.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Shopping</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

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
            .custom-margin {
                margin-right: 0.5rem; /* Adjust this value for smaller or larger margins */
            }
            /*            .btn btn-outline-secondary rounded-pill px-3 text-primary{
                            width:60px
                        }*/

        </style>
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <jsp:include page="Navbar.jsp"></jsp:include>
        <%
        Object obj1 = session.getAttribute("khachHang");
        Account khachHang1 = null;
        if (obj1!=null)
                khachHang1 = (Account)obj1;		
                if(khachHang1==null){		
        %>
        <h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
        <%
                        }else {
				
        %>

        <%
                String baoLoi = request.getAttribute("baoLoi")+"";
                baoLoi = (baoLoi.equals("null"))?"":baoLoi;
		
                String hoVaTen= khachHang1.getName();
		
                String gioiTinh= khachHang1.getGender();
		
                String ngaySinh= khachHang1.getDateOfBirth();	
		
                String dienThoai= khachHang1.getPhoneNumber();
		
                String email= khachHang1.getEmail();	
            
        %>


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->




        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4" href="loadproduct" style="font-family: fantasy">Shop bóng đá 5B</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <!-- tìm kiếm sản phẩm -->
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <form action="loadproduct" method="GET">
                                        <input type="hidden" name="hanhDong" value="search">
                                        <input name="txt" type="text" class="form-control p-3" placeholder="Tìm kiếm sản phẩm" aria-describedby="search-icon-1">                                  
                                        <button type="submit" class="btn btn-secondary btn-number">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>

                            <!-- end tìm kiếm sản phẩm -->
                            <div class="col-6"></div>
                            <!-- sắp xếp theo tiêu chí -->
                            <div class="col-xl-3">
                                <form action="loadproduct" method="GET">
                                    <input type="hidden" name="hanhDong" value="sortProduct">
                                    <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                        <label for="sortOrder">Sắp xếp theo:</label>
                                        <select id="sortOrder" name="sortOrder" class="border-0 form-select-sm bg-light me-3">
                                            <option value="sortTang">Giá: thấp -> cao</option>
                                            <option value="sortGiam">Giá: cao -> thấp</option>
                                        </select>
                                        <button type="submit" class="btn btn-secondary btn-number">Sắp xếp</button>
                                    </div>
                                </form>
                            </div>

                            <!-- end sắp xếp theo tiêu chí -->
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Phân loại</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <c:forEach items="${listC}" var="o">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="categories?categoriesID=${o.categoriesID}"><i class=" me-2"></i>${o.name}</a>
                                                        </div>
                                                    </li>

                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">

                                    </div>


                                    <!-- product info -->
                                    <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="img/messi.jpg" class="img-fluid w-100 rounded" alt="" style="height: 200px">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">

                                <div class="container" style="margin-left: 130px">
                                    <div class="row">  

                                        <c:forEach items="${listP}" var="o" varStatus="loop" >
                                            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 custom-margin" style="margin-bottom: 20px; padding-top: 20px">
                                                <div class="card h-100" style="transform: scale(1.1);">

                                                    <img class="card-img-top" src="${o.image}" alt="${o.name}">
                                                    </a>
                                                    <div class="card-body">
                                                        <h4 class="card-title">${o.name}</h4>
                                                        <p class="card-text">${o.description}</p>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <p class="giatien text-dark fs-6 fw-bold mb-0"">${o.price} VND</p>
                                                            <a href="ProductDetail?productID=${o.productID}" class="btn btn-outline-secondary rounded-pill px-3 text-primary">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                                            </a>
                                                        </div>
                                                    </div>  
                                                </div>
                                            </div>
                                            <c:if test="${loop.index % 3 == 2 or loop.last}">
                                            </div><div class="row">
                                            </c:if>
                                        </c:forEach>
                                        <div class="pagination">
                                            <c:if test="${currentPage > 1}">
                                                <a href="loadproduct?page=1">First</a>
                                                <a href="loadproduct?page=${currentPage - 1}">Previous</a>
                                            </c:if>
                                            <span>Page ${currentPage}</span>
                                            <c:if test="${currentPage < noOfPages}">
                                                <a href="loadproduct?page=${currentPage + 1}">Next</a>
                                                <a href="loadproduct?page=${noOfPages}">Last</a>
                                            </c:if>
                                        </div>

                                    </div>
                                </div>
                                <!-- end product info -->




                                <!--                                <div class="col-12">
                                                                    <div class="pagination d-flex justify-content-center mt-5">
                                                                        <a href="#" class="rounded">&laquo;</a>
                                                                        <a href="#" class="active rounded">1</a>
                                                                        <a href="#" class="rounded">2</a>
                                                                        <a href="#" class="rounded">3</a>
                                                                        <a href="#" class="rounded">4</a>
                                                                        <a href="#" class="rounded">5</a>
                                                                        <a href="#" class="rounded">6</a>
                                                                        <a href="#" class="rounded">&raquo;</a>
                                                                    </div>
                                                                </div>-->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Fruits Shop End-->

    <!-- Footer Start -->
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
    <!-- Footer End -->





    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

    <%} %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
