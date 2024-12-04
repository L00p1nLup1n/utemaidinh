<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1 {
            color: #28a745;
        }
        .section {
            margin-bottom: 20px;
        }
        .section h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        table th {
            background-color: #f4f4f4;
        }
        .button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            display: inline-block;
        }
        .button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Confirmed!</h1>
        <p>Thank you for your order, <strong>${sessionScope.account.username}</strong>! Your order has been successfully placed and is being processed.</p>

        <!-- Section for user details -->
        <div class="section">
            <h2>Contact Information</h2>
            <p><strong>Name:</strong> ${sessionScope.account.username}</p>
            <p><strong>Email:</strong> ${sessionScope.account.email}</p>
            <p><strong>Phone Number:</strong> ${sessionScope.account.phone}</p>
        </div>

        <!-- Section for action buttons -->
        <div class="section">
            <a href="${pageContext.request.contextPath}/views/admin/home.jsp" class="button">Back to Home</a>
        </div>
    </div>
</body>
</html>
