package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")

public class ContactServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");

		String email = request.getParameter("email");

		String subject = request.getParameter("subject");

		String message = request.getParameter("message");

		try {

			Connection con = DBConnection.getConnection();

			String query = "INSERT INTO contact_messages(customer_name,customer_email,subject,message) VALUES(?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, name);

			ps.setString(2, email);

			ps.setString(3, subject);

			ps.setString(4, message);

			int row = ps.executeUpdate();

			if (row > 0) {

				System.out.println("CONTACT MESSAGE SAVED");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		response.sendRedirect("Contact.jsp?success=true");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
}