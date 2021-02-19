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

import com.entity.Placement;
import com.entity.Student;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/RegisterStudent")
public class RegisterStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			try {
				SessionFactory factory = HibernateUtilFactroy.getFactory();
				Session session = factory.openSession();
				Transaction tx = session.beginTransaction();
				String prn = req.getParameter("prn");
				Placement p = session.get(Placement.class, prn);
				if(p == null) {
					Student std = new Student();
					std.setPrn(req.getParameter("prn"));
					std.setFname(req.getParameter("fname"));
					std.setMname(req.getParameter("mname"));
					std.setLname(req.getParameter("lname"));
					std.setBday(req.getParameter("bday"));
					std.setGender(req.getParameter("gender"));
					std.setSemail(req.getParameter("semail"));
					std.setSphone(req.getParameter("sphone"));
					std.setSpass(req.getParameter("spass"));
					
					String save = (String) session.save(std);
					tx.commit();
					if(save.equals(req.getParameter("prn"))) {
						res.sendRedirect("studentLogin.jsp");
					}
					else {
						res.sendRedirect("StudentRegister.jsp");
					}
					
				}
				else {
					res.sendRedirect("index.jsp");
				}
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		
	}
	
}
