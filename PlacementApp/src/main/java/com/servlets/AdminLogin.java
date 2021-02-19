package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entity.Admin;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminId = request.getParameter("aemail");
		String adminPass = request.getParameter("apass");

		try {

			SessionFactory factory = HibernateUtilFactroy.getFactory();
			Session session = factory.openSession();
			Admin admin = session.load(Admin.class, adminId);

			if (adminId.equals(admin.getAdminId()) && adminPass.equals(admin.getAdminPass())) {
				response.sendRedirect("AdminHomePage.jsp");
			} else {
				response.sendRedirect("adminLogin.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
