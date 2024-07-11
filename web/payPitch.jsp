<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Sân Bóng</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('img/bgsanbong.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }
        .container {
            width: 90%;
            max-width: 600px;
            padding: 30px;
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            font-weight: bold;
            color: #ffd700;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            background-color: #f9f9f9;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button[type="submit"]:hover {
            background-color: #218838;
        }
        .qr-code {
            margin-top: 20px;
        }
        .qr-code img {
            max-width: 100%;
            height: auto;
        }
        .info-label {
            color: #ffd700;
            font-size: 1.1rem;
            margin: 5px 0;
        }
        @media (max-width: 768px) {
            .container {
                width: 100%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 class="text-center" style="color: #ffd700;">Thanh Toán Sân Bóng</h3>
        <form action="#" method="post">
            <div class="form-group">
                <label for="fieldNumber">Sân Số 1</label>
            </div>
            <div class="form-group">
                <label class="info-label" for="hovaten">Họ và tên:</label>
                <input type="text" id="hovaten" name="hovaten" required>
            </div>
            <div class="form-group">
                <label class="info-label" for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label class="info-label" for="sdt">Số điện thoại:</label>
                <input type="tel" id="sdt" name="sdt" required>
            </div>
            <div class="form-group">
                <label class="info-label" for="diachi">Địa chỉ:</label>
                <input type="text" id="diachi" name="diachi" required>
            </div>
            <button type="submit">Thanh Toán</button> <!-- Nút Thanh Toán -->
        </form>
        <div class="qr-code">
            <h5 class="info-label">Mã QR Code</h5>
            <img src="img/iconmaqr.jpg" alt="QR Code" style="height:200px">
        </div>
    </div>
</body>
</html>
