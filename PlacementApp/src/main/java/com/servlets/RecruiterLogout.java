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

import com.factroy.HibernateUtilFactroy;

@WebServlet("/RecruiterLogout")
public class RecruiterLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		SessionFactory factory = HibernateUtilFactroy.getFactory();
		Session session = factory.openSession();
		
		session.close();
		HttpSession hs = req.getSession();
		hs.invalidate();
		res.sendRedirect("index.jsp");
	}

}
