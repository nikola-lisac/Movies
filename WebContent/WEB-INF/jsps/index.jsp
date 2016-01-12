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
<title>Movies</title>
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
							<li><a href="${pageContext.request.contextPath}/allmovies">All movies</a></li>
							<sec:authorize access="isAuthenticated()">
								<li><a href="${pageContext.request.contextPath}/newmovie">Add</a></li>
								<li><a href="${pageContext.request.contextPath}/editordelete">Edit/Delete</a></li>
							</sec:authorize>
						</ul>
						<ul class="nav navbar-nav navbar-right">
						<sec:authorize access="isAuthenticated()">
								<li><a href="${pageContext.request.contextPath}/"><sec:authentication property="principal.username"/></a>
								<li><c:url var="logoutUrl" value="/logout" />
									<form class="navbar-form" action="${logoutUrl}" method="post">
										<input type="submit" class="btn-link" value="Log out" /> 
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form>
								</li>
							</sec:authorize>
							<sec:authorize access="!isAuthenticated()">
								<li><a href="${pageContext.request.contextPath}/login">Log in</a></li>
								<li><a href="${pageContext.request.contextPath}/register">Sign up</a></li>
							</sec:authorize>
						
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<div class="jumbotron">
		<span id="logo"></span>
		<div class="jumbotext text-center">
			<h1>Movies</h1>
			<h4>Spring framework project</h4>
			<c:if test="${message != null }">
				<div class="message">
					<h3>
						<c:out value="${message}"></c:out>
					</h3>
				</div>
			</c:if>
		</div>
	</div>
	<div class="container content">
		<div class="jumbotron jumbostyle">
			
			<div class="text-center">
				<div class="jumbotext">

					<div class="form-group col-md-6">
					<h4>Search by name, director or year</h4>
						<form action='<c:url value="/search"/>'>
							<input class="form-control" type="text" name="keyword"> <input
								type="submit" class="btn btn-info btn-lg" value="search">
						</form>
					</div>
					<div class="jumbotext col-md-6">
						<p class="text">Search our awesome database with the whooping 10 movies and see info on mostly everything, but not about the main roles or anything like that.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>