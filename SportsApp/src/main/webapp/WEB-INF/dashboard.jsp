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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">   
</head>
<body>
	<h1>Welcome, ${sessionScope.userName}</h1>
	<a href="/logout">Logout</a>
	<p>Today's Fixture's:</p>
	<!-- Need to add a way to filter/change out what is displayed. For example, from fixtures to  -->
	
<!--  	<div id="wg-api-football-livescore"
    	data-host="v3.football.api-sports.io"
    	data-refresh="0"
    	data-key="ab962ddaed367cbc25b0914419164e3e"
    	data-theme="dark"
    	data-show-errors="true"
    	class="api_football_loader">
	</div>
	<script
    	type="module"
    	src="https://widgets.api-sports.io/football/1.1.8/widget.js">
	</script>
	-->
	<div class=".container">
		<c:forEach var="comments" items="${allComments}">
			<p>${comments.comment}<a href="/football/${comments.id}/edit">Edit</a> <a href="/football/delete/${comments.id}">Delete</a></p><!-- Needs buttons for logged in users to edit/ delete. -->
		</c:forEach>
	</div>
	<br>
	<br>
	
	<form:form action="/add" method="post" modelAttribute="newComment">
		<form:hidden value="${currentUser.id}" path="user"/>
		<form:label path="comment">Comment: </form:label><br>
		<form:errors path="comment"/>
		<form:textarea path="comment"/>
		<input type='submit' value='Submit'/>
	</form:form>
		

</body>
</html>