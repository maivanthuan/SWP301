<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>Match History</title>
        <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->

        <style>
            /* Custom CSS */
            body {
                font-family: 'Cairo', sans-serif;
                background-color: #f9f9f9;
                color: #333;
                padding-top: 20px;
            }

            .hero {
                background-color: #ffffff;
                padding: 40px 0;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                border-radius: 8px;
                margin: 20px 0;
            }

            h3 {
                font-size: 28px;
                font-weight: 600;
                color: #2c3e50;
                margin-bottom: 20px;
                text-align: center;
                text-transform: uppercase;
                font-family: 'Lobster', cursive;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }

            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #2ecc71;
                color: #fff;
                font-weight: 600;
                text-transform: uppercase;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            td {
                color: #34495e;
            }

            .status {
                font-weight: bold;
                padding: 5px 10px;
                border-radius: 4px;
                text-align: center;
            }

            .status.completed {
                background-color: #2ecc71;
                color: #fff;
            }

            .status.pending {
                background-color: #f1c40f;
                color: #fff;
            }

            .status.canceled {
                background-color: #e74c3c;
                color: #fff;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                th, td {
                    padding: 10px;
                }

                h3 {
                    font-size: 24px;
                }
            }
            /* End of Custom CSS */
        </style>
    </head>
    <body>
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="mt-4"><strong>Match History</strong></h3> 
                        <div>
                            <table class="mt-4">
                                <thead>
                                    <tr>
                                        <th>Team 1</th>
                                        <th>Name</th>
                                        <th>Team 2</th>
                                        <th>Name</th>
                                        <th>Pitch Type</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="match" items="${matchHistory}">
                                        <tr>
                                            <td>${match.nameTeam1}</td>
                                            <td>${match.getAcc1().name}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty match.userID2}">
                                                        ${match.getAcc2().name}
                                                    </c:when>
                                                    <c:otherwise>
                                                        N/A
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty match.userID2}">
                                                        ${match.nameTeam2}
                                                    </c:when>
                                                    <c:otherwise>
                                                        N/A
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${match.pitchID}</td>
                                            <td>${match.date}</td>
                                            <td>${match.getBookTime()}</td>
                                            <td>${match.price}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${match.getStatusMatchName() == 'Completed'}">
                                                        <span class="status completed">${match.getStatusMatchName()}</span>
                                                    </c:when>
                                                    <c:when test="${match.getStatusMatchName() == 'Pending'}">
                                                        <span class="status pending">${match.getStatusMatchName()}</span>
                                                    </c:when>
                                                    <c:when test="${match.getStatusMatchName() == 'Canceled'}">
                                                        <span class="status canceled">${match.getStatusMatchName()}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="status">${match.getStatusMatchName()}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
