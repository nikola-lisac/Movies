<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Add new movie</title>
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
		<form class="form form-horizontal" action='<c:url value="/addmovie"/>'
			method="post">
			<div class="form-group">
				<label class="control-label  col-sm-2">Name: </label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label  col-sm-2">Year: </label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="year">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label  col-sm-2">Genre: </label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="genre">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label  col-sm-2">Director: </label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="director">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label  col-sm-2">Runtime: </label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="runtime">
				</div>
			</div>
			<div class="form-group">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit"
						class="btn btn-info btn-lg" value="add">
				</div>
			</div>
		</form>
	</div>
</body>
</html>