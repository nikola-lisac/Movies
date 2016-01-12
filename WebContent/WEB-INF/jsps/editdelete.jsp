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
<title>Edit or delete a movie</title>
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

<div class="container responsive">
	<form action='<c:url value="/editdelete" />' method="post">
	<table class="table table-striped">
		<thead class="text">
			<tr>
				<td>Select a movie</td>
				<td>Name</td>
				<td>Year</td>
				<td>Genre</td>
				<td>Director</td>
				<td>Runtime</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="movie" items="${movies}" varStatus="status">
				<tr>
					<td><input type="radio" name="id" value="${movie.id}" ${status.first ? 'checked="checked"' : ''}></td>
					<td>${movie.name}</td>
					<td>${movie.year}</td>
					<td>{movie.genre}</td>
					<td>${movie.director}</td>
					<td>${movie.runtime}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input class="btn btn-info btn-lg" type="submit" name="edit" value="edit">
		<input class="btn btn-info btn-lg" type="submit" name="delete" value="delete">
		
	</form>
	</div>
</body>
</html>