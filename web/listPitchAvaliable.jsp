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
            <div class="row">
                <c:forEach items="${listMatchAvailable}" var="pitch">
                    <div class="col-lg-3 col-md-4 col-6 mb-lg-4 mb-3 mt-4">
                        <div class="playground-item">
                            <div class="inner-image mb-3">
                                <div class="ratio-3-2">
                                    
                                        <img src="${pitch.image}" class="stadium-img" style="border-radius: 10px;">
                                </div>
                            </div>
                            <div class="inner-content">
                                <div class="playground-title">
                                    <h5>${pitch.pitchID}</h5>
                                    <p class="card-text">Loại Sân: ${pitch.pitchType}</p>
                                    <p class="card-text">Giá:  ${pitch.price}</p>
                                    <!-- Button to open the modal -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bookingModal" 
                                            data-pitchid="${pitch.pitchID}" data-pitchprice="${pitch.price}">Đặt Sân</button>
                                </div>                       
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- End List -->

        <!-- Booking Modal -->
        <div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="bookingModalLabel">Đặt Sân</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="FindCompetitorServlet" method="post">
                        <input type="hidden" name="hanhdong" value="datsan">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="teamName" class="form-label">Tên Đội</label>
                                <input type="text" class="form-control" id="nameTeam" name="nameTeam" required>
                            </div>
                            <input type="hidden" name="pitchID" id="modalPitchId">
                            <input type="hidden" name="price" id="modalPitchPrice">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Đặt Sân</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End Booking Modal -->

        <jsp:include page="footer.jsp"></jsp:include>

        <script>
            var bookingModal = document.getElementById('bookingModal');
            bookingModal.addEventListener('show.bs.modal', function (event) {
                var button = event.relatedTarget;
                var pitchID = button.getAttribute('data-pitchid');
                var pitchPrice = button.getAttribute('data-pitchprice');
                var modalPitchId = bookingModal.querySelector('#modalPitchId');
                var modalPitchPrice = bookingModal.querySelector('#modalPitchPrice');
                modalPitchId.value = pitchID;
                modalPitchPrice.value = pitchPrice;
            });
        </script>
    </body>
</html>
