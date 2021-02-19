package com.servlets;

import java.io.IOException;

import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Companies;
import com.entity.Info;
import com.entity.Placement;

import com.entity.Student;
import com.factroy.HibernateUtilFactroy;

@SuppressWarnings("deprecation")
@WebServlet("/Hire")
public class Hire extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings({ "rawtypes" })
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession();
		Companies comp = (Companies) hs.getAttribute("company");
		String cname = comp.getCname();
		String role = comp.getRole();
		String prn = req.getParameter("prn");
		try {
			SessionFactory sf = HibernateUtilFactroy.getFactory();
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			String q = "select * from info where cname=:c and prn=:p"; // SQL Query

			SQLQuery nq = s.createSQLQuery(q);
			nq.setString("c", cname);
			nq.setString("p", prn);
			nq.addEntity(Info.class);
			List student = nq.list();
			
			for (Iterator iterator = student.iterator(); iterator.hasNext();) {
				Info info= (Info) iterator.next();
				String fname = info.getFname();
				String lname = info.getLname();
				String semail = info.getSemail();
				
				//Getting hire date
				LocalDate now = LocalDate.now();
				String date = now.toString();
				
				//Printing for reference
				System.out.println(prn);
				System.out.println(fname);
				System.out.println(lname);
				System.out.println(semail);
				System.out.println(date);
				System.out.println(cname);
				System.out.println(role);
				
				//First Adding Data to placement table then delete it from student table.
				Placement placement = new Placement(prn,fname,lname,semail,date,cname,role);
				String pr = (String) s.save(placement);
				//tx.commit();
				
				if(pr.equals(prn)) {
					//Deleting profile
					Student std = new Student();
					std.setPrn(prn);
					s.delete(std);
					tx.commit();
					//SendPlacedStatus.sendMail(semail, cname, fname);
					res.sendRedirect("recruiterHomePage.jsp");
				}
				else {
					s.delete(placement);
					tx.commit();
					res.sendRedirect("recruiterHomePage.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
