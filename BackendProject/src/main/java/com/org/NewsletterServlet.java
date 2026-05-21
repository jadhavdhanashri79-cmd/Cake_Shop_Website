package com.org;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/NewsletterServlet")
public class NewsletterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hanna_bakes", "root", "root");

			PreparedStatement ps = con.prepareStatement("INSERT INTO newsletter(email) VALUES(?)");

			ps.setString(1, email);

			int i = ps.executeUpdate();

			if (i > 0) {
				response.getWriter().println(
						"<script>alert(' Subscribed Successfully! You will receive cake updates '); window.location='homepage.jsp';</script>");
			} else {
				response.getWriter().println("Subscription Failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}