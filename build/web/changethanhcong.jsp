<%-- 
    Document   : thanhcong
    Created on : May 19, 2024, 12:19:34 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="Navbar.jsp"></jsp:include>
<h1>Thay đổi thông tin thành công.Sẽ quay lại trang chủ</h1>
<script>
         setTimeout(function(){
            window.location.href = 'index.jsp';
         }, 5000);
      </script>
</body>
</html>