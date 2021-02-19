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
import org.hibernate.Transaction;

import org.hibernate.query.Query;

import com.entity.Student;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			HttpSession ss = req.getSession();
			Student std = (Student) ss.getAttribute("student");
			String prn = std.getPrn();
			System.out.println(prn);
			String spass2 = std.getSpass();
			String spass = req.getParameter("spass");
			String nspass = req.getParameter("nspass");
			String cnspass = req.getParameter("cnspass");

			if (nspass.equals(cnspass) && spass.equals(spass2)) {
				SessionFactory factory = HibernateUtilFactroy.getFactory();
				Session s = factory.openSession();
				Transaction tx = s.beginTransaction();
				
				// Hibernate Query for updateing single column using prn number;
				@SuppressWarnings("unchecked")
				Query<Student> q = s.createQuery("update Student set spass=:s where prn=:p");
				q.setParameter("s", cnspass);
				q.setParameter("p", prn);
				int x = q.executeUpdate();
				tx.commit();
				
				if (x >= 1) {
					res.sendRedirect("studentLogin.jsp");
				} else {
					res.sendRedirect("changePassword.jsp");
				}

			} else {
				res.sendRedirect("changePassword.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
