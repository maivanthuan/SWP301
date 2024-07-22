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
    <form action="updatestaffservlet" method="POST" >
        <input type="hidden" name="hanhdong" value="capnhat">
        <table>
            <tr>
                <td>User ID</td>
                <td><input value="${ac.ID}" type="number" name="uID" readonly></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input value="${ac.name}" type="text" name="name" required></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><input value="${ac.gender}" type="text" name="gender" required></td>
            </tr>
            <tr>
                <td>Phone Number</td>
                <td><input value="${ac.phoneNumber}" type="text" name="phonenumber" required></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input value="${ac.email}" type="email" name="email" readonly></td>
            </tr>
            <tr>
                <td>Date Of Birth</td>
                <td><input value="${ac.dateOfBirth}" type="date" name="dob" required></td>
            </tr>
            <tr>
                <td></td>
                <td><button type="submit">Update</button></td>
            </tr>
        </table>
    </form>
</body>
</html>