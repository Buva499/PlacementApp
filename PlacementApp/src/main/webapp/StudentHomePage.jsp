<%@page import="com.entity.Companies"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.factroy.HibernateUtilFactroy"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.entity.Student"%>
<%@page import="com.entity.Info"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="allcssjs.jsp" />
<title>Student Main Page</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<a class="navbar-brand" href="StudentHomePage.jsp">Welcome <%
					HttpSession hs = request.getSession();
					if (hs == null) {
						response.sendRedirect("studentLogin.jsp");
					}
					Student std = (Student) hs.getAttribute("student");
					String fname = std.getFname();
				%><%=fname%></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">


						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Details </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="myProfile.jsp">My
										Profile</a></li>
								<li><a class="dropdown-item" href="changePassword.jsp">Change
										Password</a></li>
								<li><a class="dropdown-item" href="yourCompanies.jsp">Applied
										Companies</a></li>

							</ul></li>

					</ul>
					<ul>
						<li class="d-flex"><a class="nav-link active"
							aria-current="page" href="./StudentLogout">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<br> <br>
		<!-- cards for companies-->
		<div class="container">
			<%
				//Getting All the data of Companies
				SessionFactory sf = HibernateUtilFactroy.getFactory();
				Session s = sf.openSession();
				String q = "select * from companies"; //SQL Query

				SQLQuery nq = s.createSQLQuery(q);
				nq.addEntity(Companies.class);
				List company = nq.list();

				if (company.isEmpty()) {
			%>
			<h2>Oop's No Details Available For Drive</h2>
			<%
				} else {

					for (Iterator iterator = company.iterator(); iterator.hasNext();) {
						Companies c = (Companies) iterator.next();
			%>



			<div class="card">
				<div class="card-header"><%=c.getCname()%></div>
				<div class="card-body">
					<h5 class="card-title">
						Role :
						<%=c.getRole()%></h5>
					<h5 class="card-title">
						Criteria :
						<%=c.getCriteria()%></h5>
					<h5 class="card-title">
						Drive Date :
						<%=c.getDate()%></h5>
					<!-- Add code here -->
						<%
							String prn = std.getPrn();
								String qq = "select * from info where prn=:p and cname=:c"; //SQL Query

								SQLQuery nqq = s.createSQLQuery(qq);
								nqq.setString("p", prn);
								nqq.setString("c", c.getCname());
								nqq.addEntity(Info.class);
							
								List info = nqq.list();
								if (info.isEmpty()) {
						%>
						<a href="./ApplyCompany?cname=<%=c.getCname()%>"
							class="btn btn-primary">Apply</a>
						<%
							} else {
						%>
						<button class="btn btn-primary">Applied</button>
						<%
							}
						%>
				</div>
			</div>
			<br>
			<%
				}
				}
			%>

		</div>

	</div>
	<br>
	<footer style="position: sticky; bottom: 0; width: 100%;">
		<div class="card-footer text-muted">
			<marquee style="color: red;">Please update your profile
				each and every time when you apply for new drive..</marquee>
		</div>
	</footer>
</body>
</html>