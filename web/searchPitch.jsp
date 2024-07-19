<%-- 
    Document   : searchPitch
    Created on : Jul 6, 2024, 11:14:40 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find Competitor</title>
    </head>
    <style>
        body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f2f2f2;
            }
            .container {
                max-width: 600px;
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
            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }
            input[type="date"],
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
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
                        button:hover {
                background-color: #45a049;
            }

            
        </style>
    <body>
        <jsp:include page="Navbar.jsp"></jsp:include>
         <div class="container">
            <h1>Tìm sân</h1>
            <form action="FindCompetitorServlet" method="post">
                <label for="date">Chọn Ngày: </label>
                <input type="date" id="date" name="date" required>
                <input type="hidden" name="hanhdong" value="find">
                <label for="timeSlot">Chọn Khung Giờ: </label>
                <select id="booktime" name="booktime" required>                   
                    <option value="" disabled selected hidden></option>
                    <option value="1">6-7</option>
                    <option value="2">7-8</option>
                    <option value="3">8-9</option>
                    <option value="4">9-10</option>
                    <option value="5">10-11</option>
                    <option value="6">14-15</option>
                    <option value="7">15-16</option>
                    <option value="8">16-17</option>
                    <option value="9">17-18</option>
                    <option value="10">18-19</option>
                    <option value="12">19-20</option>
                    <option value="12">20-21</option>
                    <option value="13">21-22</option>
                    <option value="14">22-...</option>
                </select>
                
                <button class="button" type="submit">Tìm Sân</button>
            </form>
        </div>
    </body>
</html>
