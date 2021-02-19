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

import com.entity.Companies;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/CompanyEditConfirm")
public class CompanyEditConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	
    	try {
			SessionFactory factory = HibernateUtilFactroy.getFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			Companies c = new Companies();
			c.setCname(req.getParameter("cname"));
			c.setCriteria(req.getParameter("criteria"));
			c.setRole(req.getParameter("role"));
			c.setDate(req.getParameter("date"));
			c.setCpass(req.getParameter("cpass"));
			
			session.update(c);
			tx.commit();
			HttpSession hs = req.getSession();
			hs.setAttribute("company", c);
			
			res.sendRedirect("editCompany.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

}
