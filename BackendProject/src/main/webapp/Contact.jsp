<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String success = request.getParameter("success");

if ("true".equals(success)) {
%>

<div class="container mt-5 pt-5">

	<div class="alert alert-success text-center">Message Sent
		Successfully 💌</div>

</div>

<%
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact</title>
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

	<!-- second contact -->

	<section class="hb-contact-premium-section py-5 mt-5">
		<div class="container">

			<!-- Heading -->
			<div class="text-center mb-5">
				<h2 class="hb-contact-premium-title">Contact Hanna Bakes</h2>
				<p class="hb-contact-premium-subtitle">Sweet moments start with
					a message 🍰</p>
			</div>

			<div class="row g-4 align-items-stretch">

				<!-- LEFT IMAGE CARD -->
				<div class="col-lg-5">
					<div class="hb-contact-premium-imagebox">
						<div class="hb-contact-overlay">
							<h3>Visit Our Bakery</h3>
							<p>Pune, Maharashtra</p>
						</div>
					</div>
				</div>

				<!-- RIGHT FORM -->
				<div class="col-lg-7">
					<div class="hb-contact-premium-formbox">

						<form action="<%=request.getContextPath()%>/ContactServlet"
							method="post">

							<div class="row">

								<div class="col-md-6 mb-3">
									<input type="text" class="form-control hb-input" name="name"
										placeholder="Your Name" required>
								</div>

								<div class="col-md-6 mb-3">
									<input type="email" class="form-control hb-input" name="email"
										placeholder="Your Email" required>
								</div>

							</div>

							<div class="mb-3">
								<input type="text" class="form-control hb-input" name="subject"
									placeholder="Subject">
							</div>

							<div class="mb-3">
								<textarea class="form-control hb-input" rows="4" name="message"
									placeholder="Your Message" required></textarea>
							</div>

							<button type="submit" class="btn hb-premium-btn w-100">

								Send Message ✉️</button>

						</form>

						<!-- CONTACT INFO -->
						<div class="hb-contact-bottom-info mt-4">
							<div>
								<i class="fa-solid fa-phone"></i> +91 98765 43210
							</div>
							<div>
								<i class="fa-solid fa-envelope"></i> hannabakes@gmail.com
							</div>
							<div>
								<i class="fa-solid fa-location-dot"></i> Pune, India
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>

		<!-- GOOGLE MAP -->
		<div class="mt-5 mb-5">
			<iframe
				src="https://maps.google.com/maps?q=pune&t=&z=13&ie=UTF8&iwloc=&output=embed"
				class="hb-map-frame"> </iframe>
		</div>

		</div>
	</section>

	<!-- POPUP -->
	<div class="hb-premium-popup" id="hbPremiumPopup">
		<div class="hb-premium-popup-card">
			<i class="fa-solid fa-circle-check"></i>
			<h4>Message Sent Successfully 💌</h4>
			<button onclick="hbClosePremium()" class="btn btn-dark mt-2">OK</button>
		</div>
	</div>

	</section>

	<script>
		function hbUltraSubmit(e) {
			e.preventDefault();
			document.getElementById("hbUltraPopup").style.display = "flex";
		}

		function hbUltraClose() {
			document.getElementById("hbUltraPopup").style.display = "none";
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>