<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Cart</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	rel="stylesheet">

<style>
body {
	background: #fff8f5;
	font-family: Poppins;
}

.hb-cart-card {
	border: none;
	border-radius: 20px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
}

.hb-cart-title {
	color: #cc643c;
	font-weight: 700;
}

.hb-btn {
	border-radius: 30px;
	padding: 10px 20px;
}
</style>

</head>

<body>

	<div class="container mt-5">

		<div class="card hb-cart-card p-4">

			<h2 class="text-center hb-cart-title mb-4">

				<i class="fa-solid fa-cart-shopping"></i> My Cart

			</h2>

			<table class="table table-hover text-center">

				<thead class="table-dark">

					<tr>
						<th>Cake</th>
						<th>Price</th>
						<th>Action</th>
					</tr>

				</thead>

				<tbody>

					<%
					ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");

					double total = 0;

					if (cart != null && !cart.isEmpty()) {

						for (int i = 0; i < cart.size(); i++) {

							String[] item = cart.get(i);

							total += Double.parseDouble(item[1]);
					%>

					<tr>

						<td><%=item[0]%></td>

						<td>₹<%=item[1]%></td>

						<td><a href="RemoveCartServlet?index=<%=i%>"
							class="btn btn-danger btn-sm"> <i class="fa-solid fa-trash"></i>

								Delete

						</a></td>

					</tr>

					<%
					}
					} else {
					%>

					<tr>

						<td colspan="3">Cart is Empty</td>

					</tr>

					<%
					}
					%>

				</tbody>

			</table>

			<h4 class="text-end">

				Total: ₹<%=total%>

			</h4>

			<div class="text-end mt-4">

				<a href="Menu.jsp" class="btn btn-secondary hb-btn"> <i
					class="fa-solid fa-arrow-left"></i> Continue Shopping

				</a> <a href="OrderOnline.jsp" class="btn btn-success hb-btn"> <i
					class="fa-solid fa-bag-shopping"></i> Proceed To Order

				</a>

			</div>

		</div>

	</div>

</body>
</html>