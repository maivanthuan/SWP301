<%-- 
    Document   : historybookingpitch
    Created on : Jun 9, 2024, 12:36:04 AM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%
    Account khachHangg = (Account) session.getAttribute("khachHang");
    if (khachHangg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
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
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 20px;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            table {
                width: 80%;
                margin: 0 auto;
                border-collapse: separate;
                border-spacing: 0;
                box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                border-radius: 10px;
                overflow: hidden;
            }

            th, td {
                padding: 15px;
                border: 1px solid #ddd;
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #e0e0e0;
            }
        </style>
    </head>
    <body>
      <!-- Navbar -->
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
                <!-- logo -->
                <a class="navbar-brand" href="index.jsp"><img src="img/logo/logo5b.jpg" alt="Logo" style="height:70px; margin:15px"></a>       
                <!-- end logo -->   

                <!-- search -->
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Nhập nội dung tìm kiếm" aria-label="Search" style="width: 500px;">
                    <button class="btn btn-outline-success" type="submit" style="background-color: #262C78; color: white;">Search</button>
                </form>    
                <!-- end search -->

                <!-- account, giỏ hàng, list sân -->
                <div style="margin-right: 20px">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="loadproduct"><img src="img/logo/iconquanao.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Bán hàng
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PitchServlet"><img src="img/logo/iconsanbong.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Sân bóng
                            </a>
                        </li>

                        <li class="nav-item dropdown">
                            



                            <%
                                                Object obj = session.getAttribute("khachHang");
                                                Account khachHang = null;
                                                if (obj!=null)
                                                        khachHang = (Account)obj;
						
                                                if(khachHang==null){
                            %>
                            <a class="btn btn-primary" style="white-space: nowrap;" href="login.jsp">
                                Đăng nhập
                            </a>
                            <a class="btn btn-primary" href="Register.jsp">Đăng ký</a>
                            <%} else { %>
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="img/logo/icontaikhoan_1.png" alt="Tai khoan" style="height:30px; margin-left: 15px"> <br/>
                                Tài khoản
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="changePassword.jsp">Thay đổi mật khẩu</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="change.jsp">Thông tin cá nhân</a>
                                <a class="dropdown-item" href="HistoryBookingPitchServlet">Lịch sử đặt sân</a>
                                <a class="dropdown-item" href="OrderListHistory">Lịch sử mua hàng</a>
                                <a class="dropdown-item" href="UserController?hanhDong=dang-xuat">Đăng xuất</a>
                            </div>
                            <% }%>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="mycart.jsp"><img src="img/logo/icongiohang.jpg" alt="List sân" style="height:30px; margin-left:15px"><br/>
                                Giỏ Hàng
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- end account, giỏ hàng, list sân -->
            </nav>
        </div>
        <!-- End Navbar -->
        
        <table>
            <thead>
                <tr>
                    <th>PitchID</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Price</th>  
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${ivlist}" var="ivlist">
                    <tr>
                        <td>${ivlist.pitchID.pitchID}</td>
                        <td>${ivlist.totalInvoicePitchID.bookTime}</td>
                        <td>${ivlist.bookingTimeID.time}</td>
                        <td>${ivlist.pricePitchID.price}</td>      
                        <c:if test="${ivlist.getTotalInvoicePitchID().getBookTime()>currentDay}">
                            <td>
                            <form action="DeleteHistoryBookPitchServlet" method="post">
                             <input type="hidden" name="ivID" value="${ivlist.invoicePitchID}"> 
                            <button type="submit">Delete</button>
                             </form>
                        </td>
                        </c:if>
                         <c:if test="${ivlist.getTotalInvoicePitchID().getBookTime()<currentDay||ivlist.getTotalInvoicePitchID().getBookTime()==currentDay}">
                              <td>Can't modified</td>
                             </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
   
</body>
</html>
