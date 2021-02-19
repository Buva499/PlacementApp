package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entity.Companies;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/EditCompany")
public class EditCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String cname = req.getParameter("cname");
			SessionFactory factory = HibernateUtilFactroy.getFactory();
			Session session = factory.openSession();
			Companies company = session.load(Companies.class, cname);
			
			HttpSession hs = req.getSession();
			hs.setAttribute("company", company);
			
			res.sendRedirect("editCompany.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
