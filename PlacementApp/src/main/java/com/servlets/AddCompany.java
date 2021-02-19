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

import com.entity.Companies;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/AddCompany")
public class AddCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	try {
			SessionFactory factory = HibernateUtilFactroy.getFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			Companies c = new Companies();
			c.setCname(req.getParameter("cname"));
			c.setCpass(req.getParameter("cpass"));
			c.setCriteria(req.getParameter("criteria"));
			c.setRole(req.getParameter("role"));
			c.setDate(req.getParameter("date"));
			
			String cn = (String) session.save(c);
			tx.commit();
			
			if(cn.equals(c.getCname())) {
				res.sendRedirect("companies.jsp");
			}
			else {
				res.sendRedirect("addCompanies.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

}
