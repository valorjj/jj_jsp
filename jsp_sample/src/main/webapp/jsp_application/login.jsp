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
	
	<div class="container">
		<h3 style="color : skyblue; border-bottom: solid 2px #cccccc" class="p-2">로그인 페이지</h3>
		
		<form class="form-check-inline" action="logincontroller.jsp" method="post" >
		
			<div class="form-group">
				<label>ID</label>
				<input class="form-contorl" type="text" name="id" placeholder="Enter Id">
			</div>
			
			<div class="form-group">
				<label>password</label>
				<input class="form-contorl" type="password" name="password" placeholder="Enter Password">
			</div>
			
			<div class="form-group">
				<input type="submit" value="LOGIN">
			</div>
		</form>
	</div>

	<%
	String result = request.getParameter("result");
	%>
	<%
		if (result != null) {
	%>
		<h4>login failed</h4>
	<%
		}
	%>

</body>
</html>