<%-- 
    Document   : datsan
    Created on : May 17, 2024, 7:49:07 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Sân 5 người</title>
        <style>
            /* Định dạng kích thước của hình ảnh sân */
            .stadium-img {
                width: 100%;
                height: auto;
                max-height: 50vh; /* Chiếm 50% chiều dọc màn hình */
            }

            /* Phần thông tin sân */
            #stadium-info {
                background-color: #f8f9fa; /* Nền màu trắng */
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
            }

            /* Định dạng tiêu đề */
            #stadium-info h2 {
                color: #333; /* Màu chữ đậm */
                font-size: 24px; /* Kích thước chữ */
                margin-bottom: 20px; /* Khoảng cách với các phần thông tin khác */
            }

            /* Định dạng các mục thông tin */
            #stadium-info p {
                color: #555; /* Màu chữ nhạt */
                font-size: 16px; /* Kích thước chữ */
                margin-bottom: 10px; /* Khoảng cách giữa các mục */
            }
            body {
                background-color: #f0f0f0;
            }
            .container {
                display: flex;
                height: 100vh;
                padding: 20px;
            }
            .reservation-form {
                width: 30%;
                padding: 20px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .reservation-form h3 {
                margin-bottom: 20px;
                font-weight: bold;
            }
            .reservation-form .form-group {
                margin-bottom: 15px;
            }
            .reservation-form .btn-primary {
                background-color: #007bff;
                color: #fff;
                border: none;
                width: 100%;
                padding: 10px;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            .reservation-form .btn-primary:hover {
                background-color: #0056b3;
            }
            .time-slot-table {
                width: 70%;
                padding: 20px;
                box-sizing: border-box;
            }
            .time-slot-table h3 {
                margin-bottom: 20px;
                font-weight: bold;
            }
            .time-slot-table .table {
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .time-slot-table .btn {
                margin: 5px 0;
                width: 100%;
            }
            .time-slot-table .btn-booked {
                background-color: #e0e0e0;
                color: #888;
            }
            .time-slot-table .btn-available {
                background-color: #007bff;
                color: #fff;
                transition: background-color 0.3s ease;
            }
            .time-slot-table .btn-available:hover {
                background-color: #0056b3;
            }
            .time-slot-table .date-nav {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .time-slot-table .date-nav button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            .time-slot-table .date-nav button:hover {
                background-color: #0056b3;
            }
            body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .rating > input {
            display: none;
        }
        .rating > label {
            cursor: pointer;
            font-size: 2.5rem;
            color: #ccc;
            transition: color 0.3s;
        }
        .rating > label:hover,
        .rating > input:checked ~ label {
            color: #ffdd00;
        }
        .rating > input:checked ~ label:hover,
        .rating > input:checked ~ label:hover ~ label {
            color: #ccc;
        }
        .average-rating {
            font-size: 1.5rem;
            margin-top: 10px;
            text-align: center;
            color: #555;
        }
        .comment-button {
            display: block;
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .comment-button:hover {
            background-color: #0056b3;
        }
        .comment-dropdown {
            display: none;
            margin-top: 10px;
        }
        .comment-dropdown textarea {
            width: 100%;
            height: 100px;
            resize: none;
            margin-top: 5px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-family: Arial, sans-serif;
            font-size: 1rem;
        }
        .comment-dropdown button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .comment-dropdown button:hover {
            background-color: #218838;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .question-form {
            width: 100vw;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .question-form h3 {
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }
        .question-form .form-group {
            margin-bottom: 20px;
        }
        .question-form label {
            font-weight: bold;
        }
        .question-form textarea {
            width: 100%;
            height: 150px;
            resize: none;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-family: Arial, sans-serif;
            font-size: 1rem;
        }
        .question-form button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .question-form button:hover {
            background-color: #0056b3;
        }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"></jsp:include>


        <a href="trangchu.jsp">Trang chủ </a>> Sân bóng đá 5 người

        <div class="container-fluid" style="margin-top: 30px">
            <div class="row">
                <!-- Phần Carousel -->
                <div id="carouselExampleControls" class="carousel slide col-md-8" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100 stadium-img" src="img/san1.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/san2.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/san3.jpg" alt="Third slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 stadium-img" src="img/san4.jpg" alt="Fourth slide">
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
                    <p><strong>Giờ mở cửa:</strong> 8:00 AM</p>
                    <p><strong>Giờ đóng cửa:</strong> 10:00 PM</p>
                    <p><strong>Giá sân:</strong> $50/giờ</p>
                    <p><strong>Dịch vụ:</strong> Đồ uống, Thuê thiết bị thể thao</p>
                </div>
            </div>
        </div>

        <!-- đặt sân theo yêu cầu -->
        <div class="container">
            <div class="reservation-form">
                <h3>Đặt sân theo yêu cầu</h3>
                <form action="payPitch.jsp" method="post">
                    <div class="form-group">
                        <label for="fullname">Họ và tên</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="bookingDate">Chọn ngày</label>
                        <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
                    </div>
                    <div class="form-group">
                        <label for="hours">Số giờ đặt</label>
                        <select class="form-control" id="hours" name="hours" required>
                            <option value="1">1 giờ</option>
                            <option value="1.5">1,5 giờ</option>
                            <option value="2">2 giờ</option>
                            <option value="2.5">2,5 giờ</option>
                            <option value="3">3 giờ</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="notes">Ghi chú</label>
                        <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Đặt sân</button>
                </form>
            </div>
            <div class="time-slot-table">
                   <h3>Chọn Khung Giờ và Giá</h3>
                   <table class="table" >
                <thead>
                    <tr>
                        <th>Thời Gian</th>
                        <th>Giá</th>
                        <th>Trạng Thái</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>07:00 - 08:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>08:00 - 09:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>09:00 - 10:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>10:00 - 11:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>11:00 - 12:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>12:00 - 13:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>13:00 - 14:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>14:00 - 15:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>15:00 - 16:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>16:00 - 17:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>17:00 - 18:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>18:00 - 19:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>19:00 - 20:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>20:00 - 21:00</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                    <tr>
                        <td>21:00 - 21:30</td>
                        <td>800K</td>
                        <td>Available</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
        
        <!-- đánh giá sân -->
        <div class="container-fluid" style="font-size: 30px; background-color:#FFFFFF">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h3 class="text-center">Đánh Giá Sân</h3>
                <div class="rating">
                    <input type="radio" id="star5" name="rating" value="5">
                    <label for="star5">&#9733;</label>
                    <input type="radio" id="star4" name="rating" value="4">
                    <label for="star4">&#9733;</label>
                    <input type="radio" id="star3" name="rating" value="3">
                    <label for="star3">&#9733;</label>
                    <input type="radio" id="star2" name="rating" value="2">
                    <label for="star2">&#9733;</label>
                    <input type="radio" id="star1" name="rating" value="1">
                    <label for="star1">&#9733;</label>
                </div>
                <div class="average-rating">Trung Bình: <span id="averageRating">0</span> sao</div>
                <button class="comment-button btn btn-primary">Ghi Nhận Xét</button>
                <div class="comment-dropdown">
                    <textarea class="form-control" placeholder="Nhập nhận xét của bạn"></textarea>
                    <button class="btn btn-success mt-2">Gửi</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script>
        $(document).ready(function() {
            // Xử lý khi người dùng chọn sao
            $('input[name="rating"]').change(function() {
                var rating = $(this).val();
                $('#averageRating').text(rating);
            });

            // Xử lý khi người dùng bấm nút Ghi Nhận Xét
            $('.comment-button').click(function() {
                $('.comment-dropdown').toggle();
            });
        });
    </script>
   <!-- end đánh giá sân -->
   
   <!-- hỏi đáp -->
   <div class="container" >
        <div class="question-form">
            <h3>Để Lại Câu Hỏi</h3>
            <form action="#" method="post">
                <div class="form-group">
                    <label for="fullname">Họ và tên</label>
                    <input type="text" class="form-control" id="fullname" name="fullname" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="question">Câu Hỏi</label>
                    <textarea class="form-control" id="question" name="question" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Gửi Câu Hỏi</button>
            </form>
        </div>
    </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
