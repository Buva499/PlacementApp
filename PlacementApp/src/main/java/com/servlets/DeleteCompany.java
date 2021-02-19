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
import org.hibernate.query.NativeQuery;


import com.entity.Companies;

import com.factroy.HibernateUtilFactroy;

@WebServlet("/DeleteCompany")
public class DeleteCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	@SuppressWarnings({  "rawtypes" })
	@Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	try {
			String cname = req.getParameter("cname");
			SessionFactory factory = HibernateUtilFactroy.getFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			Companies c = new Companies();
			c.setCname(cname);
			
			session.delete(c);
		
			//Deleting from info..
		
			String q = "delete from `info` where cname=:c"; //SQL Query
			NativeQuery nq = session.createSQLQuery(q);
			nq.setParameter("c", cname);
			int r = nq.executeUpdate();
		
			if(r>=1) {
				tx.commit();
				res.sendRedirect("companies.jsp");
			}
			else {
				res.sendRedirect("companies.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.sendRedirect("companies.jsp");
		}
    	
    }
}
