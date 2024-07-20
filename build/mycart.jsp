    <%-- 
    Document   : mycart
    Created on : Jun 3, 2024, 2:09:48 PM
    Author     : boyin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Clothes</title>

        <!--         Google Font 
                <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">-->

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

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
            table{
                border-collapse: collapse;
            }
            a{
                text-decoration: none;
                color: white;
            }
            .container-fluid {
                background-color: #56E07B;
                font-family: unset;
            }
            .footer{
                background-color: #F1F1EF;
                font-family: unset;
                height: 350px;
                margin-top: 20px;
            }
            .map-button, .map-image {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"></jsp:include>
        <!-- End Navbar -->


        <!-- Shoping Cart Section Begin -->
        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Total Price</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${cart}" var="i" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${i.key.name}</td>
                                        <td style="text-align: center">
                                            <button><a href="process?num=-1&productID=${i.key.productID}">-</a></button>
                                            ${i.value}
                                            <button><a href="process?num=1&productID=${i.key.productID}">+</a></button>
                                        </td>
                                        <td class="tr">
                                            <fmt:formatNumber pattern="###.#" value="${i.key.price}"/>
                                        </td>
                                        <td class="tr">
                                            <fmt:formatNumber pattern="###.#" value="${i.key.price*i.value}"/>
                                        </td>
                                        <td style="text-align: center">
                                            <form action="process" method="post">
                                                <input type="hidden" name="id" value="${i.key.productID}"/>
                                                <input type="button" value="Remove" onclick="window.location.href = '${pageContext.request.contextPath}/remove?id=${i.key.productID}'">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>      
                            </table>
                        </div>   
                    </div> 
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="shoping__cart__btns">
                            <a style="background-color: #262C78;" href="index.jsp" class="btn btn-primary cart-btn">Back to home</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <h5>Cart Total</h5>
                            <ul>
                                <li>Total: <span>$ ${requestScope.total} VND</span></li>
                            </ul>                           
                            <hr/>
                            <form action="checkout" method="post">
                                <input type="button" id="checkoutButton" style="margin-left: 40% "value="Check out"/>
                            </form>
                            <hr/>
                            <a style="background-color: #262C78; margin-left: 34%;" href="loadproduct">Continue to Buy</a>
                        </div>
                    </div>
                </div>                
            </div>
            <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addressModalLabel">Enter Your Address</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="payment" method="get">
                                <input type="hidden" name="hanhdong" value="product">
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address:</label>
                                    <input type="text" class="form-control" id="address" name="address">
                                </div>
                                <input type="hidden" name="amount" value="${requestScope.total*100}">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>        
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("checkoutButton").addEventListener("click", function () {
                    $('#addressModal').modal('show');
                });
            });
        </script>
    </body>
</html>
