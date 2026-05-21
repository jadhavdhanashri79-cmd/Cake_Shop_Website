<%@page import="java.sql.*"%>
<%@page import="com.org.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | Hanna Bakes</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

<style>
body {
	background: #fff5f8;
	font-family: 'Poppins', sans-serif;
	padding: 30px;
}

/* TITLE */
.hb-title {
	text-align: center;
	color: #d63384;
	font-weight: 700;
	margin-bottom: 40px;
}

/* BOXES */
.hb-box {
	background: white;
	border-radius: 20px;
	padding: 30px;
	text-align: center;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
	cursor: pointer;
}

.hb-box:hover {
	transform: translateY(-8px);
}

.hb-box i {
	font-size: 45px;
	color: #d63384;
	margin-bottom: 15px;
}

.hb-box h4 {
	font-weight: 700;
}

/* LOGOUT BUTTON */
.hb-top-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 35px;
}

.hb-title {
	margin: 0;
	color: #d63384;
	font-weight: 700;
}

.hb-logout-btn {
	background: linear-gradient(to right, #ff4d6d, #c77dff);
	color: white;
	padding: 10px 22px;
	border-radius: 30px;
	text-decoration: none;
	font-weight: 600;
	display: flex;
	align-items: center;
	gap: 8px;
	transition: 0.3s;
}

.hb-logout-btn:hover {
	transform: scale(1.05);
	color: white;
}
/* DATA SECTION */
.hb-data-section {
	display: none;
	margin-top: 40px;
	background: white;
	border-radius: 20px;
	padding: 25px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}

.table {
	margin-top: 20px;
}

thead {
	background: linear-gradient(to right, #ff4d6d, #c77dff);
	color: white;
}

/* INSERT FORM */
.hb-form input, .hb-form textarea {
	margin-bottom: 15px;
	border-radius: 12px;
}

.hb-btn {
	border: none;
	padding: 8px 18px;
	border-radius: 25px;
	color: white;
}

.hb-add-btn {
	background: #198754;
}

.hb-delete-btn {
	background: #dc3545;
}
</style>

<script>

function showSection(id){

    let sections =
    document.querySelectorAll(".hb-data-section");

    sections.forEach(section=>{
        section.style.display="none";
    });

    document.getElementById(id).style.display="block";
}

</script>

</head>

<body>

	<div class="hb-top-bar">

		<h1 class="hb-title">
			<i class="fa-solid fa-user-shield"></i> Hanna Bakes Admin Dashboard
		</h1>

		<a href="LogoutServlet" class="hb-logout-btn"> <i
			class="fa-solid fa-right-from-bracket"></i> Logout
		</a>

	</div>

	<!-- TOP BOXES -->

	<div class="container">

		<div class="row g-4">

			<div class="col-md-3">

				<div class="hb-box" onclick="showSection('usersSection')">

					<i class="fa-solid fa-users"></i>

					<h4>Users</h4>

				</div>

			</div>

			<div class="col-md-3">

				<div class="hb-box" onclick="showSection('ordersSection')">

					<i class="fa-solid fa-cart-shopping"></i>

					<h4>Orders</h4>

				</div>

			</div>

			<div class="col-md-3">

				<div class="hb-box" onclick="showSection('cakeSection')">

					<i class="fa-solid fa-cake-candles"></i>

					<h4>Cakes</h4>

				</div>

			</div>

			<div class="col-md-3">

				<div class="hb-box" onclick="showSection('newsletterSection')">

					<i class="fa-solid fa-envelope"></i>

					<h4>Newsletter</h4>

				</div>

			</div>

			<div class="col-md-3">

				<div class="hb-box" onclick="showSection('contactSection')">

					<i class="fa-solid fa-message"></i>

					<h4>Contact</h4>

				</div>

			</div>

		</div>

		<%
		Connection con = DBConnection.getConnection();

		String action = request.getParameter("action");
		%>

		<%
		String deleteUser = request.getParameter("deleteUser");

		if (deleteUser != null) {

			PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id=?");

			ps.setInt(1, Integer.parseInt(deleteUser));

			ps.executeUpdate();
		}
		%>

		<!-- USERS SECTION -->

		<div id="usersSection" class="hb-data-section">

			<h3>Users Information</h3>

			<!-- INSERT USER -->

			<form method="post" class="hb-form">

				<input type="hidden" name="action" value="addUser"> <input
					type="text" name="name" class="form-control"
					placeholder="Enter Name" required> <input type="email"
					name="email" class="form-control" placeholder="Enter Email"
					required> <input type="text" name="password"
					class="form-control" placeholder="Enter Password" required>

				<button type="submit" class="hb-btn hb-add-btn">Add User</button>

			</form>

			<%
			if ("addUser".equals(action)) {

				String name = request.getParameter("name");

				String email = request.getParameter("email");

				String password = request.getParameter("password");

				PreparedStatement ps = con.prepareStatement("INSERT INTO users(name,email,password) VALUES(?,?,?)");

				ps.setString(1, name);

				ps.setString(2, email);

				ps.setString(3, password);

				ps.executeUpdate();
			}
			%>

			<table class="table table-bordered table-hover">

				<thead>

					<tr>

						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Password</th>
						<th>Action</th>

					</tr>

				</thead>

				<tbody>

					<%
					PreparedStatement ps1 = con.prepareStatement("SELECT * FROM users");

					ResultSet rs1 = ps1.executeQuery();

					int count = 1;
					while (rs1.next()) {
					%>



					<tr>

						<td><%=count++%></td>

						<td><%=rs1.getString("name")%></td>

						<td><%=rs1.getString("email")%></td>

						<td><%=rs1.getString("password")%></td>

						<td><a
							href="adminDashboard.jsp?deleteUser=<%=rs1.getInt("id")%>"
							class="btn btn-danger btn-sm"> Delete </a></td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

		</div>

		<!-- ORDERS SECTION -->

		<div id="ordersSection" class="hb-data-section">

			<h3>Orders Information</h3>

			<%
			String deleteOrder = request.getParameter("deleteOrder");

			if (deleteOrder != null) {

				PreparedStatement ps = con.prepareStatement("DELETE FROM orders WHERE id=?");

				ps.setInt(1, Integer.parseInt(deleteOrder));

				ps.executeUpdate();
			}
			%>

			<table class="table table-bordered table-hover">

				<thead>

					<tr>

						<th>ID</th>
						<th>Customer</th>
						<th>Cake</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>Order Date</th>
						<th>Delivery Date</th>
						<th>Payment</th>

						<th>Action</th>

					</tr>

				</thead>

				<tbody>

					<%
					PreparedStatement ps2 = con.prepareStatement("SELECT * FROM orders");

					ResultSet rs2 = ps2.executeQuery();

					int countrs2 = 1;
					while (rs2.next()) {
					%>

					<tr>
						<td><%=countrs2++%></td>

						<td><%=rs2.getString("customer_name")%></td>

						<td><%=rs2.getString("cake_name")%></td>

						<td><%=rs2.getInt("quantity")%></td>

						<td>₹ <%=rs2.getDouble("total_price")%></td>

						<td><%=rs2.getTimestamp("order_date")%></td>

						<td><%=rs2.getString("delivery_date")%></td>

						<td><%=rs2.getString("payment_method")%></td>



						<td><a
							href="adminDashboard.jsp?deleteOrder=<%=rs2.getInt("id")%>"
							class="btn btn-danger btn-sm"> Delete </a></td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

		</div>

		<!-- CAKE SECTION -->

		<div id="cakeSection" class="hb-data-section">

			<h3>Cakes Information</h3>

			<!-- INSERT CAKE -->

			<form method="post" class="hb-form">

				<input type="hidden" name="action" value="addCake"> <input
					type="text" name="cake_name" class="form-control"
					placeholder="Cake Name" required> <input type="number"
					name="cake_price" class="form-control" placeholder="Cake Price"
					required> <input type="text" name="cake_image"
					class="form-control" placeholder="Cake Image URL" required>

				<textarea name="cake_description" class="form-control"
					placeholder="Cake Description" required></textarea>

				<button type="submit" class="hb-btn hb-add-btn">Add Cake</button>

			</form>

			<%
			/* INSERT CAKE */

			if ("addCake".equals(action)) {

				String cakeName = request.getParameter("cake_name");

				String cakePrice = request.getParameter("cake_price");

				String cakeImage = request.getParameter("cake_image");

				String cakeDescription = request.getParameter("cake_description");

				PreparedStatement ps = con
				.prepareStatement("INSERT INTO cakes(cake_name,cake_price,cake_image,cake_description) VALUES(?,?,?,?)");

				ps.setString(1, cakeName);

				ps.setInt(2, Integer.parseInt(cakePrice));

				ps.setString(3, cakeImage);

				ps.setString(4, cakeDescription);

				ps.executeUpdate();
			}

			/* DELETE CAKE */

			String deleteCake = request.getParameter("deleteCake");

			if (deleteCake != null) {

				PreparedStatement ps = con.prepareStatement("DELETE FROM cakes WHERE id=?");

				ps.setInt(1, Integer.parseInt(deleteCake));

				ps.executeUpdate();
			}
			%>

			<table class="table table-bordered table-hover">

				<thead>

					<tr>

						<th>ID</th>
						<th>Image</th>
						<th>Name</th>
						<th>Price</th>
						<th>Description</th>
						<th>Action</th>

					</tr>

				</thead>

				<tbody>

					<%
					PreparedStatement psCake = con.prepareStatement("SELECT * FROM cakes");

					ResultSet rsCake = psCake.executeQuery();

					int countrs = 1;
					while (rsCake.next()) {
					%>

					<tr>

						<td><%=countrs++%></td>

						<td><img src="<%=rsCake.getString("cake_image")%>"
							width="80" height="80"
							style="border-radius: 10px; object-fit: cover;"></td>

						<td><%=rsCake.getString("cake_name")%></td>

						<td>₹ <%=rsCake.getDouble("cake_price")%></td>

						<td><%=rsCake.getString("cake_description")%></td>

						<td><a
							href="adminDashboard.jsp?deleteCake=<%=rsCake.getInt("id")%>"
							class="btn btn-danger btn-sm"> Delete </a></td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

		</div>

		<!-- NEWSLETTER SECTION -->

		<div id="newsletterSection" class="hb-data-section">

			<h3>Newsletter Subscribers</h3>

			<%
			String deleteNewsletter = request.getParameter("deleteNewsletter");

			if (deleteNewsletter != null) {

				PreparedStatement ps = con.prepareStatement("DELETE FROM newsletter WHERE id=?");

				ps.setInt(1, Integer.parseInt(deleteNewsletter));

				ps.executeUpdate();
			}
			%>

			<table class="table table-bordered table-hover">

				<thead>

					<tr>

						<th>ID</th>
						<th>Email</th>
						<th>Action</th>

					</tr>

				</thead>

				<tbody>

					<%
					PreparedStatement ps3 = con.prepareStatement("SELECT * FROM newsletter");

					ResultSet rs3 = ps3.executeQuery();

					int countrs3 = 1;
					while (rs3.next()) {
					%>

					<tr>

						<td><%=countrs3++%></td>

						<td><%=rs3.getString("email")%></td>

						<td><a
							href="adminDashboard.jsp?deleteNewsletter=<%=rs3.getInt("id")%>"
							class="btn btn-danger btn-sm"> Delete </a></td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

		</div>

		<!-- CONTACT SECTION -->

		<div id="contactSection" class="hb-data-section">

			<h3>Contact Messages</h3>

			<%
			String deleteContact = request.getParameter("deleteContact");

			if (deleteContact != null) {

				PreparedStatement ps = con.prepareStatement("DELETE FROM contact_messages WHERE id=?");

				ps.setInt(1, Integer.parseInt(deleteContact));

				ps.executeUpdate();
			}
			%>

			<table class="table table-bordered table-hover">

				<thead>

					<tr>

						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Subject</th>
						<th>Message</th>
						<th>Action</th>

					</tr>

				</thead>

				<tbody>

					<%
					PreparedStatement ps4 = con.prepareStatement("SELECT * FROM contact_messages");

					ResultSet rs4 = ps4.executeQuery();

					int countrs4 = 1;
					while (rs4.next()) {
					%>

					<tr>

						<td><%=countrs4++%></td>

						<td><%=rs4.getString("customer_name")%></td>

						<td><%=rs4.getString("customer_email")%></td>

						<td><%=rs4.getString("subject")%></td>

						<td><%=rs4.getString("message")%></td>

						<td><a
							href="adminDashboard.jsp?deleteContact=<%=rs4.getInt("id")%>"
							class="btn btn-danger btn-sm"> Delete </a></td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

		</div>

	</div>

</body>
</html>