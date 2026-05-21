<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register - Hanna Bakes</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	/* HOMEPAGE BACKGROUND IMAGE */
	background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, 0.45)),
		url('Image/Background/bck4.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

/* GLASS EFFECT CARD */
.hb-register-new-box {
	width: 100%;
	max-width: 430px;
	padding: 40px 35px;
	border-radius: 25px;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(12px);
	-webkit-backdrop-filter: blur(12px);
	border: 1px solid rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
	position: relative;
	overflow: hidden;
}

/* GLOW BORDER */
.hb-register-new-box::before {
	content: "";
	position: absolute;
	inset: 0;
	border-radius: 25px;
	padding: 2px;
	background: linear-gradient(135deg, #ff9a9e, #fad0c4, #a18cd1, #00c9ff);
	-webkit-mask: linear-gradient(#fff 0 0) content-box,
		linear-gradient(#fff 0 0);
	-webkit-mask-composite: xor;
	mask-composite: exclude;
	pointer-events: none;
}

/* TITLE */
.hb-title {
	color: white;
	font-weight: 700;
	margin-bottom: 8px;
}

.hb-subtitle {
	color: #f1f1f1;
	font-size: 14px;
	margin-bottom: 25px;
}

/* INPUT GROUP */
.hb-input-group {
	position: relative;
	margin-bottom: 18px;
}

.hb-input-group i {
	position: absolute;
	top: 50%;
	left: 18px;
	transform: translateY(-50%);
	color: #ffffff;
	font-size: 15px;
}

.hb-input-group input {
	width: 100%;
	padding: 13px 15px 13px 48px;
	border: none;
	outline: none;
	border-radius: 30px;
	background: rgba(255, 255, 255, 0.18);
	color: white;
	font-size: 15px;
	transition: 0.3s;
}

/* PLACEHOLDER */
.hb-input-group input::placeholder {
	color: #f5f5f5;
}

/* INPUT FOCUS */
.hb-input-group input:focus {
	background: rgba(255, 255, 255, 0.28);
	box-shadow: 0 0 10px rgba(255, 255, 255, 0.4);
}

/* BUTTON */
.hb-register-new-btn {
	width: 100%;
	padding: 12px;
	border: none;
	border-radius: 30px;
	background: linear-gradient(to right, #ff758c, #7b5cff);
	color: white;
	font-weight: 600;
	letter-spacing: 1px;
	transition: 0.4s;
}

.hb-register-new-btn:hover {
	transform: translateY(-2px) scale(1.02);
	background: linear-gradient(to right, #7b5cff, #00c6ff);
	box-shadow: 0 6px 20px rgba(123, 92, 255, 0.5);
}

/* LOGIN TEXT */
.hb-login-text {
	margin-top: 20px;
	color: white;
	font-size: 14px;
}

.hb-login-text a {
	color: #ffd86f;
	text-decoration: none;
	font-weight: 600;
}

.hb-login-text a:hover {
	text-decoration: underline;
}

/* CAKE ICON */
.hb-cake-icon {
	font-size: 45px;
	margin-bottom: 12px;
	color: pink;
	animation: float 2.5s ease-in-out infinite;
}

@
keyframes float { 0%{
	transform: translateY(0px);
}

50
%
{
transform
:
translateY(
-8px
);
}
100
%
{
transform
:
translateY(
0px
);
}
}

/* MOBILE */
@media ( max-width :500px) {
	.hb-register-new-box {
		margin: 15px;
		padding: 35px 25px;
	}
}
</style>
</head>

<body>

	<div class="hb-register-new-box text-center">

		<div class="hb-cake-icon">
			<i class="fa-solid fa-cake-candles"></i>
		</div>

		<h2 class="hb-title">Create Account</h2>

		<p class="hb-subtitle">Join Hanna Bakes & enjoy delicious moments
			🍰</p>

		<form action="<%=request.getContextPath()%>/RegisterServlet"
			method="post">

			<div class="hb-input-group">
				<i class="fa-solid fa-user"></i> <input type="text" name="name"
					placeholder="Enter Your Name" required>
			</div>

			<div class="hb-input-group">
				<i class="fa-solid fa-envelope"></i> <input type="email"
					name="email" placeholder="Enter Your Email" required>
			</div>

			<div class="hb-input-group">
				<i class="fa-solid fa-lock"></i> <input type="password"
					name="password" placeholder="Create Password" required>
			</div>

			<button class="hb-register-new-btn">
				<i class="fa-solid fa-user-plus"></i> Register Now
			</button>

		</form>

		<p class="hb-login-text">
			Already have an account? <a
				href="<%=request.getContextPath()%>/login.jsp"> Login </a>
		</p>

	</div>

</body>
</html>