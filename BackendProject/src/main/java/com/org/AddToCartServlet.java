package com.org;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddToCartServlet")

public class AddToCartServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cake = request.getParameter("cake");

		String price = request.getParameter("price");

		HttpSession session = request.getSession();

		ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");

		if (cart == null) {

			cart = new ArrayList<>();
		}

		String item[] = { cake, price };

		cart.add(item);

		session.setAttribute("cart", cart);

		response.sendRedirect("Cart.jsp");
	}
}