<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.org.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hanna Bakes | Menu</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	rel="stylesheet">

<!-- Beautiful Cursive Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Poppins:wght@300;400;500&display=swap"
	rel="stylesheet">


<link rel="stylesheet" href="style.css">

<style>

/* TITLE */
.hb-title {
	padding-top: 100px;
	text-align: center;
	margin-bottom: 60px;
}

.hb-title h1 {
	font-size: 40px;
	font-weight: 300;
	color: #3d1f17;
}

.hb-title p {
	font-size: 20px;
	color: #8a817c;
	margin-top: 10px;
}

/* CARD */
.hb-card {
	background: white;
	border-radius: 28px;
	overflow: hidden;
	transition: 0.4s;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
	margin-bottom: 30px;
}

.hb-card:hover {
	transform: translateY(-10px);
}

.hb-img {
	width: 100%;
	height: 150px;
	object-fit: cover;
}

.hb-content {
	padding: 20px 15px;
	text-align: center;
}

.hb-content h5 {
	font-size: 20px;
	font-weight: 300;
	color: #1e293b;
	margin-bottom: 10px;
}

.hb-content p {
	color: #6b7280;
	font-size: 20px;
}

.hb-price {
	color: #cc643c;
	font-size: 20px;
	font-weight: 300;
	margin: 15px 0;
}

/* BUTTON */
.hb-btn {
	background: #cc643c;
	border: none;
	color: white;
	border-radius: 40px;
	padding: 10px 20px;
	width: 75%;
	font-size: 18px;
	font-weight: 300;
	transition: 0.3s;
}

.hb-btn:hover {
	background: #b65430;
	transform: scale(1.05);
	color: white;
}

.hb-btn i {
	margin-right: 8px;
}

/* ALERT */
.alert {
	border-radius: 16px;
	font-size: 18px;
}

/* RESPONSIVE */
@media ( max-width :992px) {
	.hb-title h1 {
		font-size: 50px;
	}
	.hb-content h5 {
		font-size: 26px;
	}
	.hb-price {
		font-size: 28px;
	}
}

@media ( max-width :768px) {
	.hb-title h1 {
		font-size: 42px;
	}
	.hb-title p {
		font-size: 18px;
	}
	.hb-img {
		height: 220px;
	}
	.hb-content p {
		font-size: 18px;
	}
	.hb-btn {
		width: 100%;
		font-size: 18px;
	}
}
</style>

</head>

<body>
	<%
	String user = (String) session.getAttribute("user");

	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>
	<!-- NAVBAR -->
	<nav
		class="navbar navbar-expand-lg bg-white fixed-top navbar-main-section">
		<div class="container-fluid px-5 navbar-inner-container">
			<a class="navbar-brand hb-logo" href="homepage.jsp"> <i
				class="fa-solid fa-cake-candles hb-logo-icon"></i> <span
				class="hb-logo-text"> Hanna Bakes. </span>

			</a>

			<div
				class="collapse navbar-collapse justify-content-center navbar-menu-wrapper">
				<ul class="navbar-nav navbar-menu-list">
					<li class="nav-item"><a class="nav-link active"
						href="./homepage.jsp"><b>Home</b></a></li>
					<li class="nav-item"><a class="nav-link" href="./About.jsp"><b>About</b></a></li>
					<li class="nav-item"><a class="nav-link" href="./Menu.jsp"><b>Menu</b></a></li>
					<li class="nav-item"><a class="nav-link"
						href="./OrderOnline.jsp"><b>Order_Online</b></a></li>
					<li class="nav-item"><a class="nav-link" href="./Contact.jsp"><b>Contact</b></a></li>
				</ul>
			</div>

			<!-- login out -->

			<div class="dropdown">

				<%
				if (user != null) {
				%>

				<!-- USER DROPDOWN -->
				<button class="btn hb-user-dropdown dropdown-toggle" type="button"
					data-bs-toggle="dropdown">

					<i class="fa-solid fa-circle-user"></i>
					<%=user%>
				</button>

				<ul class="dropdown-menu hb-dropdown-menu">
					<li><a class="dropdown-item"
						href="<%=request.getContextPath()%>/About.jsp"> <i
							class="fa-solid fa-user"></i> Profile
					</a></li>

					<li><a class="dropdown-item"
						href="<%=request.getContextPath()%>/OrderOnline.jsp"> <i
							class="fa-solid fa-box"></i> Orders
					</a></li>

					<li><hr class="dropdown-divider"></li>

					<!--  LOGOUT -->
					<li><a class="dropdown-item text-danger"
						href="<%=request.getContextPath()%>/LogoutServlet"> <i
							class="fa-solid fa-right-from-bracket"></i> Logout
					</a></li>
				</ul>

				<%
				} else {
				%>

				<!-- IF NOT LOGGED IN -->
				<a href="login.jsp" class="hb-login-icon-btn"> <i
					class="fa-solid fa-user"></i> Login
				</a>

				<%
				}
				%>

			</div>

			<!-- login out ended -->


		</div>
	</nav>

	<!-- SUCCESS MESSAGE -->

	<%
	String success = request.getParameter("success");

	if ("true".equals(success)) {
	%>

	<div class="container pt-5 mt-5">

		<div class="alert alert-success text-center">

			<i class="fa-solid fa-circle-check"></i> Item Added To Cart
			Successfully

		</div>

	</div>

	<%
	}
	%>

	<!-- TITLE -->

	<div class="container hb-title">

		<h1>Our Delicious Menu</h1>

		<p>Freshly baked with love</p>

	</div>

	<!-- MENU -->

	<div class="container">

		<div class="row">

			<%
			Connection conMenu = DBConnection.getConnection();

			PreparedStatement psMenu = conMenu.prepareStatement("SELECT * FROM cakes");

			ResultSet rsMenu = psMenu.executeQuery();

			while (rsMenu.next()) {
			%>

			<div class="col-lg-3 col-md-6">

				<div class="hb-card">

					<img src="<%=rsMenu.getString("cake_image")%>" class="hb-img">

					<div class="hb-content">

						<h5>
							<%=rsMenu.getString("cake_name")%>
						</h5>

						<p>
							<%=rsMenu.getString("cake_description")%>
						</p>

						<div class="hb-price">
							₹
							<%=rsMenu.getDouble("cake_price")%>
						</div>

						<form action="AddToCartServlet" method="post">

							<input type="hidden" name="cake"
								value="<%=rsMenu.getString("cake_name")%>"> <input
								type="hidden" name="price"
								value="<%=rsMenu.getDouble("cake_price")%>">

							<button type="submit" class="btn hb-btn">

								<i class="fa-solid fa-cart-plus"></i> Add To Cart

							</button>

						</form>

					</div>

				</div>

			</div>

			<%
			}
			%>

		</div>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>