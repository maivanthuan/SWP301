<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Pitch"%>
<%@page import="model.Account"%>
<%
    Account khachHangg = (Account) session.getAttribute("khachHang");
    if (khachHangg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Available Pitches</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <style>
            .stadium-img {
                width: 100%;
                height: auto;
                max-height: 50vh;
            }

            #stadium-info {
                background-color: #F1F1EF;
                padding: 20px;
                border-radius: 7px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            #stadium-info h2 {
                color: #333;
                font-size: 24px;
                margin-bottom: 20px;
            }

            .footer {
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
                background-color: #4caf50;
                border: 1px solid #4caf50;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .pagination a:hover {
                background-color: #45a049;
            }

            .pagination span {
                background-color: #2e7d32;
            }

            .pagination a:visited {
                color: white;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="Navbar.jsp"></jsp:include>
        <!-- End Navbar -->

        <!-- List of available pitches -->
<div class="container mt-4">
    <h3 class="title-section">Available Pitches</h3>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach items="${listMatchAvailable}" var="pitch">
            <form action="SearchPitchServlet" method="get">
                <input type="hidden" name="pitchID" value="${pitch.pitchID}">
                <input type="hidden" name="price" value="${pitch.price}">
                <input type="hidden" name="hanhdong" value="datsan">
                <div class="col mb-4">
                    <div class="card h-100">

                            <img src="${pitch.image}" class="card-img-top stadium-img" alt="Pitch Image" style="border-radius: 10px;">
                        <div class="card-body">
                            <h5 class="card-title">${pitch.pitchID}</h5>
                            <p class="card-text">Loại Sân: ${pitch.pitchType}</p>
                            <p class="card-text">Giá: ${pitch.price}</p>
                            <button type="submit" class="btn btn-primary">Đặt Sân</button>
                        </div>
                    </div>
                </div>
            </form>
        </c:forEach>
    </div>
</div>
        <!-- End List -->

        <!-- Booking Modal -->
        <!-- End Booking Modal -->

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
