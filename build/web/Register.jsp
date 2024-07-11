<%-- 
    Document   : Register
    Created on : May 18, 2024, 11:11:56 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Đăng ký</title>
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
        <style>
            .red {
                color: red;
            }
        </style>
    </head>
    <body>
        <%
                String baoLoi = request.getAttribute("baoLoi")+"";
                baoLoi = (baoLoi.equals("null"))?"":baoLoi;
	
		
                String tenDangNhap= request.getAttribute("tenDangNhap")+"";	
                tenDangNhap = (tenDangNhap.equals("null"))?"":tenDangNhap;
		
                String hoVaTen= request.getAttribute("hoVaTen")+"";
                hoVaTen = (hoVaTen.equals("null"))?"":hoVaTen;
		
                String gioiTinh= request.getAttribute("gioiTinh")+"";
                gioiTinh = (gioiTinh.equals("null"))?"":gioiTinh;
		
                String ngaySinh= request.getAttribute("ngaySinh")+"";
                ngaySinh = (ngaySinh.equals("null"))?"":ngaySinh;
		
                String dienThoai= request.getAttribute("dienThoai")+"";
                dienThoai = (dienThoai.equals("null"))?"":dienThoai;
		
                String email= request.getAttribute("email")+"";
                email = (email.equals("null"))?"":email;
        %>
        <div class="container">
            <div class="text-center">
                <h1>ĐĂNG KÝ TÀI KHOẢN</h1>
            </div>

            <div class="red" id="baoLoi">
                <%=baoLoi %>
            </div>
            <form class="form" action="UserController" method="post">
                <input   type="hidden"    name="hanhDong" value="dang-ky">
                <div class="row">
                    <div class="col-sm-6">
                        <h3>Tài khoản</h3>
                        <div class="mb-3">
                            <label for="tenDangNhap" class="form-label">Tên đăng nhập<span
                                    class="red">*</span></label> <input type="text" class="form-control"
                                                                id="tenDangNhap" name="tenDangNhap" required="required" value="<%=tenDangNhap%>">
                        </div>
                        <div class="mb-3">
                            <label for="matKhau" class="form-label">Mật khẩu<span
                                    class="red">*</span></label> <input type="password" class="form-control"
                                                                id="matKhau" name="matKhau" required="required" onkeyup="kiemTraMatKhau()">
                        </div>
                        <div class="mb-3">
                            <label for="matKhauNhapLai" class="form-label" >Nhập lại
                                mật khẩu<span class="red">*</span> <span id="msg" class="red" ></span>
                            </label> <input type="password" class="form-control" id="matKhauNhapLai"
                                            name="matKhauNhapLai" required="required" onkeyup="kiemTraMatKhau()">
                        </div>
                        <hr />
                    </div>
                    <div class="col-sm-6">
                        <h3>Thông tin khách hàng</h3>
                        <div class="mb-3">
                            <label for="hoVaTen" class="form-label">Họ và tên<span
                                    class="red">*</span></label> <input type="text" class="form-control"
                                                                id="hoVaTen" name="hoVaTen" required="required" value="<%=hoVaTen%>">
                            <div class="mb-3">
                                <label for="gioiTinh" class="form-label">Giới tính<span
                                        class="red">*</span></label> <select
                                    class="form-control" id="gioiTinh" name="gioiTinh" required="required">
                                    <option></option>
                                    <option value="Nam" <%=(gioiTinh.equals("Nam"))?"selected='selected'":"" %> >Nam</option>
                                    <option value="Nữ" <%=(gioiTinh.equals("Nữ"))?"selected='selected'":"" %> >Nữ</option>
                                    <option value="Khác" <%=(gioiTinh.equals("Khác"))?"selected='selected'":"" %> >Khác</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="ngaySinh" class="form-label">Ngày sinh<span
                                        class="red">*</span></label> <input
                                    type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%> " required="required">
                            </div>



                            <div class="mb-3">
                                <label for="dienThoai" class="form-label">Điện thoại<span
                                        class="red">*</span></label> <input
                                    type="tel" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai%>"required="required">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email<span
                                        class="red">*</span></label> <input
                                    type="email" class="form-control" id="email" name="email"  value="<%=email%> "required="required">
                            </div>
                            <hr />


                            <input class="btn btn-primary form-control" type="submit"
                                   value="Đăng ký" name="submit" id="submit" />
                        </div>
                    </div>
            </form>
        </div>
    </body>

    <script>
        function kiemTraMatKhau() {
            matKhau = document.getElementById("matKhau").value;
            matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
            if (matKhau != matKhauNhapLai) {
                document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
                return false;
            } else {
                document.getElementById("msg").innerHTML = "";
                return true;
            }
        }

        
    </script>

</html>
