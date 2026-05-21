<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body style="background: #fff8f8;">

	<div class="container mt-5">

		<div class="card shadow p-5 rounded-4">

			<h2 class="text-center text-success mb-4">Order Placed
				Successfully 🎉</h2>

			<hr>

			<h4>
				Customer Name:
				<%=session.getAttribute("name")%>
			</h4>

			<h4>
				Cake:
				<%=session.getAttribute("cake")%>
			</h4>

			<h4>
				Quantity:
				<%=session.getAttribute("quantity")%>
			</h4>

			<h4>
				Delivery Date:
				<%=session.getAttribute("date")%>
			</h4>

			<h4>
				Message:
				<%=session.getAttribute("message")%>
			</h4>

			<h4>
				Payment Method:
				<%=session.getAttribute("paymentMethod")%>
			</h4>

			<h4>
				Total Price: ₹<%=session.getAttribute("totalPrice")%>
			</h4>

			<h4>
				Transaction ID: <span class="text-primary"> <%=session.getAttribute("transactionId")%>
				</span>
			</h4>

			<h4>
				Payment Status: <span class="text-success"> <%=session.getAttribute("paymentStatus")%>
				</span>
			</h4>

			<h4>
				Order Status: <span class="text-warning"> <%=session.getAttribute("orderStatus")%>
				</span>
			</h4>

		</div>

	</div>

</body>
</html>