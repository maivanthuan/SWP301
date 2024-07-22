<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Match"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Account khachHangg = (Account) session.getAttribute("khachHang");
    if (khachHangg == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>

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
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }
    h1 {
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f4f4f4;
    }
    .register-btn, .accept-btn {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        margin-top: 20px;
        cursor: pointer;
    }
    .register-btn:hover, .accept-btn:hover {
        background-color: #45a049;
        color: #000;
    }
    .button{
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .button.hi{
        background-color: #ff0000;
        color: #ffffff
    }
    .button.cancel{
        background-color: #cccccc;
        color: #333333
    }
    .modal-title .team-name {
        color: #007bff; /* Màu xanh */
    }
</style>
<body>
    <%@include file="Navbar.jsp" %>
    <div class="container">
        <h1>Những Đội Đang Tìm Đối Thủ</h1>
        <table>
            <thead>
                <tr>
                    <th>Tên đội</th>
                    <th>Ngày hẹn</th>
                    <th>Khung giờ</th>
                    <th>Giá</th>
                    <th>Tình trạng</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listFindCompetitor}" var="m">
                    <tr>
                        <td>${m.nameTeam}</td>
                        <td>${m.date}</td>
                        <td>${m.bookTime}</td>
                        <td>${m.price}</td>
                        <td>${m.statusMatchName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${m.statusMatchID == 2}">
                                    <c:choose>
                                        <c:when test="${m.date.time - currentDate.time < 2*24*60*60*1000}">
                                            <c:if test="${m.userID1 == userID || m.userID2 == userID}">
                                                <button class="button cancel" disabled>Không thể hủy</button>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${m.userID1 == userID || m.userID2 == userID}">
                                                <button type="button" class="button hi" data-bs-toggle="modal" data-bs-target="#confirmCancelModal"
                                                        data-matchid="${m.matchID}">Hủy</button>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${m.userID1 == userID}">
                                            <button type="button" class="button hi" data-bs-toggle="modal" data-bs-target="#confirmCancelModal"
                                                    data-matchid="${m.matchID}">Hủy</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="button" data-bs-toggle="modal" data-bs-target="#bookingModal"
                                                    data-teamname="${m.nameTeam}" data-pitchid="${m.pitchID}" data-price="${m.price}" data-matchid="${m.matchID}" data-userid1="${m.userID1}" data-datee="${m.date}">Ghép Cặp</button>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="findCompetitor.jsp" class="register-btn">Đăng Ký Ghép Cặp</a>
    </div>
    <div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookingModalLabel">Bạn Muốn Ghép Cặp Với Đội <span class="team-name"></span></h5> <!-- Đã sửa để thêm team-name vào span -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="FindCompetitorServlet" method="get">
                    <input type="hidden" name="hanhdong" value="xacnhan">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="teamName" class="form-label">Tên Đội</label>
                            <input type="text" class="form-control" name="nameTeam2">
                        </div>
                        <input type="hidden" name="pitchID" id="modalPitchId">
                        <input type="hidden" name="price" id="modalPitchPrice">
                        <input type="hidden" name="matchID" id="modalMatchID">
                        <input type="hidden" name="userID1" id="modalUserID1">
                        <input type="hidden" name="nameTeam1" id="modalNameTeam">
                        <input type="hidden" name="date" id="modalDate">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary">Ghép Cặp</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Modal Xác nhận Hủy -->
    <div class="modal fade" id="confirmCancelModal" tabindex="-1" aria-labelledby="confirmCancelModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmCancelModalLabel">Xác nhận Hủy Trận Đấu</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="FindCompetitorServlet" method="get">
                    <input type="hidden" name="hanhdong" value="huy" >
                    <div class="modal-body">
                        Bạn có chắc chắn muốn hủy trận đấu này?
                    </div>
                    <input type="hidden" name="matchID" id="modalMatchID1">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                        <button type="submit" class="btn btn-danger" id="confirmCancelBtn">Có, Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        $('#bookingModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var teamName = button.data('teamname'); // Extract info from data-* attributes
            var pitchId = button.data('pitchid');
            var price = button.data('price');
            var matchID = button.data('matchid');
            var userID1 = button.data('userid1');
            var date = button.data('datee'); // Lấy giá trị từ data-datee
            var modal = $(this);
            modal.find('.modal-title').text('Bạn Muốn Ghép Cặp Với Đội ' + teamName); // Đã sửa để thêm teamName vào span với class team-name
            modal.find('#modalPitchId').val(pitchId);
            modal.find('#modalNameTeam').val(teamName);
            modal.find('#modalPitchPrice').val(price);
            modal.find('#modalMatchID').val(matchID);
            modal.find('#modalUserID1').val(userID1);
            modal.find('#modalDate').val(date);
        });
        $(document).ready(function () {
            $('.button.cancel').click(function () {
                $('#confirmCancelModal').modal('show'); // Hiển thị modal xác nhận khi click vào nút "Hủy"
                // Lấy thông tin từ dữ liệu của hàng để xử lý hủy
                var teamName = $(this).closest('tr').find('td:first').text();
                $('#confirmCancelModal .modal-body').html(`Bạn có chắc chắn muốn hủy trận đấu với đội ${teamName}?`);
                $('#confirmCancelBtn').attr('data-matchid', $(this).data('matchid'));
            });

            $('#confirmCancelModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var matchID = button.data('matchid'); // Extract info from data-* attributes
                var modal = $(this);
                modal.find('#modalMatchID1').val(matchID); // Gán giá trị matchID vào input hidden
            });
        });
    </script>
</body>
</html>
