package com.org;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RemoveCartServlet")

public class RemoveCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int index = Integer.parseInt(request.getParameter("index"));

		HttpSession session = request.getSession();

		ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");

		if (cart != null && index >= 0 && index < cart.size()) {

			cart.remove(index);
		}

		session.setAttribute("cart", cart);

		response.sendRedirect("Cart.jsp");
	}
}