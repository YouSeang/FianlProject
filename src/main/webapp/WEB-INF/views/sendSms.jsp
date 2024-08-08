<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>LocKB</title>
</head>
<body>
	<h2>Send SMS</h2>
	<form action="sendSms" method="post">
		<label for="to">To:</label> <input type="text" id="to" name="to"
			required> <br> <label for="text">Message:</label>
		<textarea id="text" name="text" required></textarea>
		<br>
		<button type="submit">Send</button>
	</form>
	<br>
	<c:if test="${not empty message}">
		<p>${message}</p>
	</c:if>

</body>
</html>