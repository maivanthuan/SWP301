<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Include Font Awesome for Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                position: relative; /* Đặt vị trí tương đối để cho các phần tử con sử dụng vị trí tuyệt đối */
            }
            body::after {
                content: '';
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('img/pagecontent/theme1.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                filter: blur(5px);
                -webkit-filter: blur(5px);
                z-index: -1;
            }
            .login-with-google-btn {
                transition: background-color .3s, box-shadow .3s;
                padding: 12px 16px 12px 42px;
                border: none;
                border-radius: 3px;
                box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 1px 1px rgba(0, 0, 0, .25);
                color: #757575;
                font-size: 14px;
                font-weight: 500;
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
                background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMTcuNiA5LjJsLS4xLTEuOEg5djMuNGg0LjhDMTMuNiAxMiAxMyAxMyAxMiAxMy42djIuMmgzYTguOCA4LjggMCAwIDAgMi42LTYuNnoiIGZpbGw9IiM0Mjg1RjQiIGZpbGwtcnVsZT0ibm9uemVybyIvPjxwYXRoIGQ9Ik05IDE4YzIuNCAwIDQuNS0uOCA2LTIuMmwtMy0yLjJhNS40IDUuNCAwIDAgMS04LTIuOUgxVjEzYTkgOSAwIDAgMCA4IDV6IiBmaWxsPSIjMzRBODUzIiBmaWxsLXJ1bGU9Im5vbnplcm8iLz48cGF0aCBkPSJNNCAxMC43YTUuNCA1LjQgMCAwIDEgMC0zLjRWNUgxYTkgOSAwIDAgMCAwIDhsMy0yLjN6IiBmaWxsPSIjRkJCQzA1IiBmaWxsLXJ1bGU9Im5vbnplcm8iLz48cGF0aCBkPSJNOSAzLjZjMS4zIDAgMi41LjQgMy40IDEuM0wxNSAyLjNBOSA5IDAgMCAwIDEgNWwzIDIuNGE1LjQgNS40IDAgMCAxIDUtMy43eiIgZmlsbD0iI0VBNDMzNSIgZmlsbC1ydWxlPSJub256ZXJvIi8+PHBhdGggZD0iTTAgMGgxOHYxOEgweiIvPjwvZz48L3N2Zz4=');
                background-color: white;
                background-repeat: no-repeat;
                background-position: 12px 11px;
            }
            .login-with-google-btn:hover {
                box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 2px 4px rgba(0, 0, 0, .25);
            }
            .login-with-google-btn:active {
                background-color: #eeeeee;
            }
            .login-with-google-btn:focus {
                outline: none;
                box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 2px 4px rgba(0, 0, 0, .25), 0 0 0 3px #c8dafc;
            }
            .login-with-google-btn:disabled {
                filter: grayscale(100%);
                background-color: #ebebeb;
                box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 1px 1px rgba(0, 0, 0, .25);
                cursor: not-allowed;
            }
            body {
                text-align: center;
                padding-top: 2rem;
            }
        </style>
    </head>
    <body>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">
                                    <form class="text-center" action="UserController" method="POST">
                                        <input type="hidden" name="hanhDong" value="dang-nhap" >
                                        <h2 class="fw-bold mb-2 text-uppercase">Đăng Nhập</h2>
                                        <p class="text-white-50 mb-5">Vui lòng nhập tên đăng nhập và mật khẩu của bạn!</p>
                                        <%
                                    String baoLoi = request.getAttribute("baoLoi")+"";
                                    if(baoLoi.equals("null")){
                                            baoLoi = "";
                                    }
                                        %>
                                        <div class="text-center"><span class="red"><%=baoLoi %></span></div>
                                        <div class="form-floating">
                                            <!-- Form Start -->

                                            <div class="mb-3">
                                                <label for="tenDangNhap" class="form-label">Tên Đăng Nhập:</label>

                                                <input type="text" class="form-control form-control-lg" id="tenDangNhap" name="tenDangNhap" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="password" class="form-label">Mật Khẩu:</label>
                                                <input type="password" class="form-control form-control-lg" id="matKhau" name="matKhau" required>
                                            </div>
                                            <div class="d-grid">
                                                <input type="submit" class="btn btn-outline-light btn-lg px-5" value="Đăng Nhập">
                                            </div>
                                    </form>
                                    <!-- Form End -->
                                    <div class="text-center mt-3">
                                        <p class="mb-0">Bạn chưa có tài khoản? <a href="Register.jsp" class="text-white-50 fw-bold">Đăng Ký</a></p>
                                        <p><a href="forget-password.jsp" class="text-white-50">Quên Mật Khẩu?</a></p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                    <div class="d-flex justify-content-center text-center mt-4 pt-1">
    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http%3A%2F%2Flocalhost%3A9999%2FDemo%2FLoginGoogleHandler&response_type=code&client_id=456948524553-jppq9urgcnh7ob7n6eg45vb04hnsaite.apps.googleusercontent.com&prompt=consent" type="button" class="login-with-google-btn" style="color: black">
        Đăng Nhập Bằng Google
    </a>
</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Include Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>