<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%
String cakeName = request.getParameter("cake");

String cakePrice = request.getParameter("price");

if (cakeName == null) {
	cakeName = "";
}

if (cakePrice == null) {
	cakePrice = "0";
}

String cartTotal = request.getParameter("cartTotal");

if (cartTotal == null) {

	cartTotal = "0";
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Online</title>
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

	<%
	String success = request.getParameter("success");

	if ("true".equals(success)) {
	%>

	<div class="container mt-5 pt-5">
		<div class="alert alert-success text-center">

			<i class="fa-solid fa-circle-check"></i> Order Placed Successfully

		</div>
	</div>

	<%
	}
	%>

	<!-- ORDER SECTION -->

	<section class="hb-order-wrapper py-5 mt-5">
		<div class="container">

			<!-- Heading -->
			<div class="text-center mb-5">
				<h2 class="hb-order-title">Place Your Order</h2>
				<p class="hb-order-subtitle">Fresh cakes made just for you 🎂</p>
			</div>

			<div class="row align-items-center">

				<!-- LEFT IMAGE -->
				<div class="col-md-6 mb-5">
					<img
						src="https://plus.unsplash.com/premium_photo-1673809128618-06466820cf13?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDUwfHx8ZW58MHx8fHx8"
						class="img-fluid hb-order-img">
					<!-- <img src="./Image/Illustration/cake2.avif" class="img-fluid hb-order-img"> -->
				</div>

				<!-- RIGHT FORM -->
				<div class="col-md-6">

					<form class="hb-order-form-box"
						action="<%=request.getContextPath()%>/OrderDetailServlet"
						method="post">

						<div class="mb-3">
							<label>Your Name</label> <input type="text" name="name"
								class="form-control" required>
						</div>



						<div class="mb-3">

							<label class="mb-3">Selected Cakes</label>

							<div class="hb-cart-preview">

								<%
								ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");

								double total = 0;

								if (cart != null && !cart.isEmpty()) {

									for (String[] item : cart) {

										total += Double.parseDouble(item[1]);
								%>

								<div class="hb-cart-item mb-3 p-3 rounded-4 shadow-sm">

									<div class="d-flex justify-content-between align-items-center">

										<!-- LEFT SIDE -->
										<div class="d-flex align-items-center gap-3">

											<i class="fa-solid fa-cake-candles text-danger fs-4"></i>

											<div>

												<h5 class="mb-1 fw-semibold">
													<%=item[0]%>
												</h5>

												<span class="text-success fw-bold fs-5"> ₹<%=item[1]%>
												</span>

											</div>

										</div>

										<!-- RIGHT SIDE QUANTITY -->
										<div class="text-end">

											<label class="small text-muted d-block mb-1"> Qty </label> <input
												type="number" class="form-control cakeQty" value="1" min="1"
												data-price="<%=item[1]%>">

										</div>

									</div>

								</div>
								<%
								}
								} else {
								%>

								<p>No Cakes Added</p>

								<%
								}
								%>

							</div>

						</div>

						<div class="mb-3">

							<label>Total Price</label> <input type="text" id="totalPrice"
								class="form-control" readonly>

						</div>

						<div class="mb-3">
							<label>Delivery Date</label> <input type="date" name="date"
								class="form-control" min="<%=java.time.LocalDate.now()%>"
								required>
						</div>



						<div class="mb-3">
							<label>Message (Optional)</label>
							<textarea class="form-control" name="message"></textarea>
						</div>

						<!-- Added extra part -->

						<!-- PAYMENT METHOD -->

						<div class="mb-3">

							<label>Select Payment Method</label> <select class="form-control"
								id="paymentMethod" name="paymentMethod" required>

								<option value="">Choose Payment</option>

								<option value="UPI">UPI</option>

								<option value="Card">Card</option>

							</select>

						</div>

						<!-- Ended -->

						<button type="button" class="btn btn-success w-100 mb-3"
							data-bs-toggle="modal" data-bs-target="#paymentModal">

							Proceed To Payment</button>

						<input type="hidden" name="finalTotal" id="finalTotal">

					</form>
				</div>

			</div>
		</div>
	</section>

	<!-- SUCCESS POPUP -->
	<div class="hb-order-popup-overlay" id="hbOrderPopup">
		<div class="hb-order-popup-card">
			<i class="fa-solid fa-circle-check hb-order-success-icon"></i>
			<h4>Order Placed Successfully 🎉</h4>
			<p>Your cake will be ready on selected date.</p>
			<button class="btn btn-dark mt-2" onclick="hbCloseOrder()">OK</button>
		</div>
	</div>

	<!-- PAYMENT MODAL -->

	<div class="modal fade" id="paymentModal" tabindex="-1">

		<div class="modal-dialog modal-dialog-centered">

			<div class="modal-content p-4 rounded-4">

				<!-- HEADER -->

				<div class="d-flex justify-content-between align-items-center mb-3">

					<h2 class="fw-bold">Secure Checkout</h2>

					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>

				</div>

				<!-- AMOUNT -->

				<div class="text-center mb-4">

					<h5 class="text-muted">AMOUNT TO PAY</h5>

					<h1 class="fw-bold">
						₹<span id="payAmount"><%=total%></span>

					</h1>

				</div>

				<!-- PAYMENT TABS -->

				<div class="d-flex justify-content-center gap-3 mb-4">

					<button type="button" class="btn btn-primary"
						onclick="showPayment('card')">

						<i class="fa-regular fa-credit-card"></i> Card

					</button>

					<button type="button" class="btn btn-outline-primary"
						onclick="showPayment('upi')">

						<i class="fa-brands fa-google-pay"></i> UPI

					</button>

				</div>

				<!-- CARD PAYMENT -->

				<div id="cardSection" style="display: none;">

					<div class="mb-3">

						<label>Card Number</label>

						<div class="input-group">

							<span class="input-group-text"> <i
								class="fa-regular fa-credit-card"></i>
							</span> <input type="text" class="form-control" name="cardNumber"
								placeholder="1234 5678 9012 3456">

						</div>

					</div>

					<div class="mb-3">

						<label>Card Holder Name</label> <input type="text"
							class="form-control" name="cardHolder" placeholder="Enter Name">

					</div>

					<div class="row">

						<div class="col-md-6">

							<div class="mb-3">

								<label>Expiry Date</label> <input type="month"
									class="form-control" name="expiry">

							</div>

						</div>

						<div class="col-md-6">

							<div class="mb-3">

								<label>CVV</label> <input type="password" class="form-control"
									name="cvv" maxlength="3" placeholder="123">

							</div>

						</div>

					</div>

				</div>
				<!-- UPI PAYMENT -->

				<div id="upiPayment" style="display: none;">

					<div class="mb-3">

						<label>UPI ID</label> <input type="text" class="form-control"
							placeholder="example@upi">

					</div>

				</div>

				<!-- SECURITY -->

				<div class="text-center my-4 text-muted">

					<i class="fa-solid fa-lock"></i> 256-bit SSL Secure Checkout

				</div>

				<!-- PAY BUTTON -->

				<button type="button" class="btn btn-success w-100 py-2"
					onclick="makePayment()">

					Pay ₹<span id="payBtnAmount"><%=total%></span>

				</button>

			</div>

		</div>

	</div>

	<!-- SUCCESS MODAL -->

	<div class="modal fade" id="successModal" tabindex="-1"
		data-bs-backdrop="static">

		<div class="modal-dialog modal-dialog-centered">

			<div class="modal-content p-5 text-center rounded-4 border-0">

				<!-- CLOSE BUTTON -->

				<div class="text-end">

					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>

				</div>

				<!-- TITLE -->

				<h1 class="fw-bold mb-4">All Set!</h1>

				<!-- SUCCESS ICON -->

				<div class="mb-4">

					<div
						style="width: 120px; height: 120px; background: #198754; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: auto;">

						<i class="fa-solid fa-check text-white" style="font-size: 60px;"></i>

					</div>

				</div>

				<!-- MESSAGE -->

				<h1 class="fw-bold text-success">Order Successful!</h1>

				<p class="fs-4 text-secondary mt-3">

					Your delicious Hanna Bakes cake order has been confirmed 🎂 <br>
					<br> Preparing your sweet moments with love ❤️

				</p>

			</div>

		</div>

	</div>

	<!-- SCRIPT -->

	<script>
		function showPayment(type) {

			document.getElementById("cardSection").style.display = "none";

			document.getElementById("upiPayment").style.display = "none";

			if (type === "card") {

				document.getElementById("cardSection").style.display = "block";
			}

			else {

				document.getElementById("upiPayment").style.display = "block";
			}
		}

		function updateTotal() {

			let total = 0;

			let quantities = document.querySelectorAll(".cakeQty");

			quantities.forEach(function(qtyInput) {

				let qty = Number(qtyInput.value);

				let price = Number(qtyInput.dataset.price);

				total += qty * price;
			});

			document.getElementById("totalPrice").value = total;

			document.getElementById("payAmount").innerText = total;

			document.getElementById("payBtnAmount").innerText = total;

			document.getElementById("finalTotal").value = total;
		}

		document.querySelectorAll(".cakeQty").forEach(function(input) {

			input.addEventListener("input", updateTotal);
		});

		updateTotal();

		const paymentMethod = document.getElementById("paymentMethod");

		if (paymentMethod) {

			paymentMethod
					.addEventListener(
							"change",
							function() {

								let method = this.value;

								document.getElementById("cardSection").style.display = "none";

								document.getElementById("upiPayment").style.display = "none";

								if (method === "Card") {

									document.getElementById("cardSection").style.display = "block";
								}

								else if (method === "UPI") {

									document.getElementById("upiPayment").style.display = "block";
								}
							});
		}

		function makePayment() {

			const paymentModal = bootstrap.Modal.getInstance(document
					.getElementById("paymentModal"));

			paymentModal.hide();

			const successModal = new bootstrap.Modal(document
					.getElementById("successModal"));

			successModal.show();

			setTimeout(function() {

				document.querySelector(".hb-order-form-box").submit();

			}, 2000);
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>