<%@page import="com.entity.Companies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>Add Companies</title>

<!-- Icons font CSS-->
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">

<!-- Main CSS-->
<link href="css/main.css" rel="stylesheet" media="all">

<title>Edit Company</title>
</head>
<body>
<%
	HttpSession s = request.getSession();
	Companies c = (Companies) s.getAttribute("company");

%>
	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">Company Details</h2>
					<form action="CompanyEditConfirm" method="post">
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Company Name</label> <input
										class="input--style-4" type="text" name="cname"
										 value="<%=c.getCname() %>" readonly="readonly">
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">Criteria</label> <input
										class="input--style-4" type="text" name="criteria" value="<%=c.getCriteria() %>" required>
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">Role</label> <input class="input--style-4"
										type="text" name="role" value="<%=c.getRole() %>" required>
								</div>
							</div>

						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Drive Date</label>
									<div class="input-group-icon">
										<input class="input--style-4 js-datepicker" type="text"
											name="date" value="<%=c.getDate() %>" required> <i
											class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
									</div>
								</div>
							</div>

						</div>

						<div class="input-group">
							<label class="label">Password</label>
							<div class="rs-select2 js-select-simple select--no-search">
								<input class="input--style-4" type="password" name="cpass"
									value="<%=c.getCpass() %>" required>
							</div>
						</div>
						<div class="p-t-15">
							<button class="btn btn--radius-2 btn--blue" type="submit">Edit Company</button>
						</div>
					</form>
					<div class="p-t-15">
							<a href="AdminHomePage.jsp"><button class="btn btn--radius-2 btn--blue">Back</button></a>
						</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/datepicker/moment.min.js"></script>
	<script src="vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="js/global.js"></script>

</body>
</html>