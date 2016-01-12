<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/main.css"
	rel="stylesheet" type="text/css" />
<link href='https://fonts.googleapis.com/css?family=Comfortaa|Sarina'
	rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/script.js"></script>
<title>Register</title>
</head>
<body>

	<div class="container">
		<nav class="navbar navbar-inverse navbar-custom">
			<div class="navbar-inner">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/">Movies</a>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li><a href="${pageContext.request.contextPath}/allmovies">All
									movies</a></li>
							<sec:authorize access="isAuthenticated()">
								<li><a href="${pageContext.request.contextPath}/newmovie">Add</a></li>
								<li><a
									href="${pageContext.request.contextPath}/editordelete">Edit/Delete</a></li>
							</sec:authorize>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<sec:authorize access="isAuthenticated()">
								<li><c:url var="logoutUrl" value="/logout" />
									<form class="navbar-form" action="${logoutUrl}" method="post">
										<input type="submit" class="btn-link" value="Log out" /> <input
											type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</form></li>
							</sec:authorize>
							<sec:authorize access="!isAuthenticated()">
								<li><a href="${pageContext.request.contextPath}/login">Log
										in</a></li>
								<li><a href="${pageContext.request.contextPath}/register">Sign
										up</a></li>
							</sec:authorize>

						</ul>
					</div>
				</div>
			</div>
		</nav>
	</div>

	<div class="container">
		<sf:form action="${pageContext.request.contextPath}/newuser"
			method="POST" commandName="user" cssClass="form form-horizontal">
			<div class="form-group">
				<label class="control-label  col-sm-3">Username:</label>
				<div class="col-sm-6">
					<sf:input cssClass="form-control" path="username" name="username" />
					<div class="error">
						<sf:errors path="username"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label  col-sm-3">Email:</label>
				<div class="col-sm-6">
					<sf:input cssClass="form-control" path="email" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label  col-sm-3">Password:</label>
				<div class="col-sm-6">
					<sf:password cssClass="form-control" id="password" path="password" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label  col-sm-3">Confirm password:</label>
				<div class="col-sm-6">
					<input class="form-control" id="confirmpass" name="confirmpass"
						type="password" />
					<div id="matchpass" class="error"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<input class="btn btn-info btn-lg" type="submit" value="submit" />
				</div>
			</div>
		</sf:form>
	</div>
</body>
</html>