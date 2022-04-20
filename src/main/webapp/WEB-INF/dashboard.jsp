<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sports App</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/api-football.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">   
</head>
<body>
	<div class="d-flex justify-content-between align-items-center">
		<h1 class="display-2">Welcome, ${sessionScope.userName}</h1>
		<a class="btn btn-primary" href="/logout">Logout</a>
	</div>
	<hr>
	
	<h3 class="display-3 d-flex justify-content-center">Today's Fixture's:</h3>
	<!-- Change title based  -->
	<!-- <select> -->
	<!--	<option></option> Fixtures -->
	<!-- 	<option></option>Standings -->
	<!--  </select>-->
	<!-- Need to add a way to filter/change out what is displayed. For example, from fixtures to standings, will probably require API integration into the DB.  -->
	
  	<div class="d-flex justify-content-center">
			<div id="wg-api-football-livescore"
    			data-host="v3.football.api-sports.io"
    			data-refresh="0"
    			data-key="API_KEY_HERE"
    			data-theme="false"
    			data-show-errors="false"
    			class="api_football_loader">
			</div>
			<script
    			type="module"
    			src="https://widgets.api-sports.io/football/1.1.8/widget.js">
			</script>
		</div><br>
		
	<div class="d-flex justify-content-center">
		<table class="table table-striped table-hover">
			<c:forEach var="comments" items="${allComments}">
			<tr>
				<td>${comments.user.name}</td>
				<td>${comments.comment} 
				<c:choose>
					<c:when test="${sessionScope.userID == comments.user.id }">
					 	<a href="/football/${comments.id}/edit" class="btn btn-outline-primary btn-sm">Edit</a> <a href="/football/delete/${comments.id}" class="btn btn-outline-danger btn-sm">Delete</a>
					</c:when>
				</c:choose>
				</td>	
			</tr>
			</c:forEach>	
		</table>
	</div>
	<br>
	<br>
	
	<div class="d-flex justify-content-center w-80">
		<form:form class="w-50" action="/add" method="post" modelAttribute="newComment">
			<form:hidden value="${currentUser.id}" path="user"/>
			<form:label path="comment" class="form-label">Comment: </form:label><br>
			<form:errors path="comment"/>
			<form:textarea path="comment" class="form-control"/>
			<input class="btn btn-primary" type='submit' value='Submit'/>
		</form:form>
	</div>
</body>
</html>
