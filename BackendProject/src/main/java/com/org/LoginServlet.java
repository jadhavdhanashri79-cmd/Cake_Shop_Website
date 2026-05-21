package com.org;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		String email = request.getParameter("email");

		String password = request.getParameter("password");

		String role = request.getParameter("role");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hanna_bakes", "root", "root");

			// ADMIN LOGIN

			if (role.equals("admin")) {

				if (email.equals("admin@gmail.com") && password.equals("admin123")) {

					HttpSession session = request.getSession();

					session.setAttribute("admin", "Admin");

					response.sendRedirect("adminDashboard.jsp");
				} else {

					response.getWriter().println("Invalid Admin Credentials");
				}

			}

			// USER LOGIN

			else {

				PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");

				ps.setString(1, email);

				ps.setString(2, password);

				ResultSet rs = ps.executeQuery();

				if (rs.next()) {

					HttpSession session = request.getSession();

					String name = rs.getString("name");

					session.setAttribute("user", name);

					response.sendRedirect("homepage.jsp");
				} else {

					response.getWriter().println("Invalid Email or Password");
				}
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}