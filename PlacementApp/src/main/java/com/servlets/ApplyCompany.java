package com.servlets;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Info;
import com.entity.Student;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/ApplyCompany")
public class ApplyCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			SessionFactory factory = HibernateUtilFactroy.getFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			//Raw Data
			HttpSession hs = req.getSession();
			Student std = (Student) hs.getAttribute("student");
		
			String hscmarks = std.getHscmarks();
			String diploma = std.getDiploma();
			if(hscmarks==null && diploma!=null) {
				hscmarks = "0";
			}
			//Inserting into info
			Info i = new Info();
			i.setInfoId(new Random().nextInt(10000));
			i.setPrn(std.getPrn());
			i.setCname(req.getParameter("cname"));
			i.setFname(std.getFname());
			i.setLname(std.getLname());
			i.setSemail(std.getSemail());
			i.setBranch(std.getBranch());
			i.setSscmarks(std.getSscmarks());
			i.setHscmarks(hscmarks);
			i.setDiploma(diploma);
			i.setUgmarks(std.getUgmarks());
			
			int c = (Integer) session.save(i);
			tx.commit();
			if(c>=0) {
				res.sendRedirect("StudentHomePage.jsp");
			}else {
				res.sendRedirect("StudentHomePage.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.sendRedirect("StudentHomePage.jsp");
		}

	}
}
