<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About</title>
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

</head>
<body>

	<%
	String userCheck = (String) session.getAttribute("user");

	if (userCheck == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<!-- navbar -->
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
			<%
			String user = (String) session.getAttribute("user");
			%>

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

					<!-- LOGOUT -->
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

	<section class="container-fluid aboutme-section-wrapper mt-5">
		<div class="container text-center aboutme-content-holder">

			<h2 class="aboutme-heading-title">About Me</h2>
			<div class="aboutme-divider-line"></div>

			<p class="aboutme-subtitle-text">HANNA MASON – PASTRY CHEF, HOME
				BAKER, BLOGGER</p>

			<div class="aboutme-image-container">
				<img src="./Image/Illustration/back img1 (23).jpg" alt="About Hanna"
					class="aboutme-profile-image">
			</div>

			<div class="aboutme-paragraph-box">
				<p>I am a passionate pastry chef and home baker who believes
					that every cake tells a story. From handcrafted designer cakes to
					freshly baked desserts, each creation is made with premium
					ingredients, attention to detail, and a whole lot of love. Baking
					for me is not just a profession, but a creative journey that brings
					happiness to every celebration.</p>

				<p>Whether it’s weddings, birthdays, anniversaries, or special
					moments, my goal is to design cakes that match your taste, style,
					and vision. With a focus on quality, freshness, and elegant
					presentation, Hanna Bakes is dedicated to delivering desserts that
					look beautiful and taste unforgettable.</p>
			</div>

		</div>
	</section>

	<!-- NEWSLETTER SECTION -->
	<section class="newsletter-section">
		<div class="container newsletter-container">

			<h3 class="newsletter-title">
				Sweet Updates from Hanna Bakes <i class="fa-solid fa-cake-candles"></i>
			</h3>

			<p class="text-center mb-3">Get updates on new designer cakes,
				special offers, and exclusive discounts directly to your inbox.</p>

			<form action="<%=request.getContextPath()%>/NewsletterServlet"
				method="post" class="newsletter-form">

				<label class="newsletter-label">Email <span>*</span></label> <input
					type="email" name="email" class="newsletter-input"
					placeholder="Enter your email" required>

				<div class="newsletter-checkbox">
					<input type="checkbox" name="subscribe" id="subscribeCheck"
						required> <label for="subscribeCheck"> Yes, I want
						cake offers & updates <i class="fa-solid fa-cake-candles"></i> <span>*</span>
					</label>
				</div>

				<button type="submit" class="newsletter-btn">Subscribe Now
				</button>
			</form>

		</div>
	</section>

	<!-- FOOTER -->
	<footer class="footer-section">
		<p>
			© 2035 by Hanna Bakes. Powered and secured by <span>Dhanu</span>
		</p>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>