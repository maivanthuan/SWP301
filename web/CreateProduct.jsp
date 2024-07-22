<%-- 
    Document   : Add
    Created on : Oct 12, 2020, 9:17:52 PM
    Author     : trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Product</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            margin: 0;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        .form-container table {
            width: 100%;
        }
        .form-container td {
            padding: 10px 0;
        }
        .form-container input[type="text"],
        .form-container input[type="file"],
        .form-container input[type="datetime-local"] {
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
        #output {
            display: block;
            margin-top: 10px;
            max-width: 100%;
        }
    </style>
</head>
<body>
    
    <div class="form-container">
        <form action="CreateProductServlet" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td><i class="fas fa-futbol icon"></i>Name</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-align-left icon"></i>Description</td>
                    <td><input type="text" name="description" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-arrows-alt icon"></i>Size</td>
                    <td><input type="text" name="size" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-image icon"></i>Image</td>
                    <td>
<input type="file" class="form-control" name="file" required accept="image/*" onchange="loadFile(event)">
                        <img id="output" alt="Image Preview"/>
                    </td>
                </tr>
                <tr>
                    <td><i class="fas fa-dollar-sign icon"></i>Price</td>
                    <td><input type="text" name="price" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-calendar-alt icon"></i>Time Start</td>
                    <td><input type="datetime-local" name="timestart" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-calendar-alt icon"></i>Time End</td>
                    <td><input type="datetime-local" name="timeend" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-list-alt icon"></i>Category ID</td>
                    <td><input type="text" name="categoryid" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit">Create Product</button></td>
                </tr>
            </table>
        </form>
    </div>
    <script>
        var loadFile = function(event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src); // free memory
            }
        };
    </script>
</body>
</html>