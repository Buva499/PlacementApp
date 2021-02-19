<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="allcssjs.jsp" />
<title>Student Login</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">Student Login</a>
			</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>

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
		</nav>
		<br> <br>
		<!-- Login Action -->
		<form action="StudentLogin" method="post" class="container-fluid">
			<div class="mb-3">
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<label for="exampleInputEmail1" class="col-form-label">Enter
							PRN</label>
					</div>
					<div class="col-auto">
						<input type="text" id="exampleInputEmail1" class="form-control"
							aria-describedby="passwordHelpInline" name="prn" required>
					</div>

				</div>
				<div id="emailHelp" class="form-text">We'll never share your
					info with anyone else.</div>
			</div>
			<div class="row g-3 align-items-center">
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">Password</label>
				</div>
				<div class="col-auto">
					<input type="password" id="inputPassword6" class="form-control"
						aria-describedby="passwordHelpInline" name="spass" required>
				</div>

			</div>
			<div id="emailHelp" class="form-text">Must be 8-20 characters
				long.</div>
			<br>
			<button type="submit" class="btn btn-primary">login</button>
		</form>
		<!-- End -->
	</div>
</body>
</html>