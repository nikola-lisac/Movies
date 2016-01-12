<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Login</title>
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
	<c:if test="${param.error != null }">
		<p class="error">Login failed!</p>
	</c:if>
	<div class="container">
		<form class="form form-horizontal"
			action='${pageContext.request.contextPath}/login' method='POST'>
			<div class="form-group">
				<label class="control-label  col-sm-2">Username:</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="username">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label  col-sm-2">Password:</label>
				<div class="col-sm-6">
				 <input class="form-control" type="password" name="password">
				 </div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label><input type="checkbox" name="remember-me"
							checked="checked" />Remember me</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input class="btn btn-info btn-lg"
						type="submit" value="log in">
				</div>
			</div>
		</form>
	</div>
</body>
</html>