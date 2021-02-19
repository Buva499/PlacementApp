
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Student"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.query.NativeQuery"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.factroy.HibernateUtilFactroy"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="allcssjs.jsp" />
<title>Student List</title>
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
			//Getting All the data of Student
			SessionFactory sf = HibernateUtilFactroy.getFactory();
			Session s = sf.openSession();
			String q = "select * from student"; //SQL Query
			
			SQLQuery nq = s.createSQLQuery(q);
			nq.addEntity(Student.class);
			List student = nq.list();
		
		%>
		<!-- List of Student -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">PRN</th>
					<th scope="col">First Name</th>
					<th scope="col">Middle Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Email</th>
					
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
				 for (Iterator iterator = student.iterator(); iterator.hasNext();){
			            Student std = (Student) iterator.next(); 
			            
				%>
				<tr>
					<th scope="row">
						<%= std.getPrn()%>
					</th>
					<td><%= std.getFname()%></td>
					<td><%= std.getMname()%></td>
					<td><%= std.getLname()%></td>
					<td><%= std.getSemail()%></td>
					
					<td><a href="./DeleteStudent?prn=<%=std.getPrn()%>"><button class="btn btn-outline-dark">delete</button></a></td>	
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