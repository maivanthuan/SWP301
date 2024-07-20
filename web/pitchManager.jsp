<%-- 
    Document   : Show
    Created on : Oct 12, 2020, 8:15:41 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Product List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f5f5f5;
            }
            a {
                color: #3498db;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            .button {
                display: inline-block;
                padding: 10px 15px;
                font-size: 14px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                outline: none;
                color: #fff;
                background-color: #3498db;
                border: none;
                border-radius: 5px;
                box-shadow: 0 2px #999;
                margin: 10px;
            }
            .button:hover {
                background-color: #003eff;
            }
            .button:active {
                background-color: #3e8e41;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }
        </style>
    </head>
    <body>
        <h1>Pitch List</h1>
        <div class="container">

        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>Pitch ID</th>
                    <th>Pitch Type</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <c:forEach items="${listPi}" var="x">
                <tr>
                    <td>${x.pitchID}</td>
                    <td>${x.pitchType}</td>
                    <td><img src="${x.image}" alt="${x.pitchType}" style="width:100px;height:50px;"></td>
                    <td>${x.price}</td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#pitch${x.pitchID}">
                            Update
                        </button> 
                        <button type="button" class="button hi" data-bs-toggle="modal" data-bs-target="#confirmCancelModal"
                                data-pitchid="${x.pitchID}">Xóa</button>
                    </td>
                </tr>
                <div class="modal fade" id="pitch${x.pitchID}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Update Pitch</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="EditPitchServlet" method="post" enctype="multipart/form-data">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="id"><i class="fas fa-id-card icon"></i>Pitch ID</label>
                                        <input type="text" id="id" class="form-control" name="pitchID" value="${x.pitchID}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="type"><i class="fas fa-align-left icon"></i>Type</label>
                                        <select class="form-control" id="type" name="pitchType" required>
                                            <option value="5" ${x.pitchType == 5? 'selected' : ''}>Sân 5</option>
                                            <option value="7" ${x.pitchType == 7? 'selected' : ''}>Sân 7</option>
                                            <option value="11" ${x.pitchType == 11? 'selected' : ''}>Sân 11</option>
                                        </select>
                                    </div>            
                                    <div class="form-group">
                                        <label for="image"><i class="fas fa-image icon"></i>Image</label>
                                        <input type="file" class="form-control" name="file" accept="image/*" onchange="loadFile(event)">
                                        <img id="output" style="width: 100px" src="${x.image}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="price"><i class="fas fa-dollar-sign icon"></i>Price</label>
                                        <input type="number" class="form-control" name="price" id="price" value="${x.price}" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </table>
        <a href="createPitch.jsp" class="button">Create Pitch</a>
        <a href="index.jsp" class="button">Back to Home</a>
        
        <div class="modal fade" id="confirmCancelModal" tabindex="-1" aria-labelledby="confirmCancelModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmCancelModalLabel">Xóa sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="deletepitch" method="get">
                        <input type="hidden" name="hanhdong" value="xoa" >
                        <div class="modal-body">
                            Bạn muốn xóa sản phẩm này ?
                        </div>
                        <input type="hidden" name="pitchID" id="modalPitchID">
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                            <button type="submit" class="btn btn-danger" id="confirmCancelBtn">Xóa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
<script>
            $(document).ready(function () {
            $('.button.cancel').click(function () {
                $('#confirmCancelModal').modal('show'); // Hiển thị modal xác nhận khi click vào nút "Hủy"
                // Lấy thông tin từ dữ liệu của hàng để xử lý hủy
                var teamName = $(this).closest('tr').find('td:first').text();
                $('#confirmCancelModal .modal-body').html(`Bạn muốn xóa sân này?`);
                $('#confirmCancelBtn').attr('data-pitchid', $(this).data('pitchid'));
            });

            $('#confirmCancelModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var PitchID = button.data('pitchid'); // Extract info from data-* attributes
                var modal = $(this);
                modal.find('#modalPitchID').val(PitchID); // Gán giá trị matchID vào input hidden
            });
        });
</script>
</html>
