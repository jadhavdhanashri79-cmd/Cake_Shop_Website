package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Random;
import com.org.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OrderDetailServlet")

public class OrderDetailServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");

		String finalTotal = request.getParameter("finalTotal");

		double totalPriceFromForm = Double.parseDouble(finalTotal);

		String date = request.getParameter("date");

		String message = request.getParameter("message");

		String paymentMethod = request.getParameter("paymentMethod");

		HttpSession session = request.getSession();

		ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");

		StringBuilder cakeNames = new StringBuilder();

		double totalPrice = 0;

		if (cart != null) {

			for (String[] item : cart) {

				cakeNames.append(item[0]).append(", ");

				totalPrice += Double.parseDouble(item[1]);
			}
		}

		String cake = cakeNames.toString();

		int qty = 0;

		if (cart != null) {

			for (String[] item : cart) {

				qty += 1;
			}
		}

		totalPrice = totalPriceFromForm;

		// Demo Transaction ID
		Random random = new Random();

		String transactionId = "TXN" + (100000 + random.nextInt(900000));

		String paymentStatus = "Paid";

		String orderStatus = "Preparing";

		System.out.println(name);
		System.out.println(cake);
		System.out.println(qty);
		System.out.println(date);
		System.out.println(message);
		System.out.println(paymentMethod);

		try {

			Connection con = DBConnection.getConnection();

			String query = "INSERT INTO orders(customer_name,cake_name,quantity,price,total_price,delivery_date,message,payment_method,payment_status,transaction_id,order_status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, name);

			ps.setString(2, cake);

			ps.setInt(3, qty);

			ps.setDouble(4, totalPrice);

			ps.setDouble(5, totalPrice);

			ps.setString(6, date);

			ps.setString(7, message);

			ps.setString(8, paymentMethod);

			ps.setString(9, paymentStatus);

			ps.setString(10, transactionId);

			ps.setString(11, orderStatus);

			int row = ps.executeUpdate();

			if (row > 0) {

				System.out.println("DATA INSERTED SUCCESSFULLY");
			} else {

				System.out.println("INSERT FAILED");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		// Session

		session.setAttribute("name", name);

		session.setAttribute("cake", cake);

		session.setAttribute("quantity", qty);

		session.setAttribute("date", date);

		session.setAttribute("message", message);

		session.setAttribute("paymentMethod", paymentMethod);

		session.setAttribute("transactionId", transactionId);

		session.setAttribute("totalPrice", totalPrice);

		session.setAttribute("paymentStatus", paymentStatus);

		session.setAttribute("orderStatus", orderStatus);

		session.removeAttribute("cart");

		response.sendRedirect("homepage.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
}
