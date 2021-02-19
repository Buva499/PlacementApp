
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Student"%>
<%@page import="com.entity.Info"%>
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
<title>Applied Companies List</title>
</head>
<body>
	<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<a class="navbar-brand" href="StudentHomePage.jsp">Welcome <%
					HttpSession hs = request.getSession();
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
		<%
			//Getting All the data of Student
			SessionFactory sf = HibernateUtilFactroy.getFactory();
			Session s = sf.openSession();
			
			String q = "select * from info where prn=:p"; //SQL Query
			
			SQLQuery nq = s.createSQLQuery(q);
			nq.setString("p", std.getPrn());
			nq.addEntity(Info.class);
			List info = nq.list();
		
		%>
		<!-- List of Student -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">Company Name</th>
				
				</tr>
			</thead>
			<tbody>
				<%
				 for (Iterator iterator = info.iterator(); iterator.hasNext();){
			            Info ii = (Info) iterator.next(); 
			            
				%>
				<tr>
					<th scope="row">
						<%= ii.getCname()%>
					</th>
					
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