package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Student;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/DeleteStudent")
public class DeleteStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String prn = req.getParameter("prn");
			if(prn!=null) {
				SessionFactory factory = HibernateUtilFactroy.getFactory();
				Session ss = factory.openSession();
				Transaction tx = ss.beginTransaction();
				Student std = new Student();
				std.setPrn(prn);
				ss.delete(std);
				tx.commit();
				
				res.sendRedirect("studentList.jsp");
			}
			else {
				res.sendRedirect("studentList.jsp");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
