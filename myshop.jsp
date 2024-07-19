<%-- 
    Document   : myshop
    Created on : Jun 6, 2024, 9:46:44 AM
    Author     : boyin
--%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <style>
            table {
                border-collapse: collapse;
            }
            #bag {
                text-align: right;
                margin-right: 30px;
                margin-top: 30px;
            }
            .tr {
                text-align: right;
            }
        </style>
    </head>
    <body>
        <p id="bag">
            <img src="img/logo/icongiohang.jpg" width="40px" height="40px">
            <a href="show">My Bag(${requestScope.size}) items</a>
        </p>
        <h1>List Products</h1>
        <form name="f" action="buy" method="post">
            <table border="1px" width="60%">
                <tr>
                    <th>ID</th>
                    <th>Name</th>                   
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${requestScope.data}" var="p">
                    <tr>
                        <td>${p.productID}</td>
                        <td>${p.productName}</td>                       
                        <td class="tr"><fmt:formatNumber pattern="###.#" value="${p.price}"/></td>
                        <td><input type="number" name="quantity_${p.productID}" value="1" min="1" style="text-align: center;"></td>
                        <td><input type="button" onclick="buy('${p.productID}')" value="Buy item"></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
<script type="text/javascript">
    function buy(productID) {
        var quantity = document.getElementsByName("quantity_" + productID)[0].value;
        document.f.action = "buy?productID=" + productID + "&num=" + quantity;
        document.f.submit();
    }
</script>
