<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password?</title>
<style>
body {
	font-family: Arial, sans-serif !important;
	margin: 0 !important;
	padding: 0 !important;
	display: flex !important;
	justify-content: center !important;
	align-items: center !important;
	height: 100vh !important;
	background-color: #f5f5f5 !important;
}

.forgot-password-form {
	background-color: #ffffff !important;
	padding: 20px !important;
	border-radius: 8px !important;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1) !important;
	width: 100% !important;
	max-width: 400px !important;
}

.forgot-password-form h2 {
	margin-bottom: 20px !important;
	font-size: 24px !important;
	text-align: center !important;
	color: #333333 !important;
}

.forgot-password-form label {
	display: block !important;
	margin-bottom: 5px !important;
	font-weight: bold !important;
}

.forgot-password-form input {
	width: 100% !important;
	padding: 10px !important;
	margin-bottom: 15px !important;
	border: 1px solid #cccccc !important;
	border-radius: 4px !important;
}

.forgot-password-form button {
	width: 100% !important;
	padding: 10px !important;
	background-color: #007bff !important;
	color: #ffffff !important;
	border: none !important;
	border-radius: 4px !important;
	font-size: 16px !important;
	cursor: pointer !important;
}

.forgot-password-form button:hover {
	background-color: #0056b3 !important;
}

.alert {
	text-align: right !important;
	color: #d9534f !important;
	font-weight: bold !important;
	margin-bottom: 15px !important;
	background-color: #f8d7da !important;
	border: 1px solid #f5c6cb !important;
	padding: 10px !important;
	border-radius: 4px !important;
}
</style>
</head>
<body>
	<div class="forgot-password-form">
		<!-- Display alert if present -->
		<c:if test="${alert != null}">
			<div class="alert">${alert}</div>
		</c:if>

		<!-- Forgot password form -->
		<h2>Forgot Password</h2>
		<form action="${pageContext.request.contextPath}/forgotpassword"
			method="post">
			<label for="username">Enter Username</label> <input type="text"
				id="username" name="username" placeholder="Enter your username">

			<label for="email">Enter Email</label> <input type="email" id="email"
				name="email" placeholder="Enter your email">

			<button type="submit">Confirm</button>
		</form>
	</div>
</body>
</html>
