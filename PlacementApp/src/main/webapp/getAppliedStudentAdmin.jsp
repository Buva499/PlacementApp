<%@page import="java.util.List"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.factroy.HibernateUtilFactroy"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.entity.Info"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="allcssjs.jsp" />

<title>Student For <%=request.getParameter("cname")%></title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
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
		<button id="download" class="btn btn-outline-dark">Download List</button><br>
		<div id="invoice">
			<!-- List of Students Who Applied -->
			<%
				//Getting All the data of Student
				String cname = request.getParameter("cname");
				SessionFactory sf = HibernateUtilFactroy.getFactory();
				Session s = sf.openSession();
				String q = "select * from info where cname=:c"; //SQL Query

				SQLQuery nq = s.createSQLQuery(q);
				nq.setString("c", cname);
				nq.addEntity(Info.class);
				List student = nq.list();

				if (student.isEmpty()) {
			%>
			<br>
			<h1>
				List of Applied Student for
				<%=cname%></h1>
			<br>
			<h1>No Student Data Available..</h1>
			<%
				} else {
			%>
			<h1>
			<br>
				List of Applied Student for
				<%=cname%></h1>
			<br>
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

	</div>

	<!-- Script code for download -->

	<script type="text/javascript">
	window.onload = function () {
	    document.getElementById("download")
	        .addEventListener("click", () => {
	            const invoice = this.document.getElementById("invoice");
	            console.log(invoice);
	            console.log(window);
	            var opt = {
	                margin: 1,
	                filename: 'myfile.pdf',
	                image: { type: 'jpeg', quality: 0.98 },
	                html2canvas: { scale: 2 },
	                jsPDF: { unit: 'in', format: 'letter', orientation: 'landscape' }
	            };
	            html2pdf().from(invoice).set(opt).save();
	        })
	}
	</script>
</body>
</html>