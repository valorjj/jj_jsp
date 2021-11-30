<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="header.jsp"%>

	<!-- 회원 페이지 구역 -->

	<div class="container">
		<form action="signupcontroller.jsp" method="post">
			<input type="text" name="id" placeholder="Ender Id"> <br>
			<input type="password" name="password" placeholder="Enter Password">
			<br> <input type="text" name="name" placeholder="Enter Name">
			<br> <input type="submit" value="회원가입">
		</form>


	</div>


</body>
</html>