<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        table {
            width: 100%;
            max-width: 600px;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        td {
            padding: 10px;
        }
        input[type="text"],
        input[type="number"],
        input[type="datetime-local"],
        input[type="file"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin: 5px 0 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        img {
            max-width: 100px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form action="updateproductcontrol" method="POST" enctype="multipart/form-data">
        <table>
            <tr>
                <td>ID</td>
                <td><input value="${pr.productID}" type="number" name="pID" readonly></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input value="${pr.name}" type="text" name="name" required></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input value="${pr.description}" type="text" name="description" required></td>
            </tr>
            <tr>
                <td>Size</td>
                <td><input value="${pr.size}" type="text" name="size" required></td>
            </tr>
            <tr>
                <td>Image</td>
                <td>
                    <input type="file" name="file" accept="image/*" onchange="loadFile(event)">
                    <img id="output" src="${pr.image}" alt="Product Image">
                </td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input value="${pr.price}" type="number" name="price" required></td>
            </tr>
            <tr>
                <td>Time Start</td>
                <td><input value="${pr.timeStart}" type="datetime-local" name="timestart" required></td>
            </tr>
            <tr>
                <td>Time End</td>
                <td><input value="${pr.timeEnd}" type="datetime-local" name="timeend" required></td>
            </tr>
            <tr>
<td></td>
                <td><button type="submit">Update</button></td>
            </tr>
        </table>
    </form>
    <script>
        function loadFile(event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src) // free memory
            }
        }
    </script>
</body>
</html>