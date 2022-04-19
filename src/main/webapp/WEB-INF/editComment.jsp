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
	<div class="d-flex justify-content-between align-items-center">
		<h1 class="display-2">Welcome, ${sessionScope.userName}</h1>
		<a class="btn btn-primary" href="/logout">Logout</a>
	</div>
	<hr>
	
	<div class="d-flex justify-content-center w-80">
		<form:form class="w-50" action="/update" method="post" modelAttribute="updateComment">
			<form:input type="hidden" path="id"/>
			<form:hidden value="${currentUser.id}" path="user"/>
			<form:label path="comment" class="form-label">Comment: </form:label><br>
			<form:errors path="comment"/>
			<form:textarea path="comment" class="form-control"/>
			<input class="btn btn-primary" type='submit' value='Update'/>
		</form:form>
	</div>

</body>
</html>