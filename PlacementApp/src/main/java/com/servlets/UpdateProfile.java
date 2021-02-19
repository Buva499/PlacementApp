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

import com.entity.Student;
import com.factroy.HibernateUtilFactroy;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			SessionFactory factory = HibernateUtilFactroy.getFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			HttpSession hs = req.getSession();
			Student st = (Student) hs.getAttribute("student");
			Student std = new Student();
			
			std.setPrn(st.getPrn());
			std.setFname(req.getParameter("fname"));
			std.setMname(req.getParameter("mname"));
			std.setLname(req.getParameter("lname"));
			std.setBday(req.getParameter("bday"));	
			std.setSemail(req.getParameter("semail"));
			std.setSphone(req.getParameter("sphone"));
			std.setAddress(req.getParameter("address"));
			std.setBranch(req.getParameter("branch"));
			std.setSkill(req.getParameter("skill"));
			std.setSscmarks(req.getParameter("sscmarks"));
			std.setHscmarks(req.getParameter("hscmarks"));
			std.setDiploma(req.getParameter("diploma"));
			std.setUgmarks(req.getParameter("ugmarks"));
			std.setSpass(st.getSpass());
			std.setGender(st.getGender());
			
			session.update(std);
			tx.commit();
			
			hs.setAttribute("student", std);
			//session.close();
			res.sendRedirect("myProfile.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
