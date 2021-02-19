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

@WebServlet("/RecruiterLogin")
public class RecruiterLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	try {
    		String cname = req.getParameter("cname");
        	String cpass = req.getParameter("cpass");
        	
        	SessionFactory factory = HibernateUtilFactroy.getFactory();
        	Session session = factory.openSession();
        	Companies comp = session.load(Companies.class, cname);
        	
        	if(cname.equals(comp.getCname()) && cpass.equals(comp.getCpass())) {
        		HttpSession hs = req.getSession(true);
        		hs.setAttribute("company", comp);
        		res.sendRedirect("recruiterHomePage.jsp");
        	}
        	else {
        		res.sendRedirect("recruiterLogin.jsp");
        	}
		} catch (Exception e) {
			res.sendRedirect("recruiterLogin.jsp");
			e.printStackTrace();
		}
    }

}
