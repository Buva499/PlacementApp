<%@page import="java.util.List"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.factroy.HibernateUtilFactroy"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.entity.Placement"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="allcssjs.jsp" />
<title>Placed Student</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">Placement Portal</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="MainPagePlacedStudent.jsp">Placed
								Student</a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Login </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="adminLogin.jsp">Admin
										Login</a></li>
								<li><a class="dropdown-item" href="recruiterLogin.jsp">Recruiter
										Login</a></li>
								<li><a class="dropdown-item" href="studentLogin.jsp">Student
										Login</a></li>

							</ul></li>

					</ul>
					<ul>
						<li class="d-flex"><a class="nav-link active"
							aria-current="page" href="StudentRegister.jsp">Student
								Register</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<br>
	<br>
	<div class="container">
	<%
			//Getting All the data of Student
			SessionFactory sf = HibernateUtilFactroy.getFactory();
			Session s = sf.openSession();
			String q = "select * from placement"; //SQL Query

			SQLQuery nq = s.createSQLQuery(q);
			nq.addEntity(Placement.class);
			List placed = nq.list();
		%>
		<!-- List of Student -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">PRN</th>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Company Name</th>
					<th scope="col">Role</th>
					<th scope="col">Placed Date</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Iterator iterator = placed.iterator(); iterator.hasNext();) {
						Placement pl = (Placement) iterator.next();
				%>
				<tr>
					<th scope="row"><%=pl.getPrn()%></th>
					<td><%=pl.getFname()%></td>
					<td><%=pl.getLname()%></td>
					<td><%=pl.getCname()%></td>
					<td><%=pl.getRole()%></td>
					<td><%=pl.getDate()%></td>
				
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<!-- End -->
	</div>
</body>
</html>