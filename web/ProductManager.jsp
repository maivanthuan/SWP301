<%-- 
    Document   : Show
    Created on : Oct 12, 2020, 8:15:41 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9; /* Light blue background */
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        table {
            width: 80%;
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
        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
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
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            box-shadow: 0 2px #999;
            margin: 10px;
        }
        .button:hover {
            background-color: #45a049;
        }
        .button:active {
            background-color: #3e8e41;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
        .sidebar-brand {
            height: 90px;
            padding: 1rem 0rem 1rem 2rem;
            color: #fff;
        }
        .sidebar-brand h2 {
            display: flex;
            align-items: center;
            cursor: pointer;
        }
        .sidebar-brand a {
            text-decoration: none;
            color: #000; /* Change text color to black */
        }
        .sidebar-brand span {
            display: inline-block;
            padding-right: 1rem;
            color: #000; /* Change span text color to black */
        }
        .sidebar-brand .lab {
            font-size: 2rem;
            margin-right: 5px;
            color: #000; /* Change icon color to black */
        }
        .sidebar-brand .lab:hover {
            color: #000;
        }
    </style>
</head>
<body>
<div class="sidebar-brand">

</div>
<h1>Product List</h1>
<table>
    <tr>
        <th>Product ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Size</th>
        <th>Image</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${listP}" var="x">
        <tr>
            <td>${x.productID}</td>
            <td>${x.name}</td>
            <td>${x.description}</td>                   
            <td>${x.size}</td>
            <td><img src="${x.image}" alt="${x.name}" style="width:50px;height:50px;"></td>
            <td>${x.price}</td>
            <td>
                <a href="updateproductcontrol?pID=${x.productID}">Update</a> |
                <a href="#" onclick="showMess(${x.productID})">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="button-container">
    <a href="CreateProduct.jsp" class="button">Create Product</a>
    <a href="homeadmin.jsp" class="button">Back to Home</a>
</div>
</body>
<script>
    function showMess(id) {
        var option = confirm('Are you sure you want to delete?');
        if (option === true) {
            window.location.href = 'deleteproductcontrol?pID=' + id;
        }
    }
</script>
</html>
