<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Questionaire</h1>
	<form action="request_result.jsp" method="post">
		
		Name : <input type="text" name="name">
		<br>
		StudentId : <input type="text" name="studentID">
		<br>
		Gender : Man <input type="radio" name="gender" value="man" checked="checked">
		Woman <input type="radio" name="gender" value="woman">
		<br>
		Major : 
		
		<select name="major">
			<option value="Mechical Engineering">Mechical Engineering</option>
			<option value="Physics">Physics</option>
			<option value="Dance">Dance</option>
			<option value="Computer Engineering">Computer Engineering</option>
			<option value="Chemical Engineering">Chemical Engineering</option>
		</select>
		
		<input type="submit" value="submit">
		
	
	
	</form>

</body>
</html>