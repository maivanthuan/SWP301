<%-- 
    Document   : Add
    Created on : Oct 12, 2020, 9:17:52 PM
    Author     : trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Pitch</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 300px;
            }
            .form-container table {
                width: 100%;
            }
            .form-container td {
                padding: 10px 0;
            }
            .form-container input[type="text"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-left: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            .form-container button {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            .form-container button:hover {
                background-color: #45a049;
            }
            .icon {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <div class="form-container container">
            <form action="AddPitchServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="id"><i class="fas fa-id-card icon"></i>Pitch ID</label>
                    <input type="text" id="id" class="form-control" name="pitchID" required >
                </div>
                <div class="form-group">
                    <label for="type"><i class="fas fa-align-left icon"></i>Type</label>
                    <select class="form-control" id="type" name="pitchType" required>
                        <option value="5">Sân 5</option>
                        <option value="7">Sân 7</option>
                        <option value="11">Sân 11</option>
                    </select>
                </div>            
                <div class="form-group">
                    <label for="image"><i class="fas fa-image icon"></i>Image</label>
                    <input type="file" class="form-control" name="file" required accept="image/*" onchange="loadFile(event)">
                    <img id="output" style="width: 100px"/>
                </div>
                <div class="form-group">
                    <label for="price"><i class="fas fa-dollar-sign icon"></i>Price</label>
                    <input type="number" class="form-control" name="price" id="price" required>
                </div>
                <div class="form-group">
                    <label for="start"><i class="fas fa-dollar-sign icon"></i>Time Start</label>
                    <input type="date" class="form-control" name="timestart" id="start" required>
                </div>
                <div class="form-group">
                    <label for="end"><i class="fas fa-dollar-sign icon"></i>Time End</label>
                    <input type="date" class="form-control" name="timeend" id="end" required>
                </div>
                <div class="form-group">
                    <td><button type="submit">Create Pitch</button></td>
                </div>
            </form>
        </div>
    </body>
    <script>
        var loadFile = function (event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function () {
                URL.revokeObjectURL(output.src) // free memory
            }
        };
    </script>
</html>
