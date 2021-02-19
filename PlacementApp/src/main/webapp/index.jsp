<!doctype html>
<%@page import="java.util.List"%>
<%@page import="com.entity.Companies"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.factroy.HibernateUtilFactroy"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.Iterator"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="allcssjs.jsp" />
<title>Main Page</title>
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
		<h2>Oop's No Details Available For Drive..</h2>
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
				<h5 class="card-title">Please Login And Apply For Drive</h5>

			</div>
		</div>
		<br>
		<%
			}
			}
		%>
	</div>
	<br>
	<footer style="position: sticky; bottom: 0; width: 100%;">
		<div class="card-footer text-muted">
			<marquee style="color: red;">If your are not able to login
				your profile after conducting a drive please check placed student
				list may be you are there.. Congratulation..</marquee>
		</div>
	</footer>

</body>
</html>