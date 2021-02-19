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

import com.entity.Student;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    		String prn = req.getParameter("prn");
    		String spass = req.getParameter("spass");
    		
    		try {
				SessionFactory factory = HibernateUtilFactroy.getFactory();
				Session session = factory.openSession();
				
				Student std = session.get(Student.class, prn);
				//session.close();
				if(std == null) {
					res.sendRedirect("studentLogin.jsp");
				}
				else {
					if(prn.equals(std.getPrn()) && spass.equals(std.getSpass())) {
						HttpSession hs = req.getSession(true);
						hs.setAttribute("student", std);
						res.sendRedirect("StudentHomePage.jsp");
					}
					else {
						res.sendRedirect("studentLogin.jsp");
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}

}
