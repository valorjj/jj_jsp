<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="jsp_check_2.tictactoe.jsp" method="get">
	<!-- 여기서 예외처리는 어떻게 해야해? 1~9 까지만 입력 받아야하는데  -->
		<h3> 선택 </h3>
		<input type="text" name="position" placeholder="위치">
		<input type="submit" name="button" value="선택">
	</form>


	<form action="jsp_check_2.tictactoe.jsp" method="get">
		<table>
			<tr>
				<%
				for (int i = 1; i <= 9; i++) {
				%>
				<%
				if (i % 3 == 0) {
				%>

				</tr>
				<tr>

				<%
				}
				%>

				<%
				}
				%>
			<tr>
		</table>
	</form>
	
	
</body>
</html>