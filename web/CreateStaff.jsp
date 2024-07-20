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
    <title>Create Staff</title>
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
<%
                String baoLoi = request.getAttribute("baoLoi")+"";
                baoLoi = (baoLoi.equals("null"))?"":baoLoi;
	
		
        %>
        
    <div class="form-container">
        <div class="red" id="baoLoi">
                <%=baoLoi %>
            </div>
        <form action="createstaff" method="post" >
            <table>
                <tr>
                    <td><i class="fas fa-futbol icon"></i>User Name</td>
                    <td><input type="text" name="username" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-futbol icon"></i>Name</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-align-left icon"></i>Gender</td>
                    <td><input type="text" name="gender" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-arrows-alt icon"></i>Phone Number</td>
                    <td><input type="text" name="phonenumber"" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-arrows-alt icon"></i>Password</td>
                    <td><input type="text" name="password"" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-dollar-sign icon"></i>Email</td>
                    <td><input type="text" name="email" required></td>
                </tr>
                <tr>
                    <td><i class="fas fa-calendar-alt icon"></i>Date Of Birth</td>
                    <td><input type="date" name="dateOfBirth" required></td>
                </tr>
                
                <tr>
                    
                    <td><button type="submit">Add Staff</button></td>
                </tr>
            </table>
        </form>
    </div>
    
</body>
</html>
