<%-- 
    Document   : change
    Created on : May 19, 2024, 11:50:01 PM
    Author     : Admin
--%>

<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Change Infor</title>
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
		Object obj = session.getAttribute("khachHang");
		Account khachHang = null;
		if (obj!=null)
			khachHang = (Account)obj;		
			if(khachHang==null){		
	%>
	<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
	<%
			}else {
				
	%>
	<div class="container">
	<%
		String baoLoi = request.getAttribute("baoLoi")+"";
		baoLoi = (baoLoi.equals("null"))?"":baoLoi;
		
		String hoVaTen= khachHang.getName();
		
		String gioiTinh= khachHang.getGender();
		
		String ngaySinh= khachHang.getDateOfBirth();	
		
		String dienThoai= khachHang.getPhoneNumber();
		
		String email= khachHang.getEmail();	
		
	%>
	<div class="container">
		<div class="text-center">
			<h1>THAY ĐỔI THÔNG TIN TÀI KHOẢN</h1>
		</div>
		
		<div class="red" id="baoLoi">
			<%=baoLoi %>
		</div>
		<form class="form" action="UserController" method="post">
                    <input  type="hidden" name="hanhDong" value="changeInfor">
			<div class="row">
				<div class="col-sm-6">
					
					<h3>Thông tin khách hàng</h3>
					<div class="mb-3">
						<label for="hoVaTen" class="form-label">Họ và tên</label> <input
							type="text" class="form-control" id="hoVaTen" name="hoVaTen" value="<%=hoVaTen%>">
					</div>
					<div class="mb-3">
						<label for="gioiTinh" class="form-label">Giới tính</label> <select
							class="form-control" id="gioiTinh" name="gioiTinh">
							<option></option>
							<option value="Nam" <%=(gioiTinh.equals("Nam"))?"selected='selected'":"" %> >Nam</option>
							<option value="Nữ" <%=(gioiTinh.equals("Nữ"))?"selected='selected'":"" %> >Nữ</option>
							<option value="Khác" <%=(gioiTinh.equals("Khác"))?"selected='selected'":"" %> >Khác</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="ngaySinh" class="form-label">Ngày sinh</label> <input
							type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%>">
					</div>
				</div>
				<div class="col-sm-6">
					
					<div class="mb-3">
						<label for="dienThoai" class="form-label">Điện thoại</label> <input
							type="tel" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai%>">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> 
<input type="email" class="form-control" id="email" name="email"  value="<%=email%>" placeholder="Email" readonly>
					</div>
					<hr />					
					
					<input class="btn btn-primary form-control" type="submit"
						value="Lưu thông tin" name="submit" id="submit" />
				</div>
			</div>
		</form>
	</div>
	</div>
	<%} %>
</body>

</html>