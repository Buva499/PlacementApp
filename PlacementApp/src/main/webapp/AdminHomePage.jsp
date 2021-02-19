<%@page import="com.entity.Placement"%>
<%@page import="com.entity.Companies"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.factroy.HibernateUtilFactroy"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="allcssjs.jsp" />
<title>Admin Main Page</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="AdminHomePage.jsp">Admin Portal</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="AdminHomePage.jsp">Home</a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Details </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="companies.jsp">Companies
										List</a></li>
								<li><a class="dropdown-item" href="placedStudentList.jsp">Placed
										Student List</a></li>
								<li><a class="dropdown-item" href="studentList.jsp">Students
										List</a></li>

							</ul></li>

					</ul>
					<ul>
						<li class="d-flex"><a class="nav-link active"
							aria-current="page" href="./AdminLogout">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<br> <br>
		<%
		int st = 0;
		int pl = 0;
		int cm = 0;
		SessionFactory sf = HibernateUtilFactroy.getFactory();
		Session s = sf.openSession();
		String q = "select * from student"; //SQL Query
	
		String qqq = "select * from placement";
		//Student
		SQLQuery nq = s.createSQLQuery(q);
		nq.addEntity(Student.class);
		List student = nq.list();
		
		//Placement
		SQLQuery nqqq = s.createSQLQuery(qqq);
		nqqq.addEntity(Placement.class);
		List place = nqqq.list();
		
		 for (Iterator iterator = student.iterator(); iterator.hasNext();){
	            iterator.next(); 
	            st++;
		 }
		
		 for (Iterator iterator2 = place.iterator(); iterator2.hasNext();){
	            iterator2.next(); 
	            pl++;
		 }
		%>
		<!-- cards -->
		<div class="row">
			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">No of Student Eligible For Drive Currently..</h5>
						<p class="card-text"><%=st %></p>
						
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">No of Student Placed Until Now..</h5>
						<p class="card-text"><%=pl %></p>
					
					</div>
				</div>
			</div>

		</div>
		
	</div>
</body>
</html>