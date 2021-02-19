<%@page import="com.entity.Placement"%>
<%@page import="com.entity.Info"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.factroy.HibernateUtilFactroy"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.entity.Companies"%>
<%@page import="com.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="allcssjs.jsp" />
<title>Recruiter Main Page</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<a class="navbar-brand" href="StudentHomePage.jsp">Welcome <%
					HttpSession hs = request.getSession();
					Companies c = (Companies) hs.getAttribute("company");
					String cname = c.getCname();
				%><%=cname%></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					</ul>
					<ul>
						<li class="d-flex"><a class="nav-link active"
							aria-current="page" href="./RecruiterLogout">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<br> <br>
		<!-- List of Students Who Applied -->
		<%
			//Getting All the data of Student
			SessionFactory sf = HibernateUtilFactroy.getFactory();
			Session s = sf.openSession();
			String q = "select * from info where cname=:c"; //SQL Query

			SQLQuery nq = s.createSQLQuery(q);
			nq.setString("c", cname);
			nq.addEntity(Info.class);
			List student = nq.list();

			if (student.isEmpty()) {
		%>
		<h1>No Student Data Available..</h1>
		<%
			} else {
		%>
		<!-- List of Student -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">PRN</th>

					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Email</th>
					<th scope="col">10th</th>
					<th scope="col">12th</th>
					<th scope="col">Diploma</th>
					<th scope="col">Degree</th>
					<th scope="col">Branch</th>
					<th scope="col">Hire Status</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Iterator iterator = student.iterator(); iterator.hasNext();) {
							Info std = (Info) iterator.next();
				%>
				<tr>
					<th scope="row"><%=std.getPrn()%></th>
					<td><%=std.getFname()%></td>
					<td><%=std.getLname()%></td>
					<td><%=std.getSemail()%></td>
					<td><%=std.getSscmarks()%></td>
					<td><%=std.getHscmarks()%></td>
					<td><%=std.getDiploma()%></td>
					<td><%=std.getUgmarks()%></td>
					<td><%=std.getBranch()%></td>
					<%
						String prn = std.getPrn();
								String qq = "select * from placement where prn=:p and cname=:c"; //SQL Query

								SQLQuery nqq = s.createSQLQuery(qq);
								nqq.setString("p", prn);
								nqq.setString("c", c.getCname());
								nqq.addEntity(Placement.class);
								List info = nqq.list();
								if (info.isEmpty()) {
					%>
					<td><a href="./Hire?prn=<%=std.getPrn()%>"><button
								class="btn btn-outline-dark">Hire</button></a></td>
					<%
						} else {
					%>
					<td><button class="btn btn-outline-dark">Hired</button></td>
					<%
						}
					%>
				
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<!-- End -->
		<%
			}
		%>


	</div>
</body>
</html>