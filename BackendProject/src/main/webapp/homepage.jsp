<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer Cakes</title>
</head>
<body>
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

	<%
	String success = request.getParameter("success");
	if ("true".equals(success)) {
	%>
	<script>
		window.onload = function() {
			document.getElementById("hbPopup").style.display = "flex";
		}
	</script>
	<%
	}
	%>


	<!-- HERO -->
	<section id="home" class="hero-main-wrapper">

		<!-- <div class="hero-brand-title">
        <p>HANNA BAKES.</p>
    </div> -->

		<div class="container-fluid hero-grid-container">
			<div class="row g-0 hero-grid-row">

				<div class="col-md-4 hero-image-left">
					<img src="./Image/Illustration/back img1 (22).jpg">
				</div>

				<div class="col-md-4 hero-text-center">
					<h1>
						Designer Cakes<br>Delivered to Your<br>Doorstep
					</h1>
					<button
						onclick="window.location.href='<%=request.getContextPath()%>/OrderOnline.jsp'"
						class="hero-cta-button">Order Online</button>
				</div>

				<div class="col-md-4 hero-image-right">
					<img src="./Image/Illustration/back img2 (5).jpg">
				</div>

			</div>
		</div>
	</section>

	<!-- TAILOR STRIP -->
	<div class="tailor-strip-section">
		<p>ALL CAKES ARE TAILORED TO YOUR TASTE AND STYLE</p>
	</div>

	<!-- IMAGE SPLIT -->
	<div class="image-split-wrapper">
		<div class="row g-0">

			<div class="col-12 col-md-6 split-image-left">
				<img src="./Image/Background/back img1 (23).jpg">
				<button
					onclick="window.location.href='<%=request.getContextPath()%>/About.jsp'"
					class="split-btn-left">Meet Hanna</button>
			</div>

			<div class="col-12 col-md-6 split-image-right">
				<img src="./Image/Illustration/minicake.avif">
				<button
					onclick="window.location.href='<%=request.getContextPath()%>/Contact.jsp'"
					class="split-btn-right">Contact</button>
			</div>

		</div>
	</div>

	<!-- section5 -->
	<section class="cakeSectionWrapper">
		<div class="cakeFlexContainer">

			<!-- TEXT AREA -->
			<div class="cakeTextBlock">
				<h1 class="cakeMainHeading">
					MY <span class="cakeHighlightWord">CAKES</span> ARE<br />
					HANDCRAFTED<br /> WITH LOVE.
				</h1>

				<p class="cakeDescriptionText">Every cake is carefully handmade
					using premium ingredients and pure passion. Perfect for
					celebrations, moments, and memories that deserve something special
					and delicious.</p>
			</div>

			<!-- IMAGE AREA -->
			<a href="#chat" class="cakeImageLink"> <img
				src="./Image/Illustration/cake4.jpg" alt="Handcrafted Cake"
				class="cakeDisplayImage" /> <!-- <button class="cakeChatButton">Let's Chat!</button> -->
			</a>

		</div>
	</section>
	<!-- section 5 ended -->

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

	<script src="js/script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>